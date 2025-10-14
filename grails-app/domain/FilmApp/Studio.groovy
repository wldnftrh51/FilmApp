package FilmApp

class Studio {

    String name
    String country
    String description

    static hasMany = [films: Film]

    static constraints = {
        name nullable: false, blank: false
        country nullable: true, blank: true
        description nullable: true, blank: true
    }
}
