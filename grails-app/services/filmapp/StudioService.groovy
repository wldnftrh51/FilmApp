package filmapp

import grails.gorm.services.Service

@Service(Studio)
interface StudioService {

    Studio get(Serializable id)

    List<Studio> list(Map args)

    Long count()

    void delete(Serializable id)

    Studio save(Studio studio)

}