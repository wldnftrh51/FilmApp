<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title><g:layoutTitle default="My FilmApp"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:stylesheet src="application.css"/>
    <g:layoutHead/>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-danger">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">
            <asset:image src="logo.png" alt="My FilmApp Logo" style="height:100px;"/>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarContent"
                aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><g:link class="nav-link" controller="film" action="index">Films</g:link></li>
                <li class="nav-item"><g:link class="nav-link" controller="genre" action="index">Genres</g:link></li>
                <li class="nav-item"><g:link class="nav-link" controller="studio" action="index">Studios</g:link></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Main content -->
<main role="main" class="container mt-4">
    <g:layoutBody/>
</main>

<!-- Footer -->
<footer class="footer bg-dark mt-5">
    <div class="container text-center py-3">
        &copy; <g:formatDate date="${new Date()}" format="yyyy"/> My FilmApp. All rights reserved.
    </div>
</footer>

<asset:javascript src="application.js"/>
</body>
</html>
