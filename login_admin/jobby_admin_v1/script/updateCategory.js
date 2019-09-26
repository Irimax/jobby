/* eslint-disable no-unused-vars */
async function updateCategory () {
  let responsePFEnv
  try {
    responsePFEnv = await fetch('https://webhook.manoha.art/updateCategory', {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'

      },
      body: JSON.stringify({
        categoryLabel: document.querySelector('input[name=categoryLabel]').value,
        categoryId: document.querySelector('input[name=categoryId]').value,
        categoryIsArchived: document.querySelector('select[name=categoryIsArchived]').value,
        categoryImage: document.querySelector('input[name=categoryImage]').value,
        categoryParentId: document.querySelector('select[name=parentOrChild]').value
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
    let message = 'all isgood in the wood'
    document.location.href = 'https://jobby-admin.manoha.art/views/categories.html'
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

// / première méthode
//        async function updateCategory() {
//            let responsePFEnv
//            try{
//                 responsePFEnv = await fetch ("https://webhook.manoha.art/categorie", {
//                    method: 'POST',
//                    headers: {
//                        'Accept': 'application/json',
//                        'Content-Type': 'application/json',

//                    },
//                    body:JSON.stringify({
//                        categoryLabel: document.querySelector('#category-label').value,
//                        categoryId: 6,
//                        categoryIsArchived: true,
//                        categoryImage:document.querySelector('input[name=categoryImage]').value

//                    })
//                }
//                )
//            }
//            catch(error){ // network error
//                let message = 'all go down in Internet'
//                let blockMessage = document.querySelector('#message')
//                blockMessage.innerHTML=message
//                blockMessage.className += " alert";
//                blockMessage.className += " alert-warning";

//            }
//            // no network problem
//            const responsePF = await responsePFEnv.json()
//            if(responsePF.error === false){
//                let message = 'all isgood in the wood'
//                let blockMessage = document.querySelector('#message')
//                blockMessage.innerHTML=message
//                blockMessage.className += " alert";
//                blockMessage.className += " alert-success";

//            } else {
//                let message = 'error internal in process form'
//                let blockMessage = document.querySelector('#message')
//                blockMessage.innerHTML=message
//                blockMessage.className += " alert";
//                blockMessage.className += " alert-warning";
//            }

//        }
