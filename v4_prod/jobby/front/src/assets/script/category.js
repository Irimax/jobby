// DISPLAY CATEGORIES
/**  recuperation des categories
* 1.1 aller chercher le JSON des categories
* 2.1 recuperer le DOM -> card-box
* 2.2 construction du HTML que l'on veux injecter en fonction de la data recuperee-
* -a l'etape 1
* 2.3 affecter le cards-box avec le template crée
* 3.
  **/

// declaration function
async function displayCategories () {
  // 1 - recuperation des categories

  let monUrl = document.location.href.split('/')[4] || ''
  const myApiUrl = 'https://jobby-api.manoha.art/categories/parent/' + monUrl

  // 1.1 aller chercher le JSON des categories

  let reponse = await fetch(myApiUrl)
  let categories = await reponse.json()

  // 2.1 - recuperer le DOM -> card-box
  let categoriesDOM = document.querySelector('#cards-box')

  // 2.2 construction du HTML que l'on veux injecter en fonction de la data recuperee a l'etape 1
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
                          <img class="img-box" src="${img}" alt="réparation"> </a>
                          `

    templateFinal += template
  }
  // 2.3 - affecter le cards-box avec le template crée

  categoriesDOM.innerHTML = templateFinal
}
