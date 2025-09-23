package filmapp

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class GenreServiceSpec extends Specification {

    GenreService genreService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Genre(...).save(flush: true, failOnError: true)
        //new Genre(...).save(flush: true, failOnError: true)
        //Genre genre = new Genre(...).save(flush: true, failOnError: true)
        //new Genre(...).save(flush: true, failOnError: true)
        //new Genre(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //genre.id
    }

    void "test get"() {
        setupData()

        expect:
        genreService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Genre> genreList = genreService.list(max: 2, offset: 2)

        then:
        genreList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        genreService.count() == 5
    }

    void "test delete"() {
        Long genreId = setupData()

        expect:
        genreService.count() == 5

        when:
        genreService.delete(genreId)
        sessionFactory.currentSession.flush()

        then:
        genreService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Genre genre = new Genre()
        genreService.save(genre)

        then:
        genre.id != null
    }
}
