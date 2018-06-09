<html>
<head>
    <meta name="layout" content="basic"/>
    <title><g:message code='springSecurity.login.title'/></title>
</head>

<body>
<section class="wrapper">
    <section class="intro-card">
        <h3 class="title">mcu colombia</h3> 
        <p class="description">Club de Fans del Universo Cinematográfico de` Marvel en Colombia</p>
        <asset:image src="icons8-captain-america.png" alt="captain america"/>
        <asset:image src="icons8-cyclop-marvel.png" alt=""/>
        <asset:image src="icons8-groot.png" alt=""/>
        <asset:image src="icons8-hellcat.png" alt=""/>
        <asset:image src="icons8-hellraiser-pinhead.png" alt=""/>
        <asset:image src="icons8-hulk.png" alt=""/>
        <asset:image src="icons8-human-torch.png" alt=""/>
        <asset:image src="icons8-iron-man.png" alt=""/>
        <asset:image src="icons8-jessica-jones.png" alt=""/>
        <asset:image src="icons8-luke-cage.png" alt=""/>
        <asset:image src="icons8-magneto.png" alt=""/>
        <asset:image src="icons8-professor-x.png" alt=""/>
        <asset:image src="icons8-purple-man.png" alt=""/>
        <asset:image src="icons8-spider-man-head.png" alt=""/>
        <asset:image src="icons8-storm-marvel.png" alt=""/>
        <asset:image src="icons8-thor.png")       alt=""/>
    </section>
    <section class="login-card">
        <h3 class="title"><g:message code='springSecurity.login.header'/></h3>
        <p class="description"><g:message code='springSecurity.login.description'/></p>
        <g:if test='${flash.message}'>
            <div class="login_message">${flash.message}</div>
        </g:if>
        <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" class="login-form" autocomplete="off">      
            <div class="group">
                <input type="text" name="${usernameParameter ?: 'username'}" id="username"/>
                <label class="label" for="username"><g:message code='springSecurity.login.username.label'/></label>
                <span class="bar"></span>             
            </div>
            <div class="group">
                <input type="password" name="${passwordParameter ?: 'password'}" id="password"/>
                <label class="label" for="password"><g:message code='springSecurity.login.password.label'/></label>
                <span class="bar"></span>              
            </div>
          %{--  <div class="checkbox-box">                
                <label class="material-checkbox" for="remember_me">
                  <input type="checkbox" class="checkbox" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if>/>
                  <span><g:message code='springSecurity.login.remember.me.label'/></span>
                </label>
            </div> --}%
            <div>
                <input type="submit" id="submit" value="${message(code: 'springSecurity.login.button')}" class="button" />
            </div>
        </form>
    </section>
</section>
<script>
    (function() {
        document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
    })();
</script>
</body>
</html>