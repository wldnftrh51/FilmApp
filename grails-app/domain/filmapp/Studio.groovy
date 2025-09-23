package filmapp

import javax.print.DocFlavor

class Studio {

    String name
    String country

    static hasMany = [films: Film]

    static constraints = {
        name blank: false
        country nullable: true
    }
}