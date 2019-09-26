/* eslint-disable no-unused-vars */

async function displayCategory () {

  const searchParams = new URLSearchParams(window.location.search)
  const myApiUrl = 'https://jobby-api.manoha.art/category/idCategory/' + searchParams.get('categoryId')
  let reponse = await fetch(myApiUrl)
  let categories = await reponse.json()
  let templateFinal = categories.map(category =>
    `${category.label}
   `

  )

  document.querySelector('#label').innerHTML = templateFinal.join('')
  document.querySelector('#categorie').value = templateFinal.join('')
  document.querySelector('#image').value = categories[0].categoryImage
  document.querySelector('form.container input[name=categoryId]').value = searchParams.get('categoryId')

  let options = document.querySelectorAll('#categoryIsArchived option')
  for (let i = 0; i < options.length; i++) {
    let option = options[i]
    let valueCurrent = option.value === 'true' ? 1 : 0
    if (categories[0].categoryIsArchived === valueCurrent) {
      option.selected = true
    }
  }
}
