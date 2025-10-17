package FilmApp

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USER', 'ROLE_ADMIN'])
class HomeController {

    def index() {
        render(view: '/index')
    }
}