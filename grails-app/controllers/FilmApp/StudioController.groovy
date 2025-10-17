package FilmApp

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class StudioController {

    StudioService studioService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def index(Integer max){
        params.max = Math.min(max ?: 10, 100)

        if (params.q){
            def studioList = studioService.searchByName(params.q, params)
            respond studioList, model: [studioCount: studioList.totalCount]
        } else {
            respond studioService.list(params), model: [studioCount: studioService.count()]
        }
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def show(Long id) {
        respond studioService.get(id)
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        respond new Studio(params)
    }

    @Secured(['ROLE_ADMIN'])
    def save(Studio studio) {
        if (studio == null) {
            notFound()
            return
        }

        if (studio.hasErrors()) {
            respond studio.errors, view: 'create'
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

    @Secured(['ROLE_ADMIN'])
    def edit(Long id) {
        respond studioService.get(id)
    }

    @Secured(['ROLE_ADMIN'])
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

    @Secured(['ROLE_ADMIN'])
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
