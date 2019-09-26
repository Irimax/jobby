async function displayForm () {

  let monUrl = document.location.href
  let myCategoryId = monUrl.split('/')[4]

  const myApiUrl = ('http://jobby:6015/questions?question_categoryId=' + myCategoryId)
  const reponse = await fetch(myApiUrl)
  const questionsJson = await reponse.json()
  const formDOM = document.querySelector('#displayForm')

  for (let index = 0; index < questionsJson.length; index++) {
    const questionJson = questionsJson[index]
    const { type } = questionJson
    if (type === 'date') {
      formDOM.innerHTML += generateInputDate(questionJson)
    } else if (type === 'text') {
      formDOM.innerHTML += generateInputText(questionJson)
    } else if (type === 'radio') {
      formDOM.innerHTML += generateInputRadio(questionJson)
    } else if (type === 'checkbox') {
      formDOM.innerHTML += generateInputCheckbox(questionJson)
    } else if (type === 'select') {
      formDOM.innerHTML += generateInputSelect(questionJson)
    } else if (type === 'textarea') {
      formDOM.innerHTML += generateInputTextArea(questionJson)
    }
  }
}

//  Function Text

function generateInputText (questionJson) {
  const label = questionJson.title
  const { name } = questionJson
  const { type } = questionJson
  const template = `<div class="questions" ><p class="form-label">${label}</p>
                    <input type="${type}" name=${name} value=""></div>`

  return template
}

// Function Date

function generateInputDate (questionJson) {
  const label = questionJson.title
  const { name } = questionJson
  const { type } = questionJson
  const template = `<div class="questions" ><p class="form-label">${label}</p>
                    <input type="${type}" name="${name}" value=""></div>`

  return template
}

// Function Radio

function generateInputRadio (questionJson) {
  const { reponses } = questionJson

  let templateIntermediaire = ''
  for (let index = 0; index < reponses.length; index++) {
    let ischecked = ''
    if (index === 0) {
      ischecked = 'checked'
    }
    const title = reponses[index].reponses
    const { name } = reponses[index]
    const { value } = reponses[index]
    const { type } = questionJson
    templateIntermediaire += ` <span>
        <label>${title}</label>
        <input type="${type}" ${ischecked} name=${name} value="${value}">
    </span>`
  }

  const { title } = questionJson
  const template = ` <div class="questions">
    <p class="form-label">${title}</p>${templateIntermediaire}</div>`

  return template
}

// Function CheckBox

function generateInputCheckbox (questionJson) {
  const { reponses } = questionJson

  let templateIntermediaire = ''
  for (let index = 0; index < reponses.length; index++) {
    const title = reponses[index].reponses
    const { name } = reponses[index]
    const { value } = reponses[index]
    const { type } = questionJson
    templateIntermediaire += ` <span>
        <label>${title}</label>
        <input type="${type}" name="${name}" value=${value}>
    </span>`
  }

  const label = questionJson.title
  const template = ` <div class="questions">
    <p class="form-label">${label}</p>${templateIntermediaire}</div>`

  return template
}

//  Function Select

function generateInputSelect (questionJson) {
  const { reponses } = questionJson

  let templateIntermediaire = ''
  for (let index = 0; index < reponses.length; index++) {
    const value = reponses[index].reponses
    templateIntermediaire += `
            <option  value="${value}">${value}</option>
        `
  }

  const label = questionJson.title
  const { name } = questionJson
  const template = `<div class="questions">
         <p class="form-label">${label}</p>
         <select name="${name}">${templateIntermediaire}</select></div>`

  return template
}

//  Function textArea
function generateInputTextArea (questionJson) {
  const label = questionJson.title
  const { name } = questionJson
  const { type } = questionJson
  const template = `<div class="questions" ><p class="form-label">${label}</p>
    <textarea class="text" type"${type}" name="${name}" value="" cols="20" rows="10"></textarea></div>`

  return template
}
