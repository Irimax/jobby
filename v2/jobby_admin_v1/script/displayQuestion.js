/* eslint-disable no-unused-vars */

async function displayQuestion () {
  const searchParams = new URLSearchParams(window.location.search)
  const myApiUrl = 'http://jobby:6015/question/idquestion/' + searchParams.get('questionId')
  let reponse = await fetch(myApiUrl)
  let questions = await reponse.json()
  let templateFinal = questions.map(question =>
    `${question.label}
   `
  )
  document.querySelector('#label').innerHTML = templateFinal.join('')
  document.querySelector('#question').value = templateFinal.join('')
  document.querySelector('#questionOrder').value = questions[0].questionOrder
  document.querySelector('form.container input[name=questionId]').value = searchParams.get('questionId')
  document.querySelector('form.container input[name=question_categoryId]').value = searchParams.get('question_categoryId')
  // document.querySelector('#typeReponse').value = questions[0].question_questionTypeId
  // document.querySelector('#question_categoryId').value = questions.question_categoryId

  let options = document.querySelectorAll('#questionIsArchived option')
  for (let i = 0; i < options.length; i++) {
    let option = options[i]
    let valueCurrent = option.value === 'true' ? 1 : 0
    if (questions[0].questionIsArchived === valueCurrent) {
      option.selected = true
    }
  }
}
