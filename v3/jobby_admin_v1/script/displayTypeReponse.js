/* eslint-disable no-unused-vars */

async function displayType () {
  const reponse = await fetch('http://jobby:6005/typeReponse/')
  const questionTypes = await reponse.json()
  const dom = document.querySelector('#typeReponse')

  let templateFinal = questionTypes.map(questionType =>
    `<option  value="${questionType.questionTypeId}">${questionType.questionTypeLabel}</option>
      `
  )
  dom.innerHTML = templateFinal
}



// async function displayType (monTypeId) {
//   const reponse = await fetch('http://jobby:6005/typeReponse/')
//   const questionTypes = await reponse.json()
//   const dom = document.querySelector('#typeReponse')

//   let templateFinal = questionTypes.map(questionType => {
//     let seleted = questionType.questionTypeId === monTypeId ? 'selected' : ''
//     return `<option  ${seleted} value="${questionType.questionTypeId}">${questionType.questionTypeLabel}</option>
// `
//   }

//   )
//   dom.innerHTML = templateFinal
// }
