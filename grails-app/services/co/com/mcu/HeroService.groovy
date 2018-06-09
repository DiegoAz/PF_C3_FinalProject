package co.com.mcu

import grails.transaction.Transactional

class HeroService {

 @Transactional(readOnly = true)
  List list(Map params) {
    [Hero.list(params), Hero.count()]
  }

  @Transactional(readOnly = true)
  List listFavs() {
    return favs
  }

  @Transactional(readOnly = true)
  Integer count(Map params) {
    Hero.count()
  }

  @Transactional
  Hero updateHeroFeaturedImage(Long heroId, Integer version, byte[] bytes, String contentType) {
      Hero hero = Hero.get(heroId)
      if ( !hero ) {
        return null
      }
      hero.version = version
      hero.featuredImageBytes = bytes
      hero.featuredImageContentType = contentType
      hero.save()
      hero
    }

    @Transactional
    Hero uploadHeroFeaturedImage(byte[] bytes, String contentType) {
      Hero hero = new Hero()     
      hero.featuredImageBytes = bytes
      hero.featuredImageContentType = contentType
      hero.save()
      hero
    }

    @Transactional
    Hero save(NameCommand cmd) {
        def hero = new Hero()
        hero.properties = cmd.properties
        hero.save()
    }

    @Transactional
    void delete(Long heroId) {
      def hero = Hero.get(heroId)
      hero?.delete()
    }

    def getHero(Long heroId){
      log.info 'Adding to favorites...'
      def hero = Hero.get(heroId)
      hero          
    }

     @Transactional
    Hero update(NameUpdateCommand cmd) {
        def hero = Hero.get(cmd.id)
        if ( !hero ) {
            return null
        }
        hero.properties = cmd.properties
        hero.save()
    }



    // Hero get(Serializable id)

    // List<Hero> list(Map args)

    // Long count()

    // void delete(Serializable id)

    // Hero save(Hero hero)

}