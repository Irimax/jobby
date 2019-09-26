const path = require('path')
const express = require('express')

const router = express.Router()

router.get('/:form', (req, res, next) => {
  const absolutePath = path.join(`${__dirname}/../views/form.html`)
  res.sendFile(absolutePath)
})

module.exports = router
