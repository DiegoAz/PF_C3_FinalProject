package co.com.mcu

class Hero {
  
  String name
  byte[] featuredImageBytes
  String featuredImageContentType
  
  // static belongsTo = User
  // static hasMany = [users: User]  

    static constraints = {
      featuredImageBytes nullable: true
      featuredImageContentType nullable: true
    }

     static mapping = {
        featuredImageBytes column: 'featured_image_bytes', sqlType: 'bytea' 
    }
}
