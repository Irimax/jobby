const express = require('express')
const router = express.Router()
const mysql = require('../utils/dbPool')
const api = require('../utils/api')
const { validationResult, body } = require('express-validator/check')

// *****************************************************************
// ******************* *** GET /createReponse *** ******************
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

  body('possibleResponseId').isInt(),

  // *****************************************************************
  // ******************* *** sanitizeParams *** **********************
  // *****************************************************************

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
    DELETE FROM possibleResponse WHERE possibleResponseId = ?;
    `

    let datas
    let params = [ req.body.possibleResponseId ]
    try {
      console.log(mysql.format(sql, params))
      datas = await mysql.query(sql, params)
    } catch (error) {
      return next('route')
    }
    res.locals.myFinalReturn = datas
    return next()
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
