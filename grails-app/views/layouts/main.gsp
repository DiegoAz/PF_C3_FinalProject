<!doctype html>
<html lang="en" class="no-js">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <title>
    <g:layoutTitle default="Grails" />
  </title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <asset:link href="favicon.ico" rel="icon" type="image/x-ico">
  </asset:link>
  <g:layoutHead/>
</head>

<body>
  <g:set var="springSecurityService" bean="springSecurityService" />
  <nav class="main-nav">
    <ul>
      <li>
        <a class="home" href="${createLink(uri: '/hero')}">
          Heroes
        </a>
      </li>
      <li>
        <a class="link" href="villains.html">Villanos</a>
      </li>
      <li>
        <a href="batallas.html">Batallas</a>
      </li>
    </ul>
    <g:link class="logout" controller='logout'>
      <asset:image src="logout.png" alt="logout" />
    </g:link>
    <div class="username">
      <h3>${springSecurityService.principal.username}</h3>
    </div>
  </nav>
  <g:layoutBody/>
  <asset:javascript src="application.js" />
</body>

</html>