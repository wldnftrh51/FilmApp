package filmapp

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class FilmServiceSpec extends Specification {

    FilmService filmService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Film(...).save(flush: true, failOnError: true)
        //new Film(...).save(flush: true, failOnError: true)
        //Film film = new Film(...).save(flush: true, failOnError: true)
        //new Film(...).save(flush: true, failOnError: true)
        //new Film(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //film.id
    }

    void "test get"() {
        setupData()

        expect:
        filmService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Film> filmList = filmService.list(max: 2, offset: 2)

        then:
        filmList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        filmService.count() == 5
    }

    void "test delete"() {
        Long filmId = setupData()

        expect:
        filmService.count() == 5

        when:
        filmService.delete(filmId)
        sessionFactory.currentSession.flush()

        then:
        filmService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Film film = new Film()
        filmService.save(film)

        then:
        film.id != null
    }
}
