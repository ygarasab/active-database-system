const http = require('http');
const express = require('express');


const app = express()

app
    .get('/products', (_, res) => res.send("Listando produtos"))
    .get('/sells', (_, res) => res.send("Listando vendas"))
    .post('/sells', (req, res) => res.send(req.body))

const server = http.createServer(app)
server.listen(3000)