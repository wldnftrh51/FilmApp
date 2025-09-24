package filmapp

class Genre {

    String name

    static hasMany = [films: Film] // many-to-many
    static belongsTo = Film
    static constraints = {
        name blank: false
    }
}
