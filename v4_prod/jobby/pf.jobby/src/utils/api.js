const returnApi = (
  datas = [],
  message = '',
  statusCode = '',
  messageError = false
) => {
  return {
    datas,
    message,
    statusCode,
    messageError
  }
}

module.exports = returnApi
