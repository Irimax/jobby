/* eslint-disable no-unused-vars */
async function createCategory () {
  let responsePFEnv
  try {
    responsePFEnv = await fetch('http://127.0.0.1:11010/createCategory', {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'

      },
      body: JSON.stringify({
        categoryLabel: document.querySelector('input[name=categoryLabel]').value

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
    let blockMessage = document.querySelector('#message')
    let categoryId = responsePF.datas
    document.location.href = 'http://127.0.0.1:5001/Jobby/jobby_admin_v1/views/category.html?categoryId=' + categoryId
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
//                 responsePFEnv = await fetch ("http://127.0.0.1:11010/categorie", {
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
