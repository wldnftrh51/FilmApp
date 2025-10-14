package FilmApp

class Film {

    String title
    Date releaseDate
    String filmType
    String source
    String synopsis

    static belongsTo = [studio: Studio]
    static hasMany = [genres: Genre]
    Set<Genre> genres = []
    static constraints = {
        title nullable: false,  blank: false
        studio nullable: true
        releaseDate nullable: true, blank: false
        filmType nullable: true
        source nullable: true
        genres validator: { val ->
            if (!val || val.isEmpty()) return ['film.genres.required']
        }
        synopsis nullable: true
    }

    static mapping = {
        genres joinTable: [name: "film_genre", key: "film_id", column: "genre_id"]
    }
}
