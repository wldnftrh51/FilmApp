import filmapp.*

class BootStrap {

    def init = { servletContext ->

        // 1️⃣ Buat beberapa Studio
        def studio1 = new Studio(name: "Warner Bros", country: "USA").save(flush: true)
        def studio2 = new Studio(name: "Studio Ghibli", country: "Japan").save(flush: true)
        def studio3 = new Studio(name: "Paramount Pictures", country: "USA").save(flush: true)

        // 2️⃣ Buat beberapa Genre
        def genre1 = new Genre(name: "Action").save(flush: true)
        def genre2 = new Genre(name: "Drama").save(flush: true)
        def genre3 = new Genre(name: "Animation").save(flush: true)
        def genre4 = new Genre(name: "Comedy").save(flush: true)

        // 3️⃣ Buat beberapa Film dan hubungkan ke Studio + Genre
        def film1 = new Film(
                title: "Epic Adventure",
                releseaseDate: Date.parse("yyyy-MM-dd", "2021-05-20"),
                filmType: "Feature",
                subgenre: "Fantasy",
                subjectArea: "Adventure",
                hasSequel: true,
                sequelTitle: "Epic Adventure 2",
                studio: studio1
        ).save(flush: true)
        film1.addToGenres(genre1)
        film1.addToGenres(genre2)
        film1.save(flush: true)

        def film2 = new Film(
                title: "Spirited Away",
                releseaseDate: Date.parse("yyyy-MM-dd", "2001-07-20"),
                filmType: "Feature",
                subgenre: "Fantasy",
                subjectArea: "Animation",
                studio: studio2
        ).save(flush: true)
        film2.addToGenres(genre3)
        film2.save(flush: true)

        def film3 = new Film(
                title: "Comedy Night",
                releseaseDate: Date.parse("yyyy-MM-dd", "2019-11-10"),
                filmType: "Short",
                subgenre: "Slapstick",
                subjectArea: "Comedy",
                hasSequel: false,
                studio: studio3
        ).save(flush: true)
        film3.addToGenres(genre4)
        film3.save(flush: true)

        // 4️⃣ Buat beberapa film tambahan dengan loop
        4.upto(10) { i ->
            def f = new Film(
                    title: "Film $i",
                    releseaseDate: new Date() - (i*30), // tanggal dummy
                    filmType: i % 2 == 0 ? "Feature" : "Short",
                    subgenre: "Subgenre $i",
                    subjectArea: "Subject $i",
                    hasSequel: i % 2 == 0,
                    sequelTitle: i % 2 == 0 ? "Film ${i} Sequel" : null,
                    studio: [studio1, studio2, studio3][i % 3] // random studio
            ).save(flush: true)
            f.addToGenres([genre1, genre2, genre3, genre4][i % 4])
            f.save(flush: true)
        }

        println "✅ Dummy data FilmApp berhasil dibuat!"
    }

    def destroy = {
    }
}
