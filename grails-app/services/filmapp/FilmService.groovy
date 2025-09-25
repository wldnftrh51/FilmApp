//package filmapp
//
//import grails.gorm.transactions.Transactional
//
//@Transactional
//class FilmService {
//
//    def get(Long id) {
//        Film.get(id)
//    }
//
//    def save(Film film) {
//        film.save(flush:true)
//    }
//
//    def delete(Long id) {
//        Film.get(id)?.delete(flush:true)
//    }
//}
package filmapp

import grails.gorm.services.Service

@Service(Film)
interface FilmService {

    Film get(Serializable id)

    List<Film> list(Map args)

    Long count()

    void delete(Serializable id)

    Film save(Film film)
}
