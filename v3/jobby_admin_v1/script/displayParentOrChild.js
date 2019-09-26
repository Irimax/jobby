/* eslint-disable no-unused-vars */

async function displayParent () {
  const reponse = await fetch('http://jobby:6005/categories/parent/')
  const parentOrChilds = await reponse.json()
  const dom = document.querySelector('#parentOrChild')

  let templateFinal = parentOrChilds.map(parentOrChild =>
    `<option  value="${parentOrChild.id}">${parentOrChild.label}</option>
      `

  )
  let templateFinal2 =
    `
    <option value="0">parent</option>
  `

  dom.innerHTML = templateFinal + templateFinal2
}
