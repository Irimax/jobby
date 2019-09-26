/* eslint-disable no-unused-vars */
async function updateReponse () {
  let responsePFEnv
  try {
    responsePFEnv = await fetch('https://webhook.manoha.art/updateReponse', {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'

      },
      body: JSON.stringify({
        possibleResponseLabel: document.querySelector('input[name=possibleResponseLabel]').value,
        possibleResponseId: document.querySelector('input[name=possibleResponseId]').value,
        possibleResponseIsArchived: document.querySelector('select[name=possibleResponseIsArchived]').value

      })
    }
    )
  } catch (error) { // network error
    let message = 'all go down in Internet'
    let blockMessage = document.querySelector('#message')
    blockMessage.innerHTML = message
    blockMessage.className = ''
    blockMessage.className += ' alert'
    blockMessage.className += ' alert-warning'
    return
  }
  // no network problem
  const responsePF = await responsePFEnv.json()
  if (responsePF.messageError === false) {
    let message = 'all is good in the wood'
    let blockMessage = document.querySelector('#message')
    document.location.href = 'https://jobbyadmin.manoha.art/categories'
    blockMessage.className = ''
    blockMessage.innerHTML = message
    blockMessage.className += ' alert'
    blockMessage.className += ' alert-success'
  } else {
    let message = 'error internal in process form'
    let blockMessage = document.querySelector('#message')
    blockMessage.innerHTML = message
    blockMessage.className = ''
    blockMessage.className += ' alert'
    blockMessage.className += ' alert-warning'
  }
}
