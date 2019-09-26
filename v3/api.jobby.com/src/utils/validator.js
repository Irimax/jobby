
const { validationResult } = require('express-validator/check')
const api = require('./api.js')()
const {
  check
} = require('express-validator/check')

let checkApiParams = (businessFields = [], customFields = []) => {
  const allFields = businessFields.concat(customFields)
  return [
    // sort ===============================================================================
    check('sort').optional().custom(values => {
      values = values.split(',')
      let pattern = new RegExp(`${allFields.join('_asc|')}_asc|${allFields.join('_desc|')}_desc+`, 'i')
      return values.map(value => {
        return pattern.test(value)
      }).reduce((acc = true, value) => {
        return acc & value
      })
    }).withMessage(`you can sort on this fields ${allFields.join('_asc ')}_asc or ${allFields.join('_desc ')}_desc. ex: ?sort=${allFields.join('_desc,')}_desc`),
    // limit ==============================================================================
    check('limit').optional().isInt().withMessage(`limit must be of int type.`),
    // offset =============================================================================
    check('offset').optional().isInt().withMessage(`offset must be of int type.`),
    // restrict to fields =================================================================
    check('fields').optional().isString().custom(values => {
      return values.split(',').map(aValue => {
        return allFields.includes(aValue)
      }).reduce((acc = true, myValue) => {
        return acc & myValue
      })
    }).withMessage(`allowed fields are: ${allFields.join(',')}. ex: ?fields=${allFields.join(',')}`),
    // force refresh cache =================================================================
    check('refreshCache').optional().isIn([true, false]).withMessage(`beta mode use refreshCache params to refresh the cache. By default records will be cache. ex: ?refreshCache=true`),
    // toArray =============================================================================
    check('toArray').optional().isIn([true, false]).withMessage(`use toArray for force serialize to array results. ex: ?toArray=true`),
    // fromPairs =============================================================================
    check('fromPairs').optional().isIn([true, false]).withMessage(`use fromPairs for lookup key value results. ex: ?fromPairs=true`),
    check('fromPairsId').optional().isString().withMessage(`use fromPairsId for lookup key value results. ex: ?fromPairs=true`),
    check('fromPairsCode').optional().isString().withMessage(`use fromPairsCode for lookup key value results. ex: ?fromPairs=true`),

    (req, res, next) => {
      // check for error =====================================================================
      const errors = validationResult(req)
      if (!errors.isEmpty()) {
        return res.json(
          api({
            code: 'ko',
            debug: error => error.msg,
            message: errors.mapped(),
            status: 400
          })
        )
      }
      next()
    }
  ]
}

module.exports = checkApiParams
