# docker-logentries
#
# VERSION 0.2.0

FROM node:0.12-onbuild
MAINTAINER Rapid 7 - Logentries <support@logentries.com>

WORKDIR /usr/src/app
COPY npm-shrinkwrap.json npm-shrinkwrap.json
RUN npm install --production
COPY index.js /usr/src/app/index.js

ENTRYPOINT ["/usr/src/app/index.js"]
CMD []
