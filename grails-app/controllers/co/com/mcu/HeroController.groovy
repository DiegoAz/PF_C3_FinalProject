package co.com.mcu

import static org.springframework.http.HttpStatus.OK
import static org.springframework.http.HttpStatus.NOT_FOUND
import static org.springframework.http.HttpStatus.NO_CONTENT
import static org.springframework.http.HttpStatus.CREATED
import grails.transaction.Transactional

@SuppressWarnings('LineLength')
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
class HeroController {

  def heroService
  def uploadHeroImageService
  // User user


  static allowedMethods = [
    save: "POST", 
    update: "PUT", 
    delete: "DELETE",
    uploadFeaturedImage: 'POST',
  ]



 @Transactional(readOnly = true)
 def featuredImage(Hero hero) {
  if (hero == null || hero.featuredImageBytes == null) {
    transactionStatus.setRollbackOnly()
    notFound()
    return
  }
  render file: hero.featuredImageBytes, contentType: hero.featuredImageContentType
}

@Transactional(readOnly = true)
def editFeaturedImage(Hero hero) {
  respond hero
}

def uploadFeaturedImage(FeaturedImageCommand cmd) {
  if (cmd == null) {
    notFound()
    return
  }

  if (cmd.hasErrors()) {
    respond(cmd.errors, model: [hero: cmd], view: 'editFeaturedImage')
    return
  }

  def hero = uploadHeroImageService.uploadFeatureImage(cmd)

  if (hero == null) {
    notFound()
    return
  }

  if (hero.hasErrors()) {
    respond(hero.errors, model: [hero: hero], view: 'editFeaturedImage')
    return
  }

  request.withFormat {
    form multipartForm {
      flash.message = message(code: 'default.updated.message', args: [message(code: 'hero.label', default: 'Hero'), hero.id])
      redirect action: 'edit', id: hero.id
    }
    '*' { respond hero, [status: OK] }
  }
}

def index(Integer max) {   
  params.max = Math.min(max ?: 20, 100)
  def (l, total) = heroService.list(params)
  respond l, model:[heroCount: total]
}

@Secured('ROLE_FAN')
def fanHome(Integer max) {   
  params.max = Math.min(max ?: 20, 100)
  def (l, total) = heroService.list(params)
  respond l, model:[heroCount: total]
}

def show(Hero hero) {
  respond hero
}

def create() {
   respond new Hero(params)     
}

def save(NameCommand cmd) {
  if (cmd == null) {
    notFound()
    return
  }

  if (cmd.hasErrors()) {
    respond cmd.errors, model: [hero: cmd], view:'create'
    return
  }    

  def hero = heroService.save(cmd)

  if (hero == null) {
    notFound()
    return
  }

  if (hero.hasErrors()) {
    respond hero.errors, model: [hero: hero], view:'create'
    return
  }

  request.withFormat {
    form multipartForm {
      flash.message = message(code: 'default.created.message', args: [message(code: 'hero.label', default: 'Hero'), hero.id])
      redirect action: "edit", id: hero.id
    }
    '*' { respond hero, [status: CREATED] }
  }
}

@Transactional(readOnly = true)
def edit(Hero hero) {
  respond hero
}

def update(NameUpdateCommand cmd) {
  if (cmd == null) {
    notFound()
    return
  }

  if (cmd.hasErrors()) {
    respond hero.errors, model: [hero: cmd], view:'edit'
    return
  }


  def hero = heroService.update(cmd)

  if (hero == null) {
    notFound()
    return
  }

  if (hero.hasErrors()) {
    respond hero.errors, model: [hero: hero], view:'edit'
    return
  }

  request.withFormat {
    form multipartForm {
      flash.message = message(code: 'default.updated.message', args: [message(code: 'hero.label', default: 'Hero'), hero.id])
      redirect hero
    }
    '*'{ respond hero, [status: OK] }
  }
}

def delete(Long id) {
  if (id == null) {
    notFound()
    return
  }

  heroService.delete(id)

  request.withFormat {
    form multipartForm {
      flash.message = message(code: 'default.deleted.message', args: [message(code: 'hero.label', default: 'Hero'), id])
      redirect action:"index", method:"GET"
    }
    '*'{ render status: NO_CONTENT }
  }
}

  
protected void notFound() {
  request.withFormat {
    form multipartForm {
      flash.message = message(code: 'default.not.found.message', args: [message(code: 'hero.label', default: 'Hero'), params.id])
      redirect action: "index", method: "GET"
    }
    '*'{ render status: NOT_FOUND }
  }
}
}
