const path = require('path')
const express = require('express')

const router = express.Router()

router.get('/', (req, res, next) => {
  const absolutePath = path.join(`${__dirname}/../views/register.html`)
  res.sendFile(absolutePath)
})

module.exports = router
