async function displayMenu () {
  // 1 - recuperer json
                                                                                                  
  const reponse = await fetch('https://jobby-api.manoha.art/menu')
  const menus = await reponse.json()

  // 2 - recuperer le DOM
  const menusDOM = document.querySelector('#menu-items')

  // 2.1 - construire HTML
  // let templateFinal = ''
  // for (let index = 0; index < menus.length; index++) {
  //   const valuecurrent = menus[index]
  //   const label = valuecurrent.title
  //   const { link } = valuecurrent
  //   const template = ` <a href="${link}">${label}</a>`

  //   templateFinal += template
  // }
  // 2.3 - afficher la DATA

  // let templateFinal = menus.map(menu => ` <a href="${menu.link}">${menu.title}</a>`)


  // New boucle []
  menusDOM.innerHTML = menus.map(menu => `<a href="${menu.link}">${menu.title}</a>`).join('')
}
