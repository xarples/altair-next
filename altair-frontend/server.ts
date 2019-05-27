import http from 'http';
import express from 'express';
import { Nuxt, Builder } from 'nuxt';
import altairConfig from '@xarples/altair-config';
import { default as config } from './nuxt.config';

const nuxt = new Nuxt(config);
const app = express();
const server = http.createServer(app);

config.dev = !(process.env.NODE_ENV === 'production');

if (config.dev) {
  const builder = new Builder(nuxt);
  builder.build();
}

app.use(nuxt.render);

server.listen(altairConfig.port, () => {
  console.log(`Server listening on http://localhost:${altairConfig.port}`);
});
