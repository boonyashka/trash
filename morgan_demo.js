/**
 *
 * log request and response body, and access information.
 *
 * @author jingjie jiang May 22, 2018
 */
/*eslint-disable*/
let express = require('express');
// import express from 'express';
let morgan = require('morgan');
let morganBody = require('morgan-body');
let bodyParser = require('body-parser');
let fs = require('fs');
let path = require('path');

const app = express();

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

// create a write stream (in append mode)
var accessLogStream = fs.createWriteStream(path.join(__dirname, 'access.log'), {flags: 'a'})

app.use(morgan('combined', { stream: accessLogStream }));
morganBody(app, { noColors: true, stream: accessLogStream });
// setup the logger
// app.use(morgan('combined', {stream: accessLogStream}))

app.get('/', (req, res) => {
  res.send(JSON.stringify({ response: 'hello, world!' }));
});

app.post('/handle',function(req,res){
  console.log('req body', req.body);
  res.send({ response: 'hello cabron!' });
});

/* use only morgan */
// create a write stream (in append mode)
// var accessLogStream = fs.createWriteStream(path.join(__dirname, 'morgan.log'), {flags: 'a'})

// // setup the logger
// app.use(morgan('combined', {stream: accessLogStream}))

// app.get('/', function (req, res) {
//   res.send('hello, world!')
// })

app.listen(3000, () => console.log('Example app listening on port 3000!'));
