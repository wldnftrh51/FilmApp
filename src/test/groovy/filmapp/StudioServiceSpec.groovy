package filmapp

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class StudioServiceSpec extends Specification {

    StudioService studioService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Studio(...).save(flush: true, failOnError: true)
        //new Studio(...).save(flush: true, failOnError: true)
        //Studio studio = new Studio(...).save(flush: true, failOnError: true)
        //new Studio(...).save(flush: true, failOnError: true)
        //new Studio(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //studio.id
    }

    void "test get"() {
        setupData()

        expect:
        studioService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Studio> studioList = studioService.list(max: 2, offset: 2)

        then:
        studioList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        studioService.count() == 5
    }

    void "test delete"() {
        Long studioId = setupData()

        expect:
        studioService.count() == 5

        when:
        studioService.delete(studioId)
        sessionFactory.currentSession.flush()

        then:
        studioService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Studio studio = new Studio()
        studioService.save(studio)

        then:
        studio.id != null
    }
}
