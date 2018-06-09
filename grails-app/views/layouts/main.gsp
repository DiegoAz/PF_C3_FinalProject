<!doctype html>
<html lang="en" class="no-js">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <title>
    <g:layoutTitle default="Grails" />
  </title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
  <asset:stylesheet src="application.css" />
  <g:layoutHead/>
</head>

<body>
  <nav class="main-nav">
    <ul>
      <li>
        <a class="link" href="home.html">Home</a>
      </li>
      <li>
        <a class="link" href="heroes.html">Heroes</a>
      </li>
      <li>
        <a class="link" href="villains.html">Villanos</a>
      </li>
      <li>
        <a href="batallas.html">Batallas</a>
      </li>
    </ul>
    <button class="user">
      <img src="img/user.png" />
    </button>
    <button class="alerts">
      <img src="img/alert.png" />
    </button>
  </nav>
  <g:layoutBody/>
  <asset:javascript src="application.js" />
</body>

</html>