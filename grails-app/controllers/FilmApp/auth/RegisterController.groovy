package FilmApp.auth

import grails.plugin.springsecurity.annotation.Secured
import grails.gorm.transactions.Transactional

@Secured('permitAll')
class RegisterController {

    def springSecurityService

    def create() { }

    @Transactional
    def save() {
        def chosenRole = params.role  // contoh: ROLE_ADMIN atau ROLE_USER
        def user = new User(
                username: params.username,
                password: springSecurityService.encodePassword(params.password),
                enabled: true
        )

        if (!user.save(flush: true)) {
            flash.message = "Gagal membuat akun. Cek kembali input."
            redirect(action: 'index')
            return
        }

        def role = Role.findByAuthority(chosenRole) ?: new Role(authority: chosenRole).save(flush: true)

        user.refresh()
        UserRole.create(user, role, true)

        flash.message = "Akun berhasil dibuat sebagai ${chosenRole}"
        redirect(controller: 'login', action: 'auth')
    }


}