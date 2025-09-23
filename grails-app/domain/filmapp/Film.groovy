package filmapp

class Film {

    String title
    Date releseaseDate
    String filmType
    String subgenre
    String subjectArea
    Boolean hasSequel = false
    String sequelTitle

    static belongsTo = [studio: Studio]
    static hasMany = [genres: Genre]

    static constraints = {
        title blank: false
        releseaseDate nullable: true
        filmType nullable: false
        subgenre nullable: true
        subjectArea nullable: true
        hasSequel nullable: true
        sequelTitle nullable: true
    }
}