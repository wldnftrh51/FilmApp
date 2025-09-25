<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Film Details</title>
</head>

<body>

<g:link action="index">Back to List</g:link>

<h1>Film Details</h1>

<p><strong>Title :</strong> ${film.title}</p>

<p><strong>Studio :</strong> ${film.studio?.name}</p>

<p><strong>Release Date :</strong> <g:formatDate format="yyyy-MM-dd" date="${film.releaseDate}"/></p>

<p><strong>Film Type :</strong> ${film.filmType}</p>

<g:if test="${film.filmType == 'Documentary'}">
    <p><strong>Source :</strong> ${film.source}</p>
</g:if>

<p><strong>Genres :</strong>
    <g:each in="${film.genres}" var="genre">
        ${genre.name}<g:if test="${!genre.is(film.genres[-1])}">,</g:if>
    </g:each>
</p>

<p><strong>Synopsis :</strong> ${film?.synopsis?.trim() ? film.synopsis : '-'}</p>

<g:link action="edit" id="${film.id}">Edit</g:link>

</body>
</html>
