package filmapp

class Film {

    String title
    Date releaseDate
    String filmType
    String source // Diganti menjadi source
//    Boolean hasSequel = false
//    String sequelTitle
    String synopsis

    static belongsTo = [studio: Studio] // One-to-many: Studio -> Film
    static hasMany = [genres: Genre]     // Many-to-many: Film <-> Genre
    Set<Genre> genres = []
    static constraints = {
        studio nullable: true
        title blank: false
        releaseDate nullable: false
        filmType nullable: false
        source nullable: true
//        hasSequel nullable: true
//        sequelTitle nullable: true
//        studio nullable: false
        synopsis nullable: true
        genres validator: { val ->
            if (!val || val.isEmpty()) return ['film.genres.required']
        }
    }

    static mapping = {
        genres joinTable: [name: "film_genre", key: "film_id", column: "genre_id"]
    }
}
