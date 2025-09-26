package filmapp

class FilmController {

    FilmService filmService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)

        if (params.q) {
            def filmList = filmService.searchByTitle(params.q, params)
            respond filmList, model: [filmCount: filmList.totalCount]
        } else {
            respond filmService.list(params), model: [filmCount: filmService.count()]
        }
    }

    def show(Long id){
        def film = filmService.get(id)
        respond film
    }

    def create() {
        respond new Film(), model: [
                studios: filmService.listStudios(),
                genres: filmService.listGenres()]
    }

    def save(Film film) {
        def genreIds = params.list('genres.id') ?: []
        def savedFilm = filmService.saveFilmWithGenres(film, genreIds)

        if (!savedFilm?.id) {
            respond savedFilm.errors,
                    view: 'create',
                    model: [
                            studios: filmService.listStudios(),
                            genres: filmService.listGenres()]
            return
        }

        redirect action: "show", id: savedFilm.id
    }

    def edit(Long id){
        def film = filmService.getWithGenres(id)
        if (!film) {
            notFound()
            return
        }

        respond film, model: [
                studios: filmService.listStudios(),
                genres: filmService.listGenres()
        ]
    }

    def update(Long id) {
        def film = filmService.get(id)
        if(!film) {
            notFound()
            return
        }

        film.properties = params

        def genreIds = params.list('genres.id') ?: []
        def updateFilm = filmService.saveFilmWithGenres(film, genreIds)

        if (!updateFilm?.id){
            respond updateFilm.errors,
            view: 'edit',
            model: [
                    studios: filmService.listStudios(),
                    genres: filmService.listGenres()
            ]
            return
        }
        redirect action: 'show', id: updateFilm.id
    }

    def delete(Long id) {
        if (!id) {
            notFound()
            return
        }
        filmService.delete(id)
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'film.label', default: 'Film'), id])
        redirect action: "index", method: "GET"
    }

    protected void notFound() {
        flash.message = message(code: 'default.not.found.message', args: [message(code: 'film.label', default: 'Film'), params.id])
        redirect action: "index", method: "GET"
    }
}
