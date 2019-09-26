const { Mail } = require('winston-mail')

const { createLogger, transports } = require('winston')
const MysqlWinstonTransport = require('./mysqlWinstonTransport')

const mailTo = 'lidianbidon@gmail.com'
const mailFrom = 'lidian@gmail.com'
const smtpHost = 'smtp.gmail.com'
const smtpPort = '25'
const smtpUserName = 'lidianbidon@gmail.com'
const smtpPassword = "31101978['']"
const smtpTLS = true

const defaultMailoptions = {
  to: mailTo,
  from: mailFrom,
  host: smtpHost,
  port: smtpPort,
  username: smtpUserName,
  password: smtpPassword,
  tls: smtpTLS,
  subject: `{{level}} at  coucou ): {{msg}})`
  // ssl: Use SSL (boolean or object { key, ca, cert })
  // level: Level of messages that this transport should log.
  // unique: Boolean flag indicating whether to log only the declared level and none above.
  // silent: Boolean flag indicating whether to suppress output.
  // filter: Filter function with signature function({level, message, meta}). If specified, should return true for log messages that need to send.
  // html: Boolean flag indicating whether to send mail body as html attach.
  // timeout: Maximum number of milliseconds to wait for smtp responses (optional, defaults to emailjs defaults - 5000)
  // authentication: Preffered SMTP auth methods (optional, defaults to emailjs defaults - ['PLAIN', 'CRAM-MD5', 'LOGIN', 'XOAUTH2'])
  // formatter: Custom mail body formatter with signature function({level, message, meta}). If specified, the return value will be used as mail body.
}

const host = process.env.DB_HOST || '127.0.0.1'
const user = process.env.DB_USER || 'lidian'
const database = process.env.DB_DATABASE || 'jobbydb'
const password = process.env.DB_PASSWORD || '31101978$'
const defaultOptions = {
  host: host,
  user: user,
  password: password,
  database: database
}

// CREATE TABLE `testLog` (
//   `testLogId` int(11) NOT NULL AUTO_INCREMENT,
//   `testLogLevel` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
//   `testLogMessage` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
//   `testLogDetailJSON` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
//   `testLogDatetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
//   PRIMARY KEY (`testLogId`)
// ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/**
* *************** usage ***************
* const {logger, userLog} = require('./utils/logger')
* userLog.info({message: 'coucou', othersStuffs: {detail: '111'} ,filename:___filename})
* or
* userLog.info({message: "coucou"});
*/
let tableName
tableName = 'kmSysLog'
const kmSysLog = createLogger()
//   .add(new MysqlWinstonTransport({ ...defaultOptions, table: tableName, fields: { level: `${tableName}Level`, meta: `${tableName}DetailJSON`, message: `${tableName}Message`, timestamp: `${tableName}Datetime` } }))
  .add(new transports.Console({ colorize: true, handleExceptions: true, humanReadableUnhandledException: true, json: false }))
  .add(new Mail({ level: 'info', ...defaultMailoptions }))

  tableName = 'testLog'
const testLog = createLogger()
  .add(new MysqlWinstonTransport({ ...defaultOptions, table: tableName, fields: { level: `${tableName}Level`, meta: `${tableName}DetailJSON`, message: `${tableName}Message`, timestamp: `${tableName}Datetime` } }))
  .add(new transports.Console({ colorize: true, handleExceptions: true, humanReadableUnhandledException: true, json: false }))
//   .add(new Mail({ level: 'info', ...defaultMailoptions }))

module.exports = { kmSysLog, testLog }
