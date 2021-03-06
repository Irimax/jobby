/* eslint-disable no-unused-vars */

async function displayCategories () {
  const myApiUrl = 'http://jobby:6015/categories'
  let reponse = await fetch(myApiUrl)
  let categories = await reponse.json()

  let templateFinal = categories.map(category =>
    `<tr>
                        <th scope="row"><a href="">${category.id}</a></th>
                        <td><a href="category.html?categoryId=${category.id}">${category.label}</a></td>
                        <td><a href="category.html?categoryId=${category.id}">${category.code}</a></a></td>
                        <td><a href="category.html?categoryId=${category.id}">${category.myCount}</a></a></td>
                        <td><a href="category.html?categoryId=${category.id}">${category.img}</a></a></td>
                        <td><a href="category.html?categoryId=${category.id}">${category.archive}</a></a></td>
                    </tr>
                    `
  )

  document.querySelector('#array').innerHTML = templateFinal.join('')
}
