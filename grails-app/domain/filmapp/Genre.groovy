package filmapp

class Genre {

    String name
    String description

    static hasMany = [films: Film] // many-to-many
    static belongsTo = Film
    static constraints = {
        name blank: false
        description blank: false
    }
}
