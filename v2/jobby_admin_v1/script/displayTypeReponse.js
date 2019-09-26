/* eslint-disable no-unused-vars */

async function displayType () {
  const reponse = await fetch('http://jobby:6015/typeReponse/')
  const questionTypes = await reponse.json()
  const dom = document.querySelector('#typeReponse')

  let templateFinal = questionTypes.map(questionType =>
    `<option  value="">${questionType.questionTypeLabel}</option>
      `
  )
  dom.innerHTML = templateFinal
}
