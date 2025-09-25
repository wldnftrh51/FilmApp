package filmapp

class Studio {

    String name
    String country
    String description

    static hasMany = [films: Film] // One-to-many: Studio -> Film

    static constraints = {
        name blank: false
        country nullable: true
        description nullable: true
    }
}
