const express = require('express')
const mysql = require('../utils/dbPool')
const { validationResult, param } = require('express-validator/check')
const { sanitizeParam } = require('express-validator/filter')
const router = express.Router()

// ***********************************************************************************************
//* ************************ *** Get  category/idCategory/:idCategory *** *******************************
// ***********************************************************************************************

router.get('/idCategory/:idCategory',

  // initialiser le retour
  (req, res, next) => {
    res.locals.myFinalReturn = []
    res.locals.messageErreur = ''
    res.locals.monDebuugerClient = ''
    return next()
  },

  // check
  param('idCategory').optional().isInt(),

  // sanitizeParams

  sanitizeParam('idCategory').toInt(),

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
    let params = [req.params.idCategory]

    sql = `
    SELECT
    categoryId, categoryLabel AS label,categoryImage,categoryIsArchived
FROM category WHERE categoryId = ?
  `
    //
    let datas
    try {
    // console.log(mysql.format(sql, params))
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
router.get('/idCategory/:idCategory',
  (req, res, next) => {
    return res.json(res.locals.myFinalReturn)
  })

module.exports = router
