/* eslint-disable no-unused-vars */
async function createReponse () {
  const searchParams = new URLSearchParams(window.location.search)
  let responsePFEnv
  try {
    responsePFEnv = await fetch('https://webhook.manoha.art/createReponse', {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'

      },
      body: JSON.stringify({
        possibleResponseLabel: document.querySelector('input[name=possibleResponseLabel]').value,
        possibleResponse_questionId: searchParams.get('questionId')

      })
    }
    )
  } catch (error) { // network error
    let message = 'all go down in Internet'
    let blockMessage = document.querySelector('#message')
    console.log(error)
    blockMessage.innerHTML = message
    blockMessage.className = ''
    blockMessage.className += ' alert'
    blockMessage.className += ' alert-warning'
    return
  }
  // no network problem
  const responsePF = await responsePFEnv.json()
  if (responsePF.messageError === false) {
    let message = 'all isgood in the wood'
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
