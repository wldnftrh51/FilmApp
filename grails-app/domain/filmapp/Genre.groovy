package filmapp

class Genre {

    String name

    static hasMany = [films: Film]
    static belongsTo = Film

    static constraints = {
        name blank: false
    }
}