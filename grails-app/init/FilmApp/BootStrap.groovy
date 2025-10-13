package FilmApp

import FilmApp.auth.User
import FilmApp.auth.Role
import FilmApp.auth.UserRole
import grails.plugin.springsecurity.SpringSecurityService

class BootStrap {
    SpringSecurityService springSecurityService

    def init = { servletContext ->
        User.withTransaction {
            def userRole = Role.findOrSaveWhere(authority: 'ROLE_USER')
            def user = User.findOrSaveWhere(username: 'admin')
            user.password = springSecurityService.encodePassword('password')
            userRole.save(flush: true)
            user.save(flush: true)

            if ((user.id && userRole.id) && !UserRole.exists(user.id, userRole.id)) {
                UserRole.create(user, userRole, true)
            }
        }
    }
    def destroy = {
    }
}

