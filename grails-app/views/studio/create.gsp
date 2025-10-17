<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Create Studio</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container py-5">
    <h1><g:link action="index" class="text-decoration-none text-dark">Studio</g:link></h1>
    <h2>Create Studio</h2>

    <g:form controller="studio" action="save" class="needs-validation">
        <div class="mb-3">
            <label class="form-label">Name</label>
            <g:textField name="name" value="${studio?.name}" class="form-control validate-required" data-label="Name"/>
        </div>

        <div class="mb-3">
            <label class="form-label">Country</label>
            <g:textField name="country" value="${studio?.country}" class="form-control"/>
        </div>

        <div class="mb-3">
            <label class="form-label">Description</label>
            <g:textArea name="description" value="${studio?.description}" rows="4" cols="40" class="form-control"/>
        </div>

        <div class="mb-3">
            <g:submitButton name="create" value="Create" class="btn btn-success"/>
        </div>
    </g:form>

    <div id="errorPopup" class="hidden popup"></div>
    <asset:javascript src="form-validation.js"/>
</div>

</body>
</html>
