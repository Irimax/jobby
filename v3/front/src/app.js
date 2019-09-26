require('dotenv').config()
const express = require('express')
let port = process.env.PORT
let NODENAME = process.env.NODENAME

const app = express()
app.disable('x-powered-by')

// Pages Html

app.use([/^\/$/, '/home'], require('./router/home'))
app.use('^/categories', require('./router/categories'))
app.use('^/about', require('./router/about'))
app.use('^/connexion', require('./router/connexion'))
app.use('^/form', require('./router/form'))
app.use('^/register', require('./router/register'))
app.use('^/blog', require('./router/blog'))
app.use('^/contact', require('./router/contact'))
app.use('^/404', require('./router/404'))

// Source
app.use('^/css', express.static('src/assets/css'))
app.use('^/script', express.static('src/assets/script'))
app.use('^/images', express.static('src/assets/images'))
app.use('^/data', express.static('src/assets/data'))

app.listen(port, () => console.log(`Welcome ${NODENAME} Started on port ${port} Pid - ${process.pid}`))
