package filmapp

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class StudioController {

    StudioService studioService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

//    def index(Integer max) {
//        params.max = Math.min(max ?: 10, 100)
//        respond studioService.list(params), model:[studioCount: studioService.count()]
//    }

    def index(Integer max){
        params.max = Math.min(max ?: 10, 100)

        if (params.q){
            String searchTerm = "%${params.q.trim()}%"
            def studioList = Studio.createCriteria().list(params){
                ilike("name", searchTerm)
            }
            println "Found ${studioList.totalCount} result for search '${params.q}'"
            respond studioList, model: [studioCount: studioList.totalCount]
        } else {
            respond studioService.list(params), model: [filmCount: studioService.count()]
        }
    }

    def show(Long id) {
        respond studioService.get(id)
    }

    def create() {
        respond new Studio(params)
    }

    def save(Studio studio) {
        if (studio == null) {
            notFound()
            return
        }

        try {
            studioService.save(studio)
        } catch (ValidationException e) {
            respond studio.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'studio.label', default: 'Studio'), studio.id])
                redirect studio
            }
            '*' { respond studio, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond studioService.get(id)
    }

    def update(Studio studio) {
        if (studio == null) {
            notFound()
            return
        }

        try {
            studioService.save(studio)
        } catch (ValidationException e) {
            respond studio.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'studio.label', default: 'Studio'), studio.id])
                redirect studio
            }
            '*'{ respond studio, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        studioService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'studio.label', default: 'Studio'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'studio.label', default: 'Studio'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
