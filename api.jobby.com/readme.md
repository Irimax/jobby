# Jobby V1

npm -y init
touch .gitignore
mkdir src
mkdir src/routes
touch app.js /src
npm -i --save cors

## package.json 

"scripts": {
    "start": "nodemon ./src/app.js"
  },

### app.js

const express = require('express')
const cors = require('cors')
const port = 6005

const app = express()
app.use(cors())

app.disable('x-powered-by')


app.listen(port, () => console.log(`Started on port ${port}`));


## eslint

npm i --save-dev eslint     eslint-config-standard     eslint-plugin-import     eslint-plugin-node     eslint-plugin-promise     eslint-plugin-standard

## eslint init .eslintrc.js

node node_modules/eslint/bin/eslint.js --init