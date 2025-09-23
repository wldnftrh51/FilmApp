package filmapp

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class StudioSpec extends Specification implements DomainUnitTest<Studio> {

     void "test domain constraints"() {
        when:
        Studio domain = new Studio()
        //TODO: Set domain props here

        then:
        domain.validate()
     }
}
