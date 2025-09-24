<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Create Genre</title>
</head>
<body>
<h1>Create Genre</h1>

<g:form controller="genre" action="save">
    <div>
        <label for="name">Name</label>
        <g:field name="name" value="${genre?.name}"/>
    </div>

    <div>
        <g:submitButton name="create" value="Create"/>
    </div>
</g:form>

<g:link action="index">Back to List</g:link>
</body>
</html>
