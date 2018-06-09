<!doctype html>
<html>

<head>
  <meta content="main" name="layout" />
  <g:set value="${message(code: 'hero.label', default: 'Hero')}" var="entityName">
  </g:set>
  <title>
    MCU Fans COLOMBIA
  </title>
  <asset:stylesheet src="application.css" />
</head>
</head>

<body>
  <h1>Participa en la comunidad de fans del MCU en Colombia</h1>
  <li>
    <a class="button" href="${createLink(uri: '/login')}">
      <g:message code="default.home.label" />
    </a>
  </li>
  <li>
    <g:link controller="hero" action="index">Registrarse</g:link>
  </li>
</body>

</html>