###############################################################################
# Step 1 : Config image
#
FROM node:10 as config

WORKDIR /usr/local/src/altair/altair-config

COPY ./altair-config/* /usr/local/src/altair/altair-config/

RUN cd /usr/local/src/altair/altair-config && npm install

RUN npm run build

###############################################################################
# Step 2 : Utils image
#
FROM node:10 as utils

WORKDIR /usr/local/src/altair/altair-utils

COPY ./altair-utils/* /usr/local/src/altair/altair-utils/

RUN cd /usr/local/src/altair/altair-utils && npm install

RUN npm run build


###############################################################################
# Step 3 : Builder image
#
FROM node:10 as builder

WORKDIR /usr/local/src/altair/altair-api

COPY ./altair-api/* /usr/local/src/altair/altair-api/

RUN cd /usr/local/src/altair/altair-api && npm install

RUN npm run build

###############################################################################
# Step 4 : Run image
#
FROM node:10 

WORKDIR /usr/local/src/altair/altair-api

COPY --from=config /usr/local/src/altair/altair-config/dist /usr/local/src/altair/altair-config/dist

COPY --from=utils /usr/local/src/altair/altair-utils/dist /usr/local/src/altair/altair-utils/dist

COPY --from=builder /usr/local/src/altair/altair-api/build /usr/local/src/altair/altair-api/build

EXPOSE 5000

CMD ["npm", "start"]