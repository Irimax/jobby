require('dotenv').config()
const express = require('express')
const bodyParser = require('body-parser')
const cors = require('cors')
let PORT = process.env.PORT
let NODENAME = process.env.NODENAME

const app = express()
app.use(cors())

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))

// parse application/json
app.use(bodyParser.json())

app.disable('x-powered-by')

app.use(['/updateCategory'], require('./router/updateCategory'))
app.use(['/createCategory'], require('./router/createCategory'))
app.use(['/deleteCategory'], require('./router/deleteCategory'))
app.use(['/updateQuestion'], require('./router/updateQuestion'))
app.use(['/createQuestion'], require('./router/createQuestion'))
app.use(['/deleteQuestion'], require('./router/deleteQuestion'))
app.use(['/updateReponse'], require('./router/updateReponse'))
app.use(['/createReponse'], require('./router/createReponse'))
app.use(['/deleteReponse'], require('./router/deleteReponse'))
app.use(['/updateTitle'], require('./router/updateTitle'))

/* =============================================
=                  *** souces ***             =
============================================= */

app.use('^/script', express.static('src/assets/script'))

app.listen(PORT, () => console.log(`Welcome ${NODENAME} Started on PORT ${PORT} Pid - ${process.pid}`))
