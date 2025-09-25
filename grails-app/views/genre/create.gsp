<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Create Genre</title>
</head>
<body>

<g:link action="index">Back to List</g:link>

<h1>Create Genre</h1>

<g:form controller="genre" action="save">
    <div>
        <label for="name">Name</label>
        <g:field name="name" value="${genre?.name}"/>
    </div>

    <div>
        <label for="description">Description</label>
        <g:textArea name="description" value="${genre?.description}" rows="4" cols="40"/>
    </div>

    <div>
        <g:submitButton name="create" value="Create"/>
    </div>
</g:form>
</body>
</html>
