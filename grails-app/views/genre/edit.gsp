<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Edit Genre</title>
</head>
<body>

<g:link action="index">Back to List</g:link>

<h1>Edit Genre</h1>

<g:form controller="genre" action="update" method="post">
    <g:hiddenField name="_method" value="PUT"/>
    <g:hiddenField name="id" value="${genre.id}"/>

    <div>
        <label for="name">Name</label>
        <g:field name="name" value="${genre?.name}"/>
    </div>

    <div>
        <label for="description">Description</label>
        <g:textArea name="description" value="${genre?.description}" rows="4" cols="40"/>
    </div>

    <div>
        <g:submitButton name="update" value="Update"/>
    </div>
</g:form>

</body>
</html>
