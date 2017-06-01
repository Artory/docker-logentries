FROM node:7-alpine

RUN apk add --no-cache bash

# Minimal yarn installation
RUN apk add --no-cache --virtual .yarn-deps curl gnupg tar && \
    curl -o- -L https://yarnpkg.com/install.sh | sh && \
    apk del .yarn-deps

WORKDIR /usr/src/app

COPY package.json package.json
COPY yarn.lock yarn.lock

RUN $HOME/.yarn/bin/yarn install --no-emoji --no-progress --pure-lockfile

COPY index.js /usr/src/app/index.js

ENTRYPOINT ["/usr/src/app/index.js"]
CMD []

