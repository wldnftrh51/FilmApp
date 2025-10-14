<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Create Genre</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container py-5">
    <h1><g:link action="index" class="text-decoration-none text-dark">Genre</g:link></h1>
    <h2 class="mt-4 mb-4">Create Genre</h2>

    <g:form controller="genre" action="save" class="needs-validation">
        <div class="mb-3">
            <label class="form-label">Name</label>
            <g:textField name="name" value="${genre?.name}" class="form-control" required="true"/>
        </div>

        <div class="mb-3">
            <label class="form-label">Description</label>
            <g:textArea name="description" value="${genre?.description}" rows="4" cols="40" class="form-control"/>
        </div>

        <div class="mb-3">
            <g:submitButton name="create" value="Create" class="btn btn-success"/>
        </div>
    </g:form>
</div>

</body>
</html>
