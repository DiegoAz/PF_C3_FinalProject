<!DOCTYPE html>
<html>

<head>
  <meta content="main" name="layout" />
  <g:set value="${message(code: 'hero.label', default: 'Hero')}" var="entityName">
  </g:set>
  <title>
    <g:message args="[entityName]" code="default.list.label">
    </g:message>
  </title>
  <asset:stylesheet src="admin.css" />
  <asset:javascript src="application.js" />
</head>

<body>
  <div class="nav" role="navigation">
    <ul>
      <li>
        <a class="home" href="${createLink(uri: '/')}">
          <g:message code="default.home.label">
          </g:message>
        </a>
      </li>
      <li>
        <g:link action="create" class="create">
          <g:message args="[entityName]" code="default.new.label">
          </g:message>
        </g:link>
      </li>
    </ul>
  </div>
  <div class="content scaffold-list" id="list-hero" role="main">
    <h1 class="main-title">
      <g:message args="[entityName]" code="default.list.label">
      </g:message>
    </h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">
        ${flash.message}
      </div>
    </g:if>
    <h2>You have ${favsCount} favorite heroes</h2>
    <div class="wrapper">
      <g:each in="${favs}" var="hero">
        <div class="hero-card">
          <div class="x">
            <h4 class="title">${hero.name}</h4>
            <g:if test="${hero.featuredImageBytes}">
              <img src="<g:createLink controller=" hero " action="featuredImage " id="${hero.id} "/>"/>
            </g:if>
          </div>
          <div class="buttons">
            <g:link action="addToFavorites" class="button" resource="${this.hero}">
              <div class="starToggler">
                <asset:image src="star.png " alt="battles hero " />
                <asset:image src="starActive.png " alt="battles hero " style="display:none" />
              </div>
            </g:link>
            <g:link action="battles" class="button battles ">
              <asset:image src="battles.png " alt="battles hero " />
            </g:link>
          </div>
        </div>
      </g:each>
    </div>
</body>

</html>