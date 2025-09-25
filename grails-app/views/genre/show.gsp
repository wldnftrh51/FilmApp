<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Show Genre</title>
</head>
<body>
%{--<h1>Genre: ${genre.name}</h1>--}%

%{--<p>ID: ${genre.id}</p>--}%
<h1>Genre Details</h1>

<p><strong>Name :</strong> ${genre.name}</p>
<p><strong>Description :</strong> ${genre.description}</p>
<g:link action="edit" id="${genre.id}">Edit</g:link> |
<g:link action="index">Back to List</g:link>
</body>
</html>
