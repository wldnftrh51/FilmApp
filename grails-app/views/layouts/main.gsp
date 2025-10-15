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

<body class="d-flex flex-column min-vh-100">

<sec:ifLoggedIn>
    <nav class="navbar navbar-expand-lg navbar-light bg-danger">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent"
                    aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <p class="navbar-text text-white fw-bold fs-4 text-uppercase mb-0 mx-3">FILM APP</p>
            <a class="navbar-brand p-0" href="/home">
                <asset:image src="logo.png" alt="My FilmApp Logo" style="height:100px;"/>
            </a>

            <div class="collapse navbar-collapse bg-danger" id="navbarContent">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <g:link class="nav-link text-white ${controllerName == 'home' ? 'active fw-bold' : ''}"
                                controller="home" action="index">Home</g:link>
                    </li>
                    <li class="nav-item">
                        <g:link class="nav-link text-white ${controllerName == 'film' ? 'active fw-bold' : ''}"
                                controller="film" action="index">Films</g:link>
                    </li>
                    <li class="nav-item">
                        <g:link class="nav-link text-white ${controllerName == 'genre' ? 'active fw-bold' : ''}"
                                controller="genre" action="index">Genres</g:link>
                    </li>
                    <li class="nav-item">
                        <g:link class="nav-link text-white ${controllerName == 'studio' ? 'active fw-bold' : ''}"
                                controller="studio" action="index">Studios</g:link>
                    </li>
                    <li class="nav-item"><g:link class="nav-link text-white" controller="logout">Log out</g:link></li>
                </ul>
            </div>
        </div>
    </nav>

    <main role="main" class="container flex-fill d-flex justify-content-center align-items-center text-center">
        <g:layoutBody/>
    </main>

    <footer class="footer bg-dark">
        <div class="container text-center py-3">
            &copy; <g:formatDate date="${new Date()}" format="yyyy"/> My FilmApp. All rights reserved.
        </div>
    </footer>
</sec:ifLoggedIn>

<sec:ifNotLoggedIn>
    <main role="main" class="container d-flex justify-content-center align-items-center" style="min-height: 100vh;">
        <g:layoutBody/>
    </main>
</sec:ifNotLoggedIn>



<asset:javascript src="application.js"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
