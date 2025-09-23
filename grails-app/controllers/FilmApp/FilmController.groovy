package filmapp

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class FilmController {

    FilmService filmService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond filmService.list(params), model:[filmCount: filmService.count()]
    }

    def show(Long id) {
        respond filmService.get(id)
    }

    def create() {
        respond new Film(params)
    }

    def save(Film film) {
        if (film == null) {
            notFound()
            return
        }

        try {
            filmService.save(film)
        } catch (ValidationException e) {
            respond film.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'film.label', default: 'Film'), film.id])
                redirect film
            }
            '*' { respond film, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond filmService.get(id)
    }

    def update(Film film) {
        if (film == null) {
            notFound()
            return
        }

        try {
            filmService.save(film)
        } catch (ValidationException e) {
            respond film.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'film.label', default: 'Film'), film.id])
                redirect film
            }
            '*'{ respond film, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        filmService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'film.label', default: 'Film'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'film.label', default: 'Film'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
