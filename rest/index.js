const http = require('http');
const express = require('express');
const config = require('./config');

const { Pool } = require('pg')



const app = express()
app.use(express.json())
app
    .get('/products', (_, res) => {
        console.log("Got products get request")
        const pool = new Pool(config)
        pool.query('select * from products order by id', (_, result) => {
            res.send(result.rows)
            pool.end()
        })
    })
    .get('/sells', (_, res) => {
        console.log("Got sells get request")
        const pool = new Pool(config)
        pool.query('select * from sells order by id', (_, result) => {
            res.send(result.rows)
            pool.end()
        })
    })
    .post('/sells', (req, res) => {
        console.log("Got new sell")
        const query = {
            text: "insert into sells(product_id, amount) values ($1, $2)",
            values: [req.body.product_id, req.body.amount]
        }
        const pool = new Pool(config)
        pool.query(query, (err, result) => {
            if(err){
                console.log(err.message)
                res.send("An error occurred: "+ err.message)
            }
            else{
                res.send('ok')
            }
            
            pool.end()
        })
    })
const server = http.createServer(app)
server.listen(3000)