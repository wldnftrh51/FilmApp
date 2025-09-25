<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>My FilmApp Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="d-flex vh-100 justify-content-center align-items-center text-center">

    <div>
        <h1>Welcome to My FilmApp</h1>

        <p>Select a section to manage your data:</p>

        <ul class="list-inline mt-4">
            <li class="list-inline-item">
                <g:link controller="film" action="index" class="btn btn-primary">Films</g:link>
            </li>
            <li class="list-inline-item">
                <g:link controller="genre" action="index" class="btn btn-success">Genres</g:link>
            </li>
            <li class="list-inline-item">
                <g:link controller="studio" action="index" class="btn btn-warning">Studios</g:link>
            </li>
        </ul>
    </div>

</body>
</html>
