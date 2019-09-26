/* eslint-disable no-unused-vars */

async function displayReponses () {
  const searchParams = new URLSearchParams(window.location.search)
  const myApiUrl = 'https://jobby-api.manoha.art/questions/reponsesId/' + searchParams.get('questionId')
  let reponse = await fetch(myApiUrl)
  let reponses = await reponse.json()
  let templateFinal = reponses.map(reponse =>
    `<tr>
              <th scope="row"><a href="reponse?reponseId=${reponse.id}">${reponse.id}</a></th>
              <td><a href="reponse?reponseId=${reponse.id}">${reponse.label}</a></td>
              <td><a href="reponse?reponseId=${reponse.id}">${reponse.code}</a></td>
              <td><a href="reponse?reponseId=${reponse.id}">${reponse.qtype}</a></td>
          </tr>
          `
  )

  document.querySelector('#arrayReponses').innerHTML = templateFinal.join('')
}
