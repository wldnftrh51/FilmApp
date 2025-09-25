<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Film Details</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container py-5">

    <h1><g:link action="index" class="text-decoration-none text-dark">Film</g:link></h1>

    <h2 class="mt-4 mb-4">Film Details</h2>

    <div class="mb-3">
        <strong>Title:</strong>
        <span class="ms-2">${film.title}</span>
    </div>

    <div class="mb-3">
        <strong>Studio:</strong>
        <span class="ms-2">${film.studio?.name}</span>
    </div>

    <div class="mb-3">
        <strong>Release Date:</strong>
        <span class="ms-2"><g:formatDate format="yyyy-MM-dd" date="${film.releaseDate}"/></span>
    </div>

    <div class="mb-3">
        <strong>Film Type:</strong>
        <span class="ms-2">${film.filmType}</span>
    </div>

    <g:if test="${film.filmType == 'Documentary'}">
        <div class="mb-3">
            <strong>Source:</strong>
            <span class="ms-2">${film.source}</span>
        </div>
    </g:if>

    <div class="mb-3">
        <strong>Genres:</strong>
        <span class="ms-2">
            <g:each in="${film.genres}" var="genre">
                ${genre.name}<g:if test="${!genre.is(film.genres[-1])}">, </g:if>
            </g:each>
        </span>
    </div>

    <div class="mb-3">
        <strong>Synopsis:</strong>
        <span class="ms-2">${film?.synopsis?.trim() ? film.synopsis : '-'}</span>
    </div>

    <g:link action="edit" id="${film.id}" class="btn btn-primary mt-3">Edit</g:link>

</div>

</body>
</html>
