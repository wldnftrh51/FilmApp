package FilmApp

import FilmApp.auth.LogoutController
import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class LogoutControllerSpec extends Specification implements ControllerUnitTest<LogoutController> {

     void "test index action"() {
        when:
        controller.index()

        then:
        status == 200

     }
}
