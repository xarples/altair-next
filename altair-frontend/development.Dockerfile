FROM node:10

WORKDIR /usr/local/src/altair/altair-frontend

COPY ./altair-frontend/package* /usr/local/src/altair/altair-frontend/

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "run", "dev"]