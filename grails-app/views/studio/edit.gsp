<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Edit Studio</title>
</head>
<body>
<h1>Edit Studio</h1>

<g:form controller="studio" action="update" method="post">
    <g:hiddenField name="_method" value="PUT"/>
    <g:hiddenField name="id" value="${studio.id}"/>
    <div>
        <label for="name">Name</label>
        <g:field name="name" value="${studio?.name}"/>
    </div>

    <div>
        <label for="country">Country</label>
        <g:field name="country" value="${studio?.country}"/>
    </div>

    <div>
        <label for="description">Description</label>
        <g:textArea name="description" value="${studio?.description}"/>
    </div>

    <div>
        <g:submitButton name="update" value="Update"/>
    </div>
</g:form>

<g:link action="index">Back to List</g:link>
</body>
</html>
