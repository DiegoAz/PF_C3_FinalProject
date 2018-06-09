package co.com.mcu

import co.com.mcu.auth.*

class BootStrap {

    def init = { servletContext ->

    def adminRole = new Role(authority: 'ROLE_ADMIN').save()
    def adminUser = new User(username: 'admin', password: 'admin').save()
    UserRole.create adminUser, adminRole

    def fanRole = new Role(authority: 'ROLE_FAN').save()
    def fanUser = new User(username: '1', password: '1').save()
    UserRole.create fanUser, fanRole

    UserRole.withSession {
      it.flush()
      it.clear()
    }

    }
    def destroy = {
    }
}
