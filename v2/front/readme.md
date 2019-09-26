# Jobby V1

npm -y init
touch .gitignore
mkdir src
mkdir src/routes
touch app.js /src

## package.json 

"scripts": {
    "start": "nodemon ./app.js"
  },

### app.js

const express = require('express');
const port = 8080;

const app = express()



app.listen(port, () => console.log(`Started on port ${port}`));


## eslint

npm i --save-dev eslint     eslint-config-standard     eslint-plugin-import     eslint-plugin-node     eslint-plugin-promise     eslint-plugin-standard

## eslint init .eslintrc.js

node node_modules/eslint/bin/eslint.js --init

<!-- ---------------------------------------------------------------------------------------------------- -->
localStorage technic:
function storeCategoryIdAndGoToFormPage (id, urlDeLaPage) {
 console.log(id, urlDeLaPage)
 // store du category Id pour pouvoir le réutiliser plus tard
 localStorage.setItem('myCategoryId', id)
 // redirection vers la bonne page
 document.location.href = urlDeLaPage
}



const { label } = currentValue
   const imgURL = currentValue.img
   const categoryId = currentValue.id
   // TEMPLATING 3 etage >prendre le template commenté EN ETAPE 2
   // methode with localStorage => on redefinie le click
   let monTemplateIntermediaire = `
           <a
               onClick="storeCategoryIdAndGoToFormPage(${categoryId}, './formWithLocalStorage.html')"
               class="card">
               <p class="card-label">${label}</p>
               <img class="img-box" src="${imgURL}" alt="tools-img">
           </a>
   `
   // methode with url on adapte une url avec les parametres dedans et dans un second temps on viendra recuperer dans l'url les parametres
   monTemplateIntermediaire += `
           <a href="./formWithUrl.html/${categoryId}"

       class="card">
           <p class="card-label">${label}</p>
           <img class="img-box" src="${imgURL}" alt="tools-img">
       </a>
       `
   monTemplateIntermediaire += `
       <a href="./formWithUrlLabel.html/${label}"

   class="card">
       <p class="card-label">${label}</p>
       <img class="img-box" src="${imgURL}" alt="tools-img">
   </a>
   `
<!-- url -->

let monUrl = document.location.href
let myCategoryIdRecupererDUStore = monUrl.split('/')[4]

 // je cherche de la data
 let displayForm = await fetch('http://dev.api.jobby.com:6005/formWithQuery?myCategoryLabel='+myCategoryIdRecupererDUStore)


 <!-- local storage -->
 
let myCategoryIdRecupererDUStore = localStorage.getItem('myCategoryId')
 // je cherche de la data
 let displayForm = await fetch('http://dev.api.jobby.com:6005/formWithQuery?myCategoryId='+myCategoryIdRecupererDUStore)