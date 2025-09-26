package filmapp

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class GenreController {

    GenreService genreService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)

        if (params.q) {
            def genreList = genreService.searchByName(params.q, params)
            respond genreList, model: [genreCount: genreList.totalCount]
        } else {
            respond genreService.list(params), model: [genreCount: genreService.count()]
        }
    }

    def show(Long id) {
        def genre = genreService.get(id)
        respond genre
    }

    def create() {
        respond new Genre(params)
    }

    def save(Genre genre) {
        if (genre == null) {
            notFound()
            return
        }

        try {
            genreService.save(genre)
        } catch (ValidationException e) {
            respond genre.errors, view: 'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'genre.label', default: 'Genre'), genre.id])
                redirect genre
            }
            '*' { respond genre, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond genreService.get(id)
    }

    def update(Genre genre) {
        if (genre == null) {
            notFound()
            return
        }

        try {
            genreService.save(genre)
        } catch (ValidationException e) {
            respond genre.errors, view: 'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'genre.label', default: 'Genre'), genre.id])
                redirect genre
            }
            '*' { respond genre, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        genreService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'genre.label', default: 'Genre'), id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'genre.label', default: 'Genre'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
