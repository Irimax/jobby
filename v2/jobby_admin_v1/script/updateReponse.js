/* eslint-disable no-unused-vars */
async function updateReponse () {
  let responsePFEnv
  try {
    responsePFEnv = await fetch('http://127.0.0.1:11010/updateReponse', {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'

      },
      body: JSON.stringify({
        reponseLabel: document.querySelector('input[name=reponseLabel]').value,
        reponseId: document.querySelector('input[name=reponseId]').value,
        reponseOrder: document.querySelector('input[name=reponseOrder]').value,
        reponseIsArchived: document.querySelector('select[name=reponseIsArchived]').value

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
