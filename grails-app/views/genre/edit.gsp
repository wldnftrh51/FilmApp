<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Edit Genre</title>
</head>
<body>
<h1>Edit Genre</h1>

<g:form controller="genre" action="update" method="post">
    <g:hiddenField name="_method" value="PUT"/>
    <g:hiddenField name="id" value="${genre.id}"/>

    <div>
        <label for="name">Name</label>
        <g:field name="name" value="${genre?.name}"/>
    </div>

    <div>
        <g:submitButton name="update" value="Update"/>
    </div>
</g:form>

<g:link action="index">Back to List</g:link>

</body>
</html>
