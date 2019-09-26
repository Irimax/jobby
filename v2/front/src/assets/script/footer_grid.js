async function displayFooter () {
  // 1 - recuperer json
  const myApiUrl = 'http://jobby:6015/footer_grid'
  const reponse = await fetch(myApiUrl)
  const footer = await reponse.json()

  // Footer Links

  // 2 - recuperer le DOM -> card-box
  const footerDOM = document.querySelector('#links_grid')

  // 2.1 - construire HTML
  let templateFinal = ''
  for (let index = 0; index < footer[0].links.length; index++) {
    const valuecurrent = footer[0].links[index]
    const label = valuecurrent.title
    const { link } = valuecurrent
    const { icon } = valuecurrent
    const { id } = valuecurrent
    const template = `<a href="${link}" id="${id}">${label}</a>`
    const templateIcon = `<a href="${link}" id="${id}"><i class="${icon}"></i></a>`

    if (icon === '') {
      templateFinal += template
    } else {
      templateFinal += templateIcon
    }
  }

  // 2.3 - afficher la DATA

  footerDOM.innerHTML = templateFinal

  // Footer Location

  const footerLocationDOM = document.querySelector('#localisation_box_grid')

  // 2.1 - construire HTML
  let templateFinale = ''
  for (let indexe = 0; indexe < footer[1].links.length; indexe++) {
    const valuecurrent = footer[1].links[indexe]
    const { title } = valuecurrent
    const links = valuecurrent.link
    const ids = valuecurrent.id
    const template = `<p href="${links}" id="${ids}">${title}</p>`

    templateFinale += template

    footerLocationDOM.innerHTML = templateFinale
  }
}
