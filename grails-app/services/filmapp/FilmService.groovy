package filmapp

import grails.gorm.transactions.Transactional

@Transactional
class FilmService {
    Film get(Serializable id) {
        Film.get(id)
    }

    List<Film> list(Map args) {
        Film.list(args)
    }

    List<Studio> listStudios() {
        Studio.list()
    }

    List<Genre> listGenres() {
        Genre.list()
    }

    Long count() {
        Film.count()
    }

    void delete(Serializable id) {
        Film.get(id)?.delete(flush: true)
    }

    Film save(Film film) {
        film.save(flush: true)
    }
    @Transactional
    Film saveFilmWithGenres(Film film, List<String> genreIds) {
        if (!film) return null
        film.genres?.clear()
        genreIds?.each { id ->
            try {
                def genre = Genre.get(id.toLong())
                if (genre) {
                    film.addToGenres(genre)
                }
            } catch (NumberFormatException e) {
                log.warn "Invalid genre id: $id"
            }
        }
        if (!film.validate()) {
            return film
        }
        film.save(flush: true)
        return film
    }

    Film getWithGenres(Long id) {
        Film.createCriteria().get {
            eq('id', id)
            fetchMode 'genres', org.hibernate.FetchMode.JOIN
        }
    }

    List<Film> searchByTitle(String query, Map args) {
        String searchTerm = "%${query.trim()}%"
        Film.createCriteria().list(args) {
            ilike("title", searchTerm)
        }
    }
}