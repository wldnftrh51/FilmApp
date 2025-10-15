package FilmApp

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class GenreController {

    GenreService genreService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)

        if (params.q) {
            def genreList = genreService.searchByName(params.q, params)
            respond genreList, model: [genreCount: genreList.totalCount]
        } else {
            respond genreService.list(params), model: [genreCount: genreService.count()]
        }
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def show(Long id) {
        def genre = genreService.get(id)
        respond genre
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        respond new Genre(params)
    }

    @Secured(['ROLE_ADMIN'])
    def save(Genre genre) {
        if (genre == null) {
            notFound()
            return
        }

        if (genre.hasErrors()) {
            respond genre.errors, view: 'create'
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

    @Secured(['ROLE_ADMIN'])
    def edit(Long id) {
        respond genreService.get(id)
    }

    @Secured(['ROLE_ADMIN'])
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

    @Secured(['ROLE_ADMIN'])
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

    @Secured(['ROLE_ADMIN'])
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
