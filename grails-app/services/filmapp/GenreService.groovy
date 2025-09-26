////package filmapp
////
////import grails.gorm.services.Service
////
////@Service(Genre)
////interface GenreService {
////
////    Genre get(Serializable id)
////
////    List<Genre> list(Map args)
////
////    Long count()
////
////    void delete(Serializable id)
////
////    Genre save(Genre genre)
////
//}

package filmapp

import grails.gorm.transactions.Transactional

@Transactional
class GenreService {
    Genre get(Serializable id){
        Genre.get(id)
    }

    List<Genre> list(Map args) {
        Genre.list(args)
    }

    Long count() {
        Genre.count()
    }

    void delete(Serializable id) {
        Genre.get(id)?.delete(flush: true)
    }

    Genre save(Genre genre) {
        genre.save(flush: true)
    }

    List<Genre> searchByName(String query, Map args) {
        String searchTerm = "%${query.trim()}%"
        Genre.createCriteria().list(args) {
            ilike("name", searchTerm)
        }
    }
}