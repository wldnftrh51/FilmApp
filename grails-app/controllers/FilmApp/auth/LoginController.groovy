package FilmApp.auth

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class LoginController {

    def auth() {
        render view: '/login/auth'
    }
}