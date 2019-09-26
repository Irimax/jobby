async function displayConnect () {
  const myApiUrl = 'http://jobby:6015/???????'
  let reponse = await fetch(myApiUrl)
  let connexion = await reponse.json()

  let templateFinal = connexion.map(connect =>
    `  <form class="register_connexion" action="../script/connexion.js" method="POST">
      <div class="form-group">
          <label for="Pseudonyme">${connect.name}</label>
          <input type="text" class="form-control" id="Pseudonyme">
      </div>
      <div class="form-group">
          <label for="Password">${connect.password}</label>
          <input type="text" class="form-control" id="Password">
      </div>
      <button type="submit" class="btn btn-outline-primary">Connexion</button>
  </form>
                      `
  )

  document.querySelector('#array').innerHTML = templateFinal.join('')
}

