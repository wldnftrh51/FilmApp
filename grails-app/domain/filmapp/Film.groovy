package filmapp

class Film {

    String title
    Date releaseDate
    String filmType
    String subjectArea
    Boolean hasSequel = false
    String sequelTitle

    static belongsTo = [studio: Studio] // One-to-many: Studio -> Film
    static hasMany = [genres: Genre]     // Many-to-many: Film <-> Genre
    Set<Genre> genres = []
    static constraints = {
        title blank: false
        releaseDate nullable: false
        filmType nullable: false
        subjectArea nullable: true
        hasSequel nullable: true
        sequelTitle nullable: true
        studio nullable: false
        genres validator: { val ->
            if (!val || val.isEmpty()) return ['film.genres.required']
        }
    }

    static mapping = {
        genres joinTable: [name: "film_genre", key: "film_id", column: "genre_id"]
    }
}
