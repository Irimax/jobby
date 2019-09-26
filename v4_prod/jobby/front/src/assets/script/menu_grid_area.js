async function displayMenu () {
  // 1 - recuperer json
  const reponse = await fetch('https://jobby-api.manoha.art/menu_grid_area')
  const menus = await reponse.json()

  const maclass = 'grid_area_'
  let monIndexClass = 1
  // 2 - recuperer le DOM -> card-box
  const menusDOM = document.querySelector('#header_grid_area')

  // 2.1 - construire HTML
  let templateFinal = ''
  for (let index = 0; index < menus.length; index++) {
    const valuecurrent = menus[index]
    const label = valuecurrent.title
    const { link } = valuecurrent
    // const { id } = valuecurrent
    const { h1 } = valuecurrent
    const template = ` <a href="${link}" id="${maclass + monIndexClass++}">${label}<h1>${h1}</h1></a>`

    templateFinal += template
  }
  // 2.3 - afficher la DATA

  menusDOM.innerHTML = templateFinal
}
