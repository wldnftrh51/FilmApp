package FilmApp

class Genre {

    String name
    String description

    static hasMany = [films: Film]
    static belongsTo = Film
    static constraints = {
        name nullable: false, blank: false
        description nullable: true, blank: true
    }
}
