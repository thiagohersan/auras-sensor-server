FROM node:4.8.7-stretch

ADD package.json /tmp/package.json
RUN cd /tmp && npm install
RUN mkdir -p /opt/server && cp -a /tmp/node_modules /opt/server/

RUN mkdir -p /opt/server/app/bin
WORKDIR /opt/server/app/bin

WORKDIR /opt/server
ADD package.json /opt/server/
ADD app/*.js /opt/server/app/

CMD ["npm", "run", "start"]