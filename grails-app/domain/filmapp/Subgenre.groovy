package filmapp

class Subgenre {

    String name
    static hasMany = [films: Film]

    static constraints = {
        name blank: false, unique: true
    }

    String toString(){
        return name
    }
}
