const express = require('express')
const mysql = require('../utils/dbPool')
const router = express.Router()
const {testLog} = require('../utils/logger')

router.get('/',
  // initialiser le retour
  (req, res, next) => {
    res.locals.myFinalReturn = []
    res.locals.messageErreur = ''
    res.locals.monDebuugerClient = ''
    return next()
  },
  // check validator

  async (req, res, next) => {
    let sql = 'SELECT menuTitle AS title, menuLink AS link FROM menu'
    let params = []
    let datas
    try {
      datas = await mysql.query(sql, params)
    } catch (error) {
      testLog.info(error)
      res.locals.monDebuugerClient = error
    
      return next('route')
    }
    res.locals.myFinalReturn = datas
    next()
  },
  (req, res, next) => {
    return next('route')
  }
)

router.get('/',
  (req, res, next) => {
    return res.json(res.locals.myFinalReturn)
  }
)

module.exports = router
