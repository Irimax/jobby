const express = require('express')
const router = express.Router()
const mysql = require('../utils/dbPool')
const api = require('../utils/api')
const { validationResult, body } = require('express-validator/check')
const { sanitizeBody } = require('express-validator/filter')

// *****************************************************************
// ******************* *** GET /updateQuestion *** ******************
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
  body('questionId').isInt({ min: 0 }),
  body('questionIsArchived').isBoolean(),
  body('questionOrder').isInt({ min: 0 }),
  body('question_questionTypeId').optional().isInt(),
  // *****************************************************************
  // ******************* *** sanitizeParams *** **********************
  // *****************************************************************

  sanitizeBody('questionId').toInt(),
  sanitizeBody('questionOrder').toInt(),
  sanitizeBody('questionIsArchived').toBoolean(),
  sanitizeBody('question_questionTypeId').toInt(),
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
    UPDATE question
    SET questionLabel = ?,
    questionIsArchived = ?,
    questionOrder = ?,
    question_questionTypeId = ?
    WHERE questionId = ?`
    let datas
    let params = [ req.body.questionLabel, req.body.questionIsArchived, req.body.questionOrder, req.body.question_questionTypeId, req.body.questionId ]
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
