/** Algo display categories
 recuperer et afficher les items et les rendre cliquable
  **/

// declaration function
async function displayBlog () {
  // 1 - recuperer json
  const myApiUrl = 'https://jobby-api.manoha.art/blog'
  const reponse = await fetch(myApiUrl)
  const blog = await reponse.json()

}
