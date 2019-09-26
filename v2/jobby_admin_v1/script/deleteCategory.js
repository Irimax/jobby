/* eslint-disable no-unused-vars */
async function deleteCategory () {
  let responsePFEnv
  try {
    responsePFEnv = await fetch('http://127.0.0.1:11010/deleteCategory', {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'

      },
      body: JSON.stringify({
        categoryId: document.querySelector('input[name=categoryId]').value
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
    document.location.href = 'http://127.0.0.1:5001/Jobby/jobby_admin_v1/views/categories.html'
  } else {
    let message = 'error internal in process form'
    let blockMessage = document.querySelector('#message')
    blockMessage.innerHTML = message
    blockMessage.className = ''
    blockMessage.className += ' alert'
    blockMessage.className += ' alert-warning'
  }
}
