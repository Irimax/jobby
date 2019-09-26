
const express = require('express')

const router = express.Router()

router.get('/', (req, res, next) => {
  res.send('<title>api jobby</title><h1>api jobby</h1>')
})

module.exports = router
