/** Algo display categories
 recuperer et afficher les items et les rendre cliquable
  **/

// declaration function
async function displayCategories () {
  // 1 - recuperer json

  let monUrl = document.location.href.split('/')[4] || ''
  const myApiUrl = 'http://jobby:6015/categories/parent/' + monUrl
  let reponse = await fetch(myApiUrl)
  let categories = await reponse.json()

  // 2 - recuperer le DOM -> card-box
  let categoriesDOM = document.querySelector('#cards-box')

  // 2.1 - construire HTML
  let templateFinal = ''
  for (let index = 0; index < categories.length; index++) {
    let valuecurrent = categories[index]
    let label = valuecurrent.label
    let img = valuecurrent.img
    let link = valuecurrent.link
    let categoryId = valuecurrent.id
    let child = valuecurrent.child
    let links = child === 1 ? `/form/${categoryId}` : `/categories/${categoryId}`
    let template = ` <a href="${links}" class="card">
                          <p class="card-label">${label}</p>
                          <img class="img-box" src="${img}" alt="réparation">
                       </a>
                          `

    templateFinal += template
  }
  // 2.3 - afficher la DATA

  categoriesDOM.innerHTML = templateFinal
}
