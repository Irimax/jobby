var mysql = require('mysql')
var util = require('util')

// const secrets = require('./docker-secrets')

var connectionLimit = process.env.DB_CONNECTION_LIMIT || 100
var host = process.env.DB_HOST || '127.0.0.1'
var port = process.env.DB_PORT || '3306'
var user = process.env.DB_USER || 'lidian'
var database = process.env.DB_DATABASE || 'jobbydb'
var password = process.env.DB_PASSWORD || '31101978$'
var options = {
  connectionLimit: connectionLimit,
  host: host,
  port: port,
  user: user,
  password: password,
  database: database,
  supportBigNumbers: true,
  debug: false,
  trace: true,
  multipleStatements: true
}

//    debug: ['ComQueryPacket'],

var pool = mysql.createPool(options)
pool.query = util.promisify(pool.query)
pool.format = mysql.format

module.exports = pool
