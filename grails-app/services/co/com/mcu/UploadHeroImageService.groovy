package co.com.mcu

class UploadHeroImageService {

    def heroService

    Hero uploadFeatureImage(FeaturedImageCommand cmd) {
        byte[] bytes = cmd.featuredImageFile.bytes
        String contentType = cmd.featuredImageFile.contentType
        heroService.updateHeroFeaturedImage(cmd.id, cmd.version, bytes, contentType)
    }

    Hero uploadFeatureImageFirst(FeaturedImageCommand cmd) {
        // byte[] bytes = cmd.featuredImageFile.bytes       
        byte[] bytes = cmd.featuredImageFile.bytes
        String contentType = cmd.featuredImageFile.contentType
        heroService.uploadHeroFeaturedImage(bytes, contentType)
    }
}
