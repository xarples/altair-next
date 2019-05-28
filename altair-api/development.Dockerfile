FROM node:10

WORKDIR /usr/local/src/altair/altair-api

COPY ./altair-config/package* /usr/local/src/altair/altair-config/

RUN cd /usr/local/src/altair/altair-config && npm install

COPY ./altair-config/* /usr/local/src/altair/altair-config/

COPY ./altair-utils/package* /usr/local/src/altair/altair-utils/

RUN cd /usr/local/src/altair/altair-utils && npm install

COPY ./altair-utils/* /usr/local/src/altair/altair-utils/

COPY ./altair-api/package* /usr/local/src/altair/altair-api/

RUN cd /usr/local/src/altair && ls -l

RUN npm install

COPY ./altair-api/* /usr/local/src/altair/altair-api/

EXPOSE 5000

CMD ["npm", "run", "dev"]