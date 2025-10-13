package FilmApp

import FilmApp.auth.RegisterController
import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class RegisterControllerSpec extends Specification implements ControllerUnitTest<RegisterController> {

     void "test index action"() {
        when:
        controller.index()

        then:
        status == 200

     }
}
