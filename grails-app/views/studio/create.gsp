<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Create Studio</title>
</head>
<body>
<h1>Create Studio</h1>

<g:form controller="studio" action="save">
    <div>
        <label for="name">Name</label>
        <g:field name="name" value="${studio?.name}"/>
    </div>

    <div>
        <label for="country">Country</label>
        <g:field name="country" value="${studio?.country}"/>
    </div>

    <div>
        <g:submitButton name="create" value="Create"/>
    </div>
</g:form>

<g:link action="index">Back to List</g:link>
</body>
</html>
