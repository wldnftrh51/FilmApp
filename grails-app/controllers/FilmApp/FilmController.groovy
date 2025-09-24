package filmapp

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class FilmController {

    FilmService filmService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond filmService.list(params), model: [filmCount: filmService.count()]
    }

    def show(Long id) {
        respond filmService.get(id)
    }

    // Create film
    def create() {
        respond new Film(), model: [studios: Studio.list(), genres: Genre.list()]
    }

    // Save film
    def save(Film film) {
        if (film == null) {
            notFound()
            return
        }

        try {
            filmService.save(film)
        } catch (ValidationException e) {
            // Kirim kembali studio & genre agar form tidak error
            respond film.errors, view: 'create', model: [studios: Studio.list(), genres: Genre.list()]
            return
        }

        flash.message = message(code: 'default.created.message',
                args: [message(code: 'film.label', default: 'Film'), film.id])
        redirect action: "show", id: film.id
    }

    // Edit film
    def edit(Long id) {
        def film = filmService.get(id)
        if (!film) {
            notFound()
            return
        }
        respond film, model: [studios: Studio.list(), genres: Genre.list()]
    }

    // Update film
    def update(Film film) {
        if (film == null) {
            notFound()
            return
        }

        try {
            filmService.save(film)
        } catch (ValidationException e) {
            respond film.errors, view: 'edit', model: [studios: Studio.list(), genres: Genre.list()]
            return
        }

        flash.message = message(code: 'default.updated.message',
                args: [message(code: 'film.label', default: 'Film'), film.id])
        redirect action: "show", id: film.id
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        filmService.delete(id)
        flash.message = message(code: 'default.deleted.message',
                args: [message(code: 'film.label', default: 'Film'), id])
        redirect action: "index", method: "GET"
    }

    protected void notFound() {
        flash.message = message(code: 'default.not.found.message',
                args: [message(code: 'film.label', default: 'Film'), params.id])
        redirect action: "index", method: "GET"
    }
}
