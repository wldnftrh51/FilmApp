package filmapp

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class GenreSpec extends Specification implements DomainUnitTest<Genre> {

     void "test domain constraints"() {
        when:
        Genre domain = new Genre()
        //TODO: Set domain props here

        then:
        domain.validate()
     }
}
