const express = require('express')
const mysql = require('../utils/dbPool')
const router = express.Router()

router.get('/decouverteNextRoute', (req, res, next) => {
  next('route')
},
(req, res, next) => {
  res.send('Hello')
}

)

const winston = require('winston')
const logger = winston.createLogger({
  format: winston.format.json(),
  transports: [
    //
    // - Write to all logs with level `info` and below to `combined.log`
    // - Write all logs error (and below) to `error.log`.
    //
    new winston.transports.Console({ level: 'debug' }),
    new winston.transports.File({ filename: 'error.log', level: 'error' }),
    new winston.transports.File({ filename: 'combined.log' })
  ]
})
/********************************************************************/
/** /decouverteNextRouteAvecParametreDeRetourEnCasDerreurLogiqueEtloggerEtLoggerEnConsoleClient **********************/
/********************************************************************/
router.get('/decouverteNextRouteAvecParametreDeRetourEnCasDerreurLogiqueEtloggerEtLoggerEnConsoleClient',
  // initialiser le retour
  (req, res, next) => {
    res.locals.myFinalReturn = []
    res.locals.status = 200
    res.locals.messageErreur = ''
    res.locals.monDebuugerClient = ''
    return next()
  },
  // check validator
  // sanitize validator
  // traitement
  (req, res, next) => {
    // ma partie d'algo 1
    let fruitierOpen = true
    if (fruitierOpen === true) {
      return next()
    } else {
      res.locals.messageErreur = 'le fruitier is closed'
      res.locals.status = 400
      logger.debug('ca sent le roussi ici')
      logger.error('ca sent le sapin')
      return next('route')
    }
  },
  async (req, res, next) => {
    let sql = `
        SELECT *
        FROM   categorys 
    `
    let params = []
    let datas
    try {
      datas = await mysql.query(sql, params)
    } catch (error) {
      logger.info(error)
      res.locals.monDebuugerClient = error
      res.locals.status = 500
      return next('route')
    }
    res.locals.myDatas = datas
    next()
  },
  (req, res, next) => {
    // ma partie d'algo 2 ......
    res.locals.myFinalReturn = ['pommes', 'poire']
    return next()
  },
  (req, res, next) => {
    return next('route')
  }
)
router.get('/decouverteNextRouteAvecParametreDeRetourEnCasDerreurLogiqueEtloggerEtLoggerEnConsoleClient',
  (req, res, next) => {
    if (res.locals.status != 200) {
      if (process.env.NODE_ENV != 'dev') 
        res.locals.monDebuugerClient = '' 
      
      return res.json(
        {
          monMessageCustom: 'ca part en yecou ici' + res.locals.messageErreur,
          monerreurReel: res.locals.monDebuugerClient
        }
      )
    }
    return res.json(res.locals.myFinalReturn)
  }
)
/********************************************************************/
/** /decouverteNextRouteAvecParametreDeRetourEnCasDerreurLogiqueEtlogger **********************/
/********************************************************************/
router.get('/decouverteNextRouteAvecParametreDeRetourEnCasDerreurLogiqueEtlogger',
  // initialiser le retour
  (req, res, next) => {
    res.locals.myFinalReturn = []
    res.locals.status = 200
    res.locals.messageErreur = ''
    return next()
  },
  // check validator
  // sanitize validator
  // traitement
  (req, res, next) => {
    // ma partie d'algo 1
    let fruitierOpen = true
    if (fruitierOpen === true) {
      return next()
    } else {
      res.locals.messageErreur = 'le fruitier is closed'
      res.locals.status = 400
      logger.debug('ca sent le roussi ici')
      logger.error('ca sent le sapin')
      return next('route')
    }
  },
  async (req, res, next) => {
    let sql = `
        SELECT *
        FROM   categorys 
    `
    let params = []
    let datas
    try {
      datas = await mysql.query(sql, params)
    } catch (error) {
      logger.info(error)
      return next('route')
    }
    res.locals.myDatas = datas
    next()
  },
  (req, res, next) => {
    // ma partie d'algo 2 ......
    res.locals.myFinalReturn = ['pommes', 'poire']
    return next()
  },
  (req, res, next) => {
    return next('route')
  }
)
router.get('/decouverteNextRouteAvecParametreDeRetourEnCasDerreurLogiqueEtlogger',
  (req, res, next) => {
    if (res.locals.status != 200) {
      return res.json('ca part en yecou ici' + res.locals.messageErreur)
    }
    return res.json(res.locals.myFinalReturn)
  }
)
/********************************************************************/
/** /decouverteNextRouteAvecParametreDeRetourEnCasDerreurEtlogger **********************/
/********************************************************************/
router.get('/decouverteNextRouteAvecParametreDeRetourEnCasDerreurEtlogger',
  // initialiser le retour
  (req, res, next) => {
    res.locals.myFinalReturn = []
    res.locals.status = 200
    res.locals.messageErreur = ''
    return next()
  },
  // check validator
  // sanitize validator
  // traitement
  (req, res, next) => {
    // ma partie d'algo 1
    let fruitierOpen = false
    if (fruitierOpen === true) {
      return next()
    } else {
      res.locals.messageErreur = 'le fruitier is closed'
      res.locals.status = 400
      logger.debug('ca sent le roussi ici')
      logger.error('ca sent le sapin')
      return next('route')
    }
  },
  (req, res, next) => {
    // ma partie d'algo 2 ......
    res.locals.myFinalReturn = ['pommes', 'poire']
    return next()
  },
  (req, res, next) => {
    return next('route')
  }
)
router.get('/decouverteNextRouteAvecParametreDeRetourEnCasDerreur',
  (req, res, next) => {
    if (res.locals.status != 200) {
      return res.json('ca part en yecou ici' + res.locals.messageErreur)
    }
    return res.json(res.locals.myFinalReturn)
  }
)
/********************************************************************/
/** decouverteNextRouteAvecParametreDeRetourEnCasDerreur**********************/
/********************************************************************/
router.get('/decouverteNextRouteAvecParametreDeRetourEnCasDerreur',
  // initialiser le retour
  (req, res, next) => {
    res.locals.myFinalReturn = []
    res.locals.status = 200
    res.locals.messageErreur = ''
    return next()
  },
  // check validator
  // sanitize validator
  // traitement
  (req, res, next) => {
    // ma partie d'algo 1
    let fruitierOpen = false
    if (fruitierOpen === true) {
      return next()
    } else {
      res.locals.messageErreur = 'le fruitier is closed'
      res.locals.status = 400
      return next('route')
    }
  },
  (req, res, next) => {
    // ma partie d'algo 2 ......
    res.locals.myFinalReturn = ['pommes', 'poire']
    return next()
  },
  (req, res, next) => {
    return next('route')
  }
)
router.get('/decouverteNextRouteAvecParametreDeRetourEnCasDerreur',
  (req, res, next) => {
    if (res.locals.status != 200) {
      return res.json('ca part en yecou ici' + res.locals.messageErreur)
    }
    return res.json(res.locals.myFinalReturn)
  }
)
/********************************************************************/
/** decouverteNextRoute**********************/
/********************************************************************/
router.get('/decouverteNextRoute',
  // initialiser le retour
  (req, res, next) => {
    res.locals.myFinalReturn = []
    return next()
  },
  // check validator
  // sanitize validator
  // traitement
  (req, res, next) => {
    // ma partie d'algo 1
    let fruitierOpen = false
    if (fruitierOpen === true) {
      return next()
    } else {
      return next('route')
    }
  },
  (req, res, next) => {
    // ma partie d'algo 2 ......
    res.locals.myFinalReturn = ['pommes', 'poire']
    return next()
  },
  (req, res, next) => {
    return next('route')
  }
)
router.get('/decouverteNextRoute',
  (req, res, next) => {
    return res.json(res.locals.myFinalReturn)
  }
)
/********************************************************************/
/** / **********************/
/********************************************************************/
router.get('/',
  async (req, res, next) => {
    let sql = `
    SELECT * FROM category
    `
    let params = []
    let datas
    try {
      datas = await mysql.query(sql, params)
    } catch (error) {
      return res.send(error)
    //   return next('route')
    }
    res.locals.myDatas = datas
    next()
  },
  (req, res, next) => {
    res.json(res.locals.myDatas)
  }
)
/********************************************************************/
/** /:categoryId **********************/
/********************************************************************/
router.get('/:categoryId',
  async (req, res, next) => {
    let myCategoryLabel = 'transport'
    let sql = `
        SELECT * 
        FROM   category 
        WHERE  categoryId = ?
        AND     categoryLabel like ?
    `
    let params = [req.params.categoryId, myCategoryLabel]
    let datas
    try {
      datas = await mysql.query(sql, params)
    } catch (error) {
      return res.send(error)
    //   return next('route')
    }
    res.locals.myDatas = datas
    next()
  },
  (req, res, next) => {
    res.json(res.locals.myDatas)
  }
)
router.get('/:categoryId/:field',
  async (req, res, next) => {
    let sql = `
        SELECT ??
        FROM   category 
        WHERE  categoryId = ?
    `
    let params = [req.params.field, req.params.categoryId]
    let datas
    try {
      datas = await mysql.query(sql, params)
    } catch (error) {
      return res.send(error)
    //   return next('route')
    }
    res.locals.myDatas = datas
    next()
  },
  (req, res, next) => {
    res.json(res.locals.myDatas)
  }
)
module.exports = router


router.get('/:categoryId',
  async (req, res, next) => {
    let sql = `SELECT * FROM category WHERE categoryId = ?`

    let params = [req.params.categoryId]
    let datas
    try {
      datas = await mysql.query(sql, params)
    } catch (error) {
      return res.send(error)
    //   return next('route')
    }
    res.locals.myDatas = datas
    next()
  },

  (req, res, next) => {
    res.json(res.locals.myDatas)
  })

router.get('/:categoryId/:field',
  async (req, res, next) => {
    let sql = `
       SELECT ??
       FROM   category
       WHERE  categoryId = ?
   `
    let params = [req.params.field, req.params.categoryId]
    let datas
    try {
      datas = await mysql.query(sql, params)
    } catch (error) {
      return res.send(error)
      //   return next('route')
    }
    res.locals.myDatas = datas
    next()
  },

  (req, res, next) => {
    res.json(res.locals.myDatas)
  }

)

module.exports = router
