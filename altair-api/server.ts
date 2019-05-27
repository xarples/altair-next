import http from 'http';
import express from 'express';
import altairConfig from '@xarples/altair-config'

const { api } = altairConfig;
const app = express()
const server = http.createServer(app)

server.listen(api.port, () => {
  console.log(`Server listening on http://localhost:${api.port}`)
})