<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Show Genre</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container py-5">
    <h1><g:link action="index" class="text-decoration-none text-dark">Genre</g:link></h1>
    <h2 class="mt-4 mb-4">Genre Details</h2>

    <div class="mb-3">
        <strong>Name:</strong>
        <span class="ms-2">${genre.name}</span>
    </div>

    <div class="mb-3">
        <strong>Description :</strong>
        <span class="ms-2">${genre.description}</span>
    </div>

    <g:link action="edit" id="${genre.id}" class="btn btn-primary mt-3">Edit</g:link>
</div>

</body>
</html>
