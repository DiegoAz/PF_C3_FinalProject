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
    <h2>You have created ${heroCount} heroes</h2>
    <div class="wrapper">
      <g:each in="${heroList}" var="hero">
        <div class="hero-card">
          <div class="x">
            <h4 class="title">${hero.name}</h4>
            <g:if test="${hero.featuredImageBytes}">
              <img src="<g:createLink controller=" hero " action="featuredImage " id="${hero.id} "/>"/>
            </g:if>
          </div>
          <div class="buttons">
            <g:link action="edit" class="button edit" id="${hero.id}">
              <asset:image src="edit.png" alt="edit hero" />
            </g:link>
            <g:form method="DELETE" resource="${hero}" class="f-delete">
              <input class="button delete" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" type="submit" value="" />
            </g:form>
          </div>
        </div>
      </g:each>
    </div>
</body>

</html>