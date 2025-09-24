<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Film Details</title>
</head>
<body>
<h1>Film Details</h1>

<p><strong>Title:</strong> ${film.title}</p>
<p><strong>Studio:</strong> ${film.studio?.name}</p>
<p><strong>Release Date:</strong> <g:formatDate format="yyyy-MM-dd" date="${film.releaseDate}"/></p>
<p><strong>Film Type:</strong> ${film.filmType}</p>
<p><strong>Subject Area:</strong> ${film.subjectArea}</p>
<p><strong>Has Sequel:</strong> ${film.hasSequel ? 'Yes' : 'No'}</p>
<p><strong>Sequel Title:</strong> ${film.sequelTitle}</p>
<p><strong>Genres:</strong>
    <g:each in="${film.genres}" var="genre">
        ${genre.name}<g:if test="${!genre.is(film.genres[-1])}">, </g:if>
    </g:each>
</p>

<g:link action="edit" id="${film.id}">Edit</g:link> |
<g:link action="index">Back to List</g:link>
</body>
</html>
