<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Show Studio</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container py-5">
    <h1><g:link action="index" class="text-decoration-none text-dark">Studio</g:link></h1>
    <h2 class="mt-4 mb-4">Studio Details</h2>

    <div class="mb-3">
        <strong>Name:</strong>
        <span class="ms-2">${studio.name}</span>
    </div>

    <div class="mb-3">
        <strong>Country:</strong>
        <span class="ms-2">${studio.country}</span>
    </div>

    <div class="mb-3">
        <strong>Description:</strong>
        <span class="ms-2">${studio?.description ?: '-'}</span>
    </div>

    <g:link action="edit" id="${studio.id}" class="btn btn-primary mt-3">Edit</g:link>
</div>

</body>
</html>
