package filmapp

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class FilmSpec extends Specification implements DomainUnitTest<Film> {

     void "test domain constraints"() {
        when:
        Film domain = new Film()
        //TODO: Set domain props here

        then:
        domain.validate()
     }
}
