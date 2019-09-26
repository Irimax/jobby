const express = require('express')
const mysql = require('../utils/dbPool')
const { validationResult, param } = require('express-validator/check')
const { sanitizeParam } = require('express-validator/filter')
const router = express.Router()

// ***********************************************************************************************
//* ************************ *** Get  /parent/:idParent? *** *************************************
// ***********************************************************************************************

router.get('/',

  // initialiser le retour
  (req, res, next) => {
    res.locals.myFinalReturn = []
    res.locals.messageErreur = ''
    res.locals.monDebuugerClient = ''
    return next()
  },

  async (req, res, next) => {
    let sql = ''
    let params = []

    sql = `
    SELECT
    c.categoryId AS id,
   c.categoryLabel AS label,
   c.categoryCode AS code,
   c.categoryImage AS img,
   c.categoryLink AS link,
   c.categoryIsArchived AS archive,
   true AS child ,
   (    select count(*) as c
        from     question
       where question.question_categoryId = c.categoryId
    ) as myCount
FROM category  as c 
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
router.get('/',
  (req, res, next) => {
    return res.json(res.locals.myFinalReturn)
  })

// ***********************************************************************************************
//* ************************ *** Get  /parent/:idParent? *** *************************************
// ***********************************************************************************************

router.get('/parent/:idParent?',
// initialiser le retour
  (req, res, next) => {
    res.locals.myFinalReturn = []
    res.locals.messageErreur = ''
    res.locals.monDebuugerClient = ''
    return next()
  },

  // check
  param('idParent').optional().isInt(),

  // sanitizeParams

  sanitizeParam('idParent').toInt(),

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
    let params = []
    if (req.params.idParent) {
      sql = `
    SELECT categoryId AS id, categoryLabel AS label, categoryCode AS code, categoryImage AS img, categoryLink AS link, true AS child FROM category WHERE categoryParentId = ?
    `
      params = [req.params.idParent]
    } else {
      sql = `
    SELECT categoryId AS id, categoryLabel AS label,categoryCode AS code, categoryImage AS img, categoryLink AS link, false AS child FROM category WHERE categoryParentId = 0
    `
    }
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
router.get('/parent/:idParent?',
  (req, res, next) => {
    return res.json(res.locals.myFinalReturn)
  })

// router.get('/', (req, res, next) => {
//   res.json([
//     {
//       'label': 'réparation',
//       'img': 'https://i.imgur.com/1XrPTg8.jpg',
//       'link': '/form'
//     },
//     {
//       'label': 'transport',
//       'img': 'https://i.imgur.com/BZedtDL.jpg',
//       'link': '/form'
//     },
//     {
//       'label': 'apprentissage',
//       'img': 'https://i.imgur.com/GdSFShm.jpg',
//       'link': '/form'
//     },
//     {
//       'label': 'multimedia',
//       'img': 'https://i.imgur.com/I6GSsT9.jpg',
//       'link': '/form'
//     },
//     {
//       'label': 'éléctricité',
//       'img': 'https://i.imgur.com/fAw9pLo.jpg',
//       'link': '/form'
//     },
//     {
//       'label': 'véhicule',
//       'img': 'https://i.imgur.com/Ni9mDkk.jpg',
//       'link': '/form'
//     },
//     {
//       'label': 'décoration',
//       'img': 'https://i.imgur.com/Mi4pngk.jpg',
//       'link': '/form'
//     },
//     {
//       'label': 'jardinage',
//       'img': 'https://i.imgur.com/qS43pNV.jpg',
//       'link': '/form'
//     },
//     {
//       'label': 'façades',
//       'img': 'https://i.imgur.com/mq22efW.jpg',
//       'link': '/form'
//     },
//     {
//       'label': 'salle de bain',
//       'img': 'https://i.imgur.com/ZHRwHdd.jpg',
//       'link': '/form'
//     },
//     {
//       'label': 'débouchage',
//       'img': 'https://i.imgur.com/OhaHEWq.jpg',
//       'link': '/form'
//     },
//     {
//       'label': 'peinture',
//       'img': 'https://i.imgur.com/DuxKyAi.jpg',
//       'link': '/form'
//     }
//   ])
// })

module.exports = router
