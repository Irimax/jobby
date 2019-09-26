/* eslint-disable no-unused-vars */

async function displayReponse () {
  const searchParams = new URLSearchParams(window.location.search)
  const myApiUrl = 'https://jobby-api.manoha.art/reponse/idreponse/' + searchParams.get('reponseId')
  let reponse = await fetch(myApiUrl)
  let reponses = await reponse.json()
  let templateFinal = reponses.map(reponse =>
    `${reponse.label}
   `
  )
  document.querySelector('#label').innerHTML = templateFinal.join('')
  document.querySelector('#reponse').value = templateFinal.join('')
  document.querySelector('form.container input[name=possibleResponseId]').value = searchParams.get('reponseId')
  document.querySelector('form.container input[name=possibleResponse_questionId]').value = searchParams.get('possibleResponse_questionId')
 

  

  let options = document.querySelectorAll('#reponseIsArchived option')
  for (let i = 0; i < options.length; i++) {
    let option = options[i]
    let valueCurrent = option.value === 'true' ? 1 : 0
    if (reponses[0].reponseIsArchived === valueCurrent) {
      option.selected = true
    }
  }
}
