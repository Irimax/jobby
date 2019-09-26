const express = require('express')
const mysql = require('../utils/dbPool')
const router = express.Router()
const { testLog } = require('../utils/logger')

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
    let sql = 'SELECT footerTitle AS title ,footerLink AS link , footerIcon AS icon FROM jobbydb.footer WHERE footerParentLinks IS NOT NULL'
    let params = []
    let datas
    try {
      datas = await mysql.query(sql, params)
    } catch (error) {
      testLog.info(error)
      res.locals.monDebuugerClient = error

      return next('route')
    }
    res.locals.links = datas
    next()
  },
  async (req, res, next) => {
    let sql = 'SELECT footerTitle AS title ,footerLink AS link FROM jobbydb.footer WHERE footerParentLocations IS NOT NULL'
    let params = []
    let datas
    try {
      datas = await mysql.query(sql, params)
    } catch (error) {
      testLog.info(error)
      res.locals.monDebuugerClient = error

      return next('route')
    }
    res.locals.locations = datas
    next()
  },
  (req, res, next) => {
    let maVar =
    [
      {
        'type': 'links',
        'links': res.locals.links
      },
      {
        'type': 'locations',
        'links': res.locals.locations
      }
    ]
    res.locals.myFinalReturn = maVar
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

// router.get('/', (req, res, next) => {
//   res.json([
//     {
//       'type': 'links',
//       'links': [
//         {
//           'title': 'Accueil',
//           'link': '/home',
//           'icon': ''
//         },
//         {
//           'title': 'Contact',
//           'link': '/contact',
//           'icon': ''
//         },
//         {
//           'title': 'Blog',
//           'link': '/blog',
//           'icon': ''
//         },
//         {
//           'title': 'facebook',
//           'link': '',
//           'icon': 'fab fa-facebook-square'
//         },
//         {
//           'title': 'twitter',
//           'link': '',
//           'icon': 'fab fa-twitter-square'
//         }
//       ]
//     },
//     {
//       'type': 'locations',
//       'links': [
//         {
//           'title': 'Lille',
//           'link': ''
//         },
//         {
//           'title': 'Paris',
//           'link': ''
//         },
//         {
//           'title': 'Bordeaux',
//           'link': ''
//         },
//         {
//           'title': 'Lyon',
//           'link': ''
//         },
//         {
//           'title': 'Marseille',
//           'link': ''
//         }
//       ]
//     }
//   ])
// })

module.exports = router
