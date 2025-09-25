package filmapp

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import grails.gorm.transactions.Transactional

class FilmController {

    FilmService filmService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    // List all films
//    def index(Integer max) {
//        params.max = Math.min(max ?: 10, 100)
//
//        def filmList = Film.createCriteria().list(params) {
////            fetchMode "genres", org.hibernate.FetchMode.JOIN
//            fetchMode "studio", org.hibernate.FetchMode.JOIN
//            order("id", "desc")
//        }
//
//        respond filmList, model: [filmCount: Film.count()]
//    }

    def index(Integer max){
        params.max = Math.min(max ?: 10, 100)

        if (params.q){
            String searchTerm = "%${params.q.trim()}%"
            def filmList = Film.createCriteria().list(params){
                ilike("title", searchTerm)
            }
            println "Found ${filmList.totalCount} result for search '${params.q}'"
            respond filmList, model: [filmCount: filmList.totalCount]
        } else {
            respond filmService.list(params), model: [filmCount: filmService.count()]
        }
    }


    // Show single film
    def show(Long id) {
        def film = Film.createCriteria().get {
            eq("id", id)
//            fetchMode "genres", org.hibernate.FetchMode.JOIN
        }
        respond film
    }


    // Create film form
    def create() {
        respond new Film(), model: [studios: Studio.list(), genres: Genre.list()]
    }

    // Save film
    @Transactional
    def save(Film film) {
        if (!film) {
            notFound()
            return
        }

        // Debug: tampilkan properti film
        println "Film sebelum genre:"
        println film.properties

        // Inisialisasi relasi genres jika null
        if (film.genres == null) {
            film.genres = [] as Set
        } else {
            film.genres.clear()
        }

        // Ambil ID genre dari parameter form
        def genreIds = params.list('genres.id') ?: []

        // Tambahkan genre ke film
        genreIds.each { id ->
            if (id) {
                try {
                    def genre = Genre.get(id.toLong())
                    if (genre) {
                        film.addToGenres(genre)
                    } else {
                        log.warn "Genre dengan ID $id tidak ditemukan"
                    }
                } catch(NumberFormatException e) {
                    log.warn "ID genre tidak valid: $id"
                }
            }
        }

        // Debug: tampilkan genre yang akan disimpan
        println "Genres yang ditambahkan: ${film.genres*.id}"

        // Validasi film sebelum disimpan
        if (!film.validate()) {
            println "Film gagal validasi!"
            film.errors.allErrors.each { err ->
                println err
            }

            respond film.errors,
                    view:'create',
                    model:[
                            studios: Studio.list(),
                            genres: Genre.list()
                    ]
            return
        }

        // Simpan film dan flush langsung ke database
        if (!film.save(flush: true)) {
            println "Film gagal disimpan!"
            film.errors.allErrors.each { err ->
                println err
            }

            respond film.errors,
                    view:'create',
                    model:[
                            studios: Studio.list(),
                            genres: Genre.list()
                    ]
            return
        }

        // Debug: konfirmasi save berhasil
        println "Film berhasil disimpan dengan ID: ${film.id}"

        // Redirect ke halaman detail film
        redirect action: "show", id: film.id
    }


    // Edit film form
    def edit(Long id) {
        def film = Film.createCriteria().get {
            eq('id', id)
            fetchMode 'genres', org.hibernate.FetchMode.JOIN
        }
        if (!film) {
            notFound()
            return
        }
        respond film, model: [studios: Studio.list(), genres: Genre.list()]
    }

    // Update film
    def update(Long id) {
        def film = filmService.get(id)
        if (!film) { notFound(); return }

        film.properties = params
//        film.genres.clear()
//        (params.list('genres') ?: []).each { genreId ->
//            def genre = Genre.get(genreId.toLong())
//            if (genre) film.addToGenres(genre)
//        }
        film.genres.clear()
        (params.list('genres.id') ?: []).each { genreId ->
            if (genreId) {   // skip null/empty
                def genre = Genre.get(genreId.toLong())
                if (genre) film.addToGenres(genre)
            }
        }


        filmService.save(film)   // <- transaksi sudah dijamin service
        redirect action:"show", id:film.id
    }



    // Delete film
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
