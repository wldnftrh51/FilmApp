package FilmApp

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class HomeControllerSpec extends Specification implements ControllerUnitTest<HomeController> {

     void "test index action"() {
        when:
        controller.index()

        then:
        status == 200

     }
}
