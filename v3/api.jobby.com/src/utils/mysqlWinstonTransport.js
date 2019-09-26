/**
 * This is a MySQL transport module for winston.
 * https://github.com/winstonjs/winston
 * Notice: User should create a log table in MySQL first,
 * the default table fields are 'level', 'meta', 'message'. But you can
 * use your custom table fields by setting: options.fields.
 * Example: options.fields = { level: 'mylevel', meta: 'metadata', message: 'source', timestamp: 'addDate'}
 * Two demo tables:
 *
 CREATE TABLE `sys_logs_default` (
 `id` INT NOT NULL AUTO_INCREMENT,
 `level` VARCHAR(16) NOT NULL,
 `message` TEXT NOT NULL,
 `meta` TEXT NOT NULL,
 PRIMARY KEY (`id`));
 **/
var util = require('util')
var winston = require('winston')
var MySql = require('mysql')
/**
 * @constructor
 * @param {Object} options      Options for the MySQL
 * @param {String} options.user Database username
 * @param {String} options.database Database name
 * @param {String} options.table  Database table for the logs
 * @param {Object} **Optional** options.fields Log object, set custom fields for the log table
 */
var mysql = function (options) {
  'use strict'
  // Please visit https://github.com/felixge/node-mysql#connection-options to get default options for mysql module
  this.options = options || {}
  if (!options.user) {
    throw new Error('The database username is required')
  }
  if (!options.database) {
    throw new Error('The database name is required')
  }
  if (!options.table) {
    throw new Error('The database table is required')
  }
  // check custom table fields
  if (!options.fields) {
    this.options.fields = {}
    // use default names
    this.fields = {
      level: 'level',
      meta: 'meta',
      message: 'message',
      timestamp: 'timestamp',
      id: 'id'
    }
  } else {
    // use custom table field names
    this.fields = {
      level: this.options.fields.level,
      meta: this.options.fields.meta,
      message: this.options.fields.message,
      timestamp: this.options.fields.timestamp,
      id: this.options.fields.id
    }
  }
  // Create a connection poll
  this.pool = MySql.createPool(this.options)
}
// Inherit from `winston.Transport`.
util.inherits(mysql, winston.Transport)
// logger name in winston
mysql.prototype.name = 'mysql'
// getter
winston.transports.Mysql = mysql
/**
 * @method log called by winston when to log somethings
 * @param level {string} Level in winston
 * @param message {string} Message in winston
 * @param meta  {Object} JSON object in winston
 * @param callback {function} callback when finished
 */
mysql.prototype.log = function (level, message, meta, callback) {
  // 'use strict'
  // save this
  var self = this
  // run it in nextTick
  process.nextTick(function () {
    var pool = self.pool
    pool.getConnection(function (err, connection) {
      if (err) {
        return callback(err, null)
      }
      // connected
      // set log object
      var log = {}
      log[self.fields.level] = level
      log[self.fields.message] = message
      log[self.fields.meta] = JSON.stringify({ ...meta })
      // let tableServiceName = self.options.table.substring(0, self.options.table.length - 3) + 'ServiceName'
      // log[tableServiceName] = 'hello'
      if ('id' in meta) {
        let tableId = self.options.table.substring(0, self.options.table.length - 3) + 'Id'
        log[tableId] = meta.id
      }
      // Save the log
      connection.query('INSERT INTO ' + self.options.table + ' SET ?', log, function (err, rows, fields) {
        if (err) {
          return callback(err, null)
        }
        // finished
        connection.release()
        callback(null, true)
      })
    })
  })
}
module.exports = mysql
