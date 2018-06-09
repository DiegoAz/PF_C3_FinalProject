<!DOCTYPE html>
<html>

<head>
  <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'hero.label', default: 'Hero')}" />
  <title>
    <g:message code="default.edit.label" args="[entityName]" />
  </title>
</head>

<body>
  <div class="nav" role="navigation">
    <ul>
      <li>
        <a class="home" href="${createLink(uri: '/')}">
          <g:message code="default.home.label" />
        </a>
      </li>
      <li>
        <g:link class="list" action="index">
          <g:message code="default.list.label" args="[entityName]" /></g:link>
      </li>
      <li>
        <g:link class="create" action="create">
          <g:message code="default.new.label" args="[entityName]" /></g:link>
      </li>
    </ul>
  </div>
  <div id="edit-hero" class="content scaffold-edit" role="main">
    <h1>
      <g:message code="default.edit.label" args="[entityName]" />
    </h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.hero}">
      <ul class="errors" role="alert">
        <g:eachError bean="${this.hero}" var="error">
          <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
            <g:message error="${error}" />
          </li>
        </g:eachError>
      </ul>
    </g:hasErrors>
    <g:form resource="${this.hero}" method="PUT">
      <g:hiddenField name="version" value="${this.hero?.version}" />
      <fieldset class="form">
        <f:all bean="hero" except="featuredImageBytes,featuredImageContentType" />
      </fieldset>
      <fieldset class="buttons">
        <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
      </fieldset>
    </g:form>
    <g:uploadForm name="uploadFeaturedImage" action="uploadFeaturedImage">
      <g:if test="${hero.featuredImageBytes}">
        <img src="<g:createLink controller=" hero " action="featuredImage " id="${hero.id} "/>"/>
      </g:if>
      <g:hiddenField name="id" value="${this.hero?.id}" />
      <g:hiddenField name="version" value="${this.hero?.version}" />
      <input type="file" name="featuredImageFile" />
      <fieldset class="buttons">
        <input class="save" type="submit" value="${message(code: 'hero.featuredImage.upload.label', default: 'Upload')}" />
      </fieldset>
    </g:uploadForm>
  </div>
</body>

</html>