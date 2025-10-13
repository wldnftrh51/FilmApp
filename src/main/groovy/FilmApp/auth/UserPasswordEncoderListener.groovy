package FilmApp.auth

import grails.gorm.transactions.Transactional
import org.springframework.security.crypto.password.PasswordEncoder

@Transactional
class UserPasswordEncoderListener {

    PasswordEncoder passwordEncoder

    def beforeInsert(User user) {
        encodePassword(user)
    }

    def beforeUpdate(User user) {
        if (user.isDirty('password')) {
            encodePassword(user)
        }
    }

    private void encodePassword(User user) {
        user.password = passwordEncoder.encode(user.password)
    }
}
