const path = require('path')
const express = require('express')

const router = express.Router()

router.get('/:myparentId?', (req, res, next) => {
  const absolutePath = path.join(`${__dirname}/../views/categories.html`)
  res.sendFile(absolutePath)
})

module.exports = router
