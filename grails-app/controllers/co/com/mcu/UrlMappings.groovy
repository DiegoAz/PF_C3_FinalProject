package co.com.mcu

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller:"hero")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
