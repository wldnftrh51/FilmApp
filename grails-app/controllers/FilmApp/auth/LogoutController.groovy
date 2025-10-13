package FilmApp.auth

import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler

class LogoutController {

    def index() {
        def auth = SecurityContextHolder.context.authentication
        if (auth) {
            new SecurityContextLogoutHandler().logout(request, response, auth)
        }
        redirect(controller: 'login', action: 'auth')
    }
}
