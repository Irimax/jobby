async function displayMenu () {
  // 1 - recuperer json
  const reponse = await fetch('https://jobby-api.manoha.art/menu_grid')
  const menus = await reponse.json()

  // 2 - recuperer le DOM -> card-box
  const menusDOM = document.querySelector('#grid_header')

  // 2.1 - construire HTML
  let templateFinal = ''
  for (let index = 0; index < menus.length; index++) {
    const valuecurrent = menus[index]
    const label = valuecurrent.title
    const { link } = valuecurrent
    const { id } = valuecurrent
    const { h1 } = valuecurrent
    const template = ` <a href="${link}" id="${id}" >${label}<h1>${h1}</h1></a>`

    templateFinal += template
  }
  // 2.3 - afficher la DATA

  menusDOM.innerHTML = templateFinal
}
