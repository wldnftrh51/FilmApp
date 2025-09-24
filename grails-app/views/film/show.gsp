<h1>Film: ${film.title}</h1>
<p>Studio: ${film.studio?.name}</p>
<p>Release Date: <g:formatDate date="${film?.releseaseDate}" format="yyyy-MM-dd"/></p>
<p>Film Type: ${film.filmType}</p>
<p>Subgenre: ${film.subgenre}</p>
<p>Subject Area: ${film.subjectArea}</p>
<p>Has Sequel: ${film.hasSequel ? 'Yes' : 'No'}</p>
<p>Sequel Title: ${film.sequelTitle}</p>
<p>Genres: ${film.genres*.name.join(', ')}</p>
<g:link action="edit" id="${film.id}">Edit</g:link> |
<g:link action="index">Back to List</g:link>
