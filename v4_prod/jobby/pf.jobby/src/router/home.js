
const express = require('express')

const router = express.Router()

router.get('/', (req, res, next) => {
  res.send('<title>process form jobby</title><h1>process form jobby</h1>')
})

module.exports = router
