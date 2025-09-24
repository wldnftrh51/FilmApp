<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Genres</title>
</head>
<body>
<h1>Genres</h1>

<a href="${createLink(controller:'genre', action:'create')}">Create New Genre</a>

<table>
    <thead>
    <tr>
        <th>Name</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${genreList}" var="genre">
        <tr>
            <td>${genre.name}</td>
            <td>
                <g:link action="show" id="${genre.id}">Show</g:link> |
                <g:link action="edit" id="${genre.id}">Edit</g:link> |
                <g:form action="delete" method="POST" style="display:inline">
                    <g:hiddenField name="id" value="${genre.id}"/>
                    <g:submitButton name="delete" value="Delete" onclick="return confirm('Are you sure?')"/>
                </g:form>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>
</body>
</html>
