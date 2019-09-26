require('dotenv').config()
const express = require('express')
const cors = require('cors')
let port = process.env.PORT
let NODENAME = process.env.NODENAME

const app = express()
app.use(cors())

app.disable('x-powered-by')
app.use([/^\/$/, '/home'], require('./router/home'))
app.use(['^/menu'], require('./router/menu'))
app.use(['^/menu_grid'], require('./router/menu_grid'))
app.use(['^/menu_grid_area'], require('./router/menu_grid_area'))
app.use(['^/footer'], require('./router/footer'))
app.use(['^/footer_grid'], require('./router/footer_grid'))
app.use(['^/footer_grid_area'], require('./router/footer_grid_area'))
app.use(['^/categories'], require('./router/categories'))
app.use(['^/category'], require('./router/category'))
app.use(['^/questions'], require('./router/questions'))
app.use(['^/question'], require('./router/question'))
app.use(['^/reponse'], require('./router/reponse'))
app.use(['^/contact'], require('./router/contact'))
app.use(['^/blog'], require('./router/blog'))
app.use(['^/testBdd'], require('./router/testBdd'))
app.use(['^/logger'], require('./router/logger'))
app.use(['^/typeReponse'], require('./router/typeReponse'))
app.use(['^/site'], require('./router/site'))

app.listen(port, () => console.log(`Welcome ${NODENAME} Started on port ${port} Pid - ${process.pid}`))


