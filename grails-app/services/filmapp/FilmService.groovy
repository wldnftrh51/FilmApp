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