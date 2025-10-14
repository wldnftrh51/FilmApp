<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Edit Genre</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container py-5">
    <h1><g:link action="index" class="text-decoration-none text-dark">Genre</g:link></h1>
    <h2 class="mt-4 mb-4">Edit Genre</h2>

    <g:form controller="genre" action="update" method="post">
        <g:hiddenField name="_method" value="PUT"/>
        <g:hiddenField name="id" value="${genre.id}"/>

        <div class="mb-3">
            <label class="form-label">Name</label>
            <g:textField name="name" value="${genre?.name}" class="form-control"/>
        </div>

        <div class="mb-3">
            <label class="form-label">Description</label>
            <g:textArea name="description" value="${genre?.description}" rows="4" cols="40" class="form-control"/>
        </div>

        <div class="mb-3">
            <g:submitButton name="update" value="Update" class="btn btn-primary"/>
        </div>
    </g:form>
</div>

</body>
</html>
