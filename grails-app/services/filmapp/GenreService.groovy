package filmapp

import grails.gorm.services.Service

@Service(Genre)
interface GenreService {

    Genre get(Serializable id)

    List<Genre> list(Map args)

    Long count()

    void delete(Serializable id)

    Genre save(Genre genre)

}