//package filmapp
//
//import grails.gorm.services.Service
//
//@Service(Studio)
//interface StudioService {
//
//    Studio get(Serializable id)
//
//    List<Studio> list(Map args)
//
//    Long count()
//
//    void delete(Serializable id)
//
//    Studio save(Studio studio)
//
//}

package filmapp

import grails.gorm.transactions.Transactional

import javax.sql.rowset.spi.TransactionalWriter

@Transactional
class StudioService {
    Studio get(Serializable id){
        Studio.get(id)
    }

    List<Studio> list(Map args) {
        Studio.list(args)
    }

    Long count() {
        Studio.count()
    }

    void delete(Serializable id){
        Studio.get(id)?.delete(flush: true)
    }

    Studio save(Studio studio) {
        studio.save(flush: true)
    }

    List<Studio> searchByName(String query, Map args){
        String searchTerm = "%${query.trim()}%"
        Studio.createCriteria().list(args) {
            ilike("name", searchTerm)
        }
    }
}