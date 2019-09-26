const express = require('express')
const mysql = require('../utils/dbPool')
const { validationResult, param } = require('express-validator/check')
const { sanitizeParam } = require('express-validator/filter')
const router = express.Router()

// ***********************************************************************************************
//* ************************ *** Get  question/idquestion/:idquestion *** *******************************
// ***********************************************************************************************

router.get('/idquestion/:idquestion',

  // initialiser le retour
  (req, res, next) => {
    res.locals.myFinalReturn = []
    res.locals.messageErreur = ''
    res.locals.monDebuugerClient = ''
    return next()
  },

  // check
  param('idquestion').optional().isInt(),

  // sanitizeParams

  sanitizeParam('idquestion').toInt(),

  // Retour en cas d'erreur
  (req, res, next) => {
  // check for error =====================================================================
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
  async (req, res, next) => {
    let sql = ''
    let params = [req.params.idquestion]

    sql = `
    SELECT q.questionId, q.questionLabel AS label, q.questionIsArchived, q.questionOrder,
     q.question_categoryId, q.question_questionTypeId, qt.questionTypemultiple
      FROM question AS q 
      LEFT JOIN questionType AS qt ON qt.questionTypeId = q.question_questionTypeId
      WHERE q.questionId = ? 
      `
    //
    let datas
    try {
      console.log(mysql.format(sql, params))
      datas = await mysql.query(sql, params)
    } catch (error) {
      console.log(error)
      return next('route')
    }
    res.locals.myFinalReturn = datas
    next()
  },
  (req, res, next) => {
    return next('route')
  }

)
router.get('/idquestion/:idquestion',
  (req, res, next) => {
    return res.json(res.locals.myFinalReturn)
  })

module.exports = router
