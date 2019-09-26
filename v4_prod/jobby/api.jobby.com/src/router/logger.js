
const express = require('express')
const { kmSysLog, testLog } = require('../utils/logger')
const router = express.Router()

router.get('/', (req, res, next) => {
  kmSysLog.info({ message: 'coucou Log' })
  res.send('toto')
})

router.get('/inbdd', (req, res, next) => {
  testLog.info({ message: 'coucou Log' })
  testLog.info({ message: 'coucou', othersStuffs: { detail: '111' }, filename: __filename })
  res.send('toto')
})

module.exports = router
