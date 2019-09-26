const express = require('express')
const router = express.Router()
const mysql = require('../utils/dbPool')
const api = require('../utils/api')
const { validationResult, body } = require('express-validator/check')
const { sanitizeBody } = require('express-validator/filter')

// *****************************************************************
// ******************* *** GET /updatereponse *** ******************
// *****************************************************************

router.post('/',
  (req, res, next) => {
    res.locals.myFinalReturn = req.body
    res.locals.messageErreur = ''
    res.locals.monDebuugerClient = ''
    return next()
  },

  // *****************************************************************
  // ******************* *** check *** ********************************
  // *****************************************************************

  body('possibleResponseLabel').isString('fr-FR'),
  body('possibleResponseId').isInt({ min: 0 }),
  body('possibleResponseIsArchived').isBoolean(),
  
  // *****************************************************************
  // ******************* *** sanitizeParams *** **********************
  // *****************************************************************

  sanitizeBody('possibleResponseId').toInt(),
  sanitizeBody('possibleResponseIsArchived').toBoolean(),
  // *****************************************************************
  // ******************* *** check for error *** *********************
  // *****************************************************************

  (req, res, next) => {
    const errors = validationResult(req)
    if (!errors.isEmpty()) {
      return res.json(
        {
          code: 'ko',
          debug: error => error.msg,
          message: errors.mapped(),
          status: 400
        })
    }
    next()
  },
  // *****************************************************************
  // ******************* *** algo *** ********************************
  // *****************************************************************

  async (req, res, next) => {
    let sql = `
    UPDATE possibleResponse
    SET possibleResponseLabel = ?,
    possibleResponseIsArchived = ?
    WHERE possibleResponseId = ?`
    let datas
    let params = [ req.body.possibleResponseLabel, req.body.possibleResponseIsArchived, req.body.possibleResponseId ]
    try {
      console.log(mysql.format(sql, params))
      datas = await mysql.query(sql, params)
    } catch (error) {
      return next('route')
    }
    res.locals.myFinalReturn = datas
    next()
  },

  (req, res, next) => {
    return next('route')
  }

)
router.post('/',
  (req, res, next) => {
    return res.json(api(res.locals.myFinalReturn))
  })

module.exports = router
