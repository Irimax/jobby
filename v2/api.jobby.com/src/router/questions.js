const express = require('express')
const mysql = require('../utils/dbPool')
const router = express.Router()
const { testLog } = require('../utils/logger')
const { validationResult, param } = require('express-validator/check')
const { sanitizeParam } = require('express-validator/filter')

// *****************************************************************
// ******************* ***GET /reponsesId/:reponsesId *** ********************************
// *****************************************************************

router.get('/reponsesId/:reponsesId',
  (req, res, next) => {
    res.locals.myFinalReturn = []
    res.locals.messageErreur = ''
    res.locals.monDebuugerClient = ''
    return next()
  },

  // *****************************************************************
  // ******************* *** check *** ********************************
  // *****************************************************************

  param('reponsesId').isInt(),

  // *****************************************************************
  // ******************* *** sanitizeParams *** ********************************
  // *****************************************************************

  sanitizeParam('reponsesId').toInt(),

  // *****************************************************************
  // ******************* *** check for error *** ********************************
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
     SELECT 
        possibleResponseId AS id,
        possibleResponseLabel AS label,
        possibleResponseCode AS code
          FROM possibleResponse 
             WHERE possibleResponse_questionId = ?
      `

    let datas
    let params = [req.params.reponsesId]
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
router.get('/reponsesId/:reponsesId',
  (req, res, next) => {
    return res.json(res.locals.myFinalReturn)
  })

// *****************************************************************
// ******************* ***GET /categoriesId/:categoriesId *** ********************************
// *****************************************************************

router.get('/categoriesId/:categoriesId',
  (req, res, next) => {
    res.locals.myFinalReturn = []
    res.locals.messageErreur = ''
    res.locals.monDebuugerClient = ''
    return next()
  },

  // *****************************************************************
  // ******************* *** check *** ********************************
  // *****************************************************************

  param('categoriesId').isInt(),

  // *****************************************************************
  // ******************* *** sanitizeParams *** ********************************
  // *****************************************************************

  sanitizeParam('categoriesId').toInt(),

  // *****************************************************************
  // ******************* *** check for error *** ********************************
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
    let sql = `SELECT q.questionId AS id,
    q.questionLabel AS label,
     q.questionCode AS code,
     q.questionOrder,
     q.question_questionTypeId,
     (SELECT questionTypeLabel FROM questionType WHERE question_questionTypeId = questionTypeId) AS qtype,
     ( SELECT count(*) AS c FROM possibleResponse AS pr WHERE pr.possibleResponse_questionId = q.questionId) as myCount
     FROM question as q
     WHERE question_categoryId = ?
            `
    let datas
    let params = [req.params.categoriesId]
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
router.get('/categoriesId/:categoriesId',
  (req, res, next) => {
    return res.json(res.locals.myFinalReturn)
  })

// *****************************************************************
// ******************* ***GET / *** ********************************
// *****************************************************************

router.get('/',
  // initialiser le retour
  (req, res, next) => {
    res.locals.myFinalReturn = []
    res.locals.messageErreur = ''
    res.locals.monDebuugerClient = ''
    return next()
  },

  async (req, res, next) => {
    let sql = 'SELECT q.questionLabel AS title, q.questionId AS id,q.questionOrder AS myorder, qt.questionTypeLabel AS type FROM  question AS q INNER JOIN questionType AS qt ON q.question_questionTypeId = qt.questionTypeId  WHERE q.question_categoryId = ?'
    let params = [req.query.question_categoryId]
    let datas
    try {
      console.log(mysql.format(sql, params))
      datas = await mysql.query(sql, params)
    } catch (error) {
      testLog.info(error)
      console.log(error)
      res.locals.monDebuugerClient = error
      return next('route')
    }
    res.locals.questions = datas
    next()
  },
  (req, res, next) => {
    // New boucle []
    res.locals.questions.map(question => {
      question.name = 'toto' + question.id
      return question
    })
    return next()
  },
  (req, res, next) => {
    // New boucle []
    res.locals.questions.map(question => {
      question.order = question.myorder
      return question
    })

    // let questions = res.locals.questions
    // for (let index = 0; index < questions.length; index++) {
    //   let question = questions[index]
    //   question.name = 'toto' + question.id
    // }

    return next()
  }, (req, res, next) => {
    res.locals.questionIds = res.locals.questions.map(question => question.id)
    return next()
  }, async (req, res, next) => {
    let sql = 'SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses,pr.possibleResponseType AS type, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN (?)'
    let params = [res.locals.questionIds]
    let datas
    try {
      console.log(mysql.format(sql, params))
      datas = await mysql.query(sql, params)
    } catch (error) {
      testLog.info(error)
      console.log(error)
      res.locals.monDebuugerClient = error
      return next('route')
    }
    res.locals.possibleResponses = datas
    next()
  }, (req, res, next) => {
    res.locals.myFinalReturn = res.locals.questions.map(question => {
      question.reponses = []
      res.locals.possibleResponses.map(possibleResponse => {
        if (possibleResponse.possibleResponse_questionId === question.id) {
          question.reponses.push(possibleResponse)
        }
      })
      return question
    })

    return next('route')
  }
)

router.get('/',
  (req, res, next) => {
    return res.json(res.locals.myFinalReturn)
  }
)

// router.get('/', (req, res, next) => {
//   res.json([
//     {
//       'id': '1',
//       'title': 'QUEL TYPE DE MATERIEL AVEZ-VOUS BESOIN DE REPARER ?',
//       'name': 'equipmentToRepair',
//       'type': 'text',
//       'reponses': [
//         {
//           'name': ''
//         }
//       ]
//     },
//     {
//       'id': '2',
//       'title': 'DANS QUEL ETAT CE TROUVE LE MATERIEL ?',
//       'name': 'repair-state',
//       'type': 'radio',
//       'reponses': [
//         {
//           'value': 'aBitDefective',
//           'name': 'repair-state',
//           'reponses': 'UN PEU DEFECTUEUX'
//         },
//         {
//           'value': 'VeryDefective',
//           'name': 'repair-state',
//           'reponses': 'TRES DEFECTUEUX'
//         },
//         {
//           'value': 'OutOfOrder',
//           'name': 'repair-state',
//           'reponses': "HORS D'USAGE"
//         }
//       ]
//     },
//     {
//       'id': '3',
//       'title': 'QUEL JOUR SERIEZ-VOUS DISPONIBLE POUR RECEVOIR UN JOBBEUR ?',
//       'name': 'schedule',
//       'type': 'date',
//       'reponses': []
//     },
//     {
//       'id': '4',
//       'title': 'DANS QUEL CRENEAU HORAIRE ?',
//       'name': 'TIME NECKLACE',
//       'type': 'checkbox',
//       'reponses': [
//         {
//           'value': 'morning',
//           'name': 'TIME NECKLACE',
//           'reponses': '08:00 - 12:00'
//         },
//         {
//           'value': 'noon',
//           'name': 'TIME NECKLACE',
//           'reponses': '12:00 - 14:00'
//         },
//         {
//           'value': 'afternoon',
//           'name': 'TIME NECKLACE',
//           'reponses': '14:00 - 18:00'
//         },
//         {
//           'value': 'evening',
//           'name': 'TIME NECKLACE',
//           'reponses': '18:00 - 20:00'
//         }
//       ]
//     },
//     {
//       'id': '5',
//       'title': "VOTRE DOMICILE POSSEDE T'IL UN ASCENSEUR ?",
//       'name': 'lift',
//       'type': 'select',
//       'reponses': [
//         {
//           'value': 'yes',
//           'name': 'lift',
//           'reponses': 'oui'
//         },
//         {
//           'value': 'no',
//           'name': 'lift',
//           'reponses': 'non'
//         }
//       ]
//     },
//     {
//       'id': '6',
//       'title': 'AVEZ-VOUS UNE REMARQUE SUPLEMENTAIRE A FAIRE ?',
//       'name': 'note',
//       'type': 'textarea',
//       'reponses': []
//     }
//   ])
// })

module.exports = router
