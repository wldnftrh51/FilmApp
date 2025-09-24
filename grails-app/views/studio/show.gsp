<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Show Studio</title>
</head>
<body>
<h1>Studio: ${studio.name}</h1>

<p>Country: ${studio.country}</p>
<p>ID: ${studio.id}</p>

<g:link action="edit" id="${studio.id}">Edit</g:link> |
<g:link action="index">Back to List</g:link>
</body>
</html>
