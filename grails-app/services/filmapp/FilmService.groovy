package filmapp

import grails.gorm.transactions.Transactional

@Transactional
class FilmService {

    def get(Long id) {
        Film.get(id)
    }

    def save(Film film) {
        film.save(flush:true)
    }

    def delete(Long id) {
        Film.get(id)?.delete(flush:true)
    }
}
