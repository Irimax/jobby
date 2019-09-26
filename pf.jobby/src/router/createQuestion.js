const express = require('express')
const router = express.Router()
const mysql = require('../utils/dbPool')
const api = require('../utils/api')
const { validationResult, body } = require('express-validator/check')
const { sanitizeParam } = require('express-validator/filter')

// *****************************************************************
// ******************* *** GET /createQuestion *** ******************
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

  body('questionLabel').isString('fr-FR'),
  body('question_categoryId').isInt(),
  // *****************************************************************
  // ******************* *** sanitizeParams *** **********************
  // *****************************************************************
  sanitizeParam('question_categoryId').toInt(),
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
    INSERT INTO question (questionLabel, questionCode, question_categoryId)
value (?,concat('question_',uuid()),?);`

    let datas
    let params = [ req.body.questionLabel, req.body.question_categoryId ]
    try {
      console.log(mysql.format(sql, params))
      datas = await mysql.query(sql, params)
    } catch (error) {
      return next('route')
    }
    res.locals.myFinalReturn = datas.insertId
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
