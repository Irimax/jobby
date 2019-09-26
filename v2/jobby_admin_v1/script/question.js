/* eslint-disable no-unused-vars */

async function displayQuestions () {
  const searchParams = new URLSearchParams(window.location.search)
  const myApiUrl = 'http://jobby:6015/questions/categoriesId/' + searchParams.get('categoryId')
  let reponse = await fetch(myApiUrl)
  let questions = await reponse.json()
  let templateFinal = questions.map(question =>
    `<tr>
              <th scope="row"><a href="question.html?questionId=${question.id}">${question.id}</a></th>
              <td><a href="question.html?questionId=${question.id}">${question.label}</a></td>
              <td><a href="question.html?questionId=${question.id}">${question.code}</a></td>
              <td><a href="question.html?questionId=${question.id}">${question.myCount}</a></a></td>
              <td><a href="question.html?questionId=${question.id}">${question.questionOrder}</a></td>
              <td><a href="question.html?questionId=${question.id}">${question.qtype}</a></td>
          </tr>
          `
  )

  document.querySelector('#arrayQuestion').innerHTML = templateFinal.join('')
}
