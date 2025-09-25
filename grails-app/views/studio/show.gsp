<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Show Studio</title>
</head>
<body>
%{--<h1>Studio: ${studio.name}</h1>--}%
<g:link action="index">Back to List</g:link>
<h1>Studio Details</h1>
<p><strong>Name :</strong>${studio.name}</p>
<p><strong>Country :</strong>${studio.country}</p>
<p><strong>Description :</strong>${studio.description}</p>

<g:link action="edit" id="${studio.id}">Edit</g:link> |
</body>
</html>
