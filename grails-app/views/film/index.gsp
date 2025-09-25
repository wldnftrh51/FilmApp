<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>All Films</title>
</head>
<body>
<h1>All Films</h1>

<g:link action="create" class="btn btn-primary">Create New Film</g:link>

<g:form controller="film" action="index" method="get">
    <input type="text" name="q" value="${params.q}" placeholder="Search films..."/>
    <button type="submit">Search</button>
</g:form>

<table border="1" cellpadding="5" cellspacing="0">
    <tr>
        <th>Title</th>
        <th>Studio</th>
        <th>Release Date</th>
        <th>Type of Film</th>
        <th>Genres</th>
        <th>Actions</th>
    </tr>
    <g:each in="${filmList}" var="f">
        <tr>
            <td>${f.title}</td>
            <td>${f.studio?.name}</td>
            <td><g:formatDate date="${f.releaseDate}" format="yyyy-MM-dd"/></td>
            <td>${f.filmType}</td>
            <td>${f.genres*.name.join(', ')}</td>
            <td>
                <g:link action="show" id="${f.id}">Show</g:link> |
                <g:link action="edit" id="${f.id}">Edit</g:link> |
                <g:form action="delete" method="DELETE" style="display:inline">
                    <g:hiddenField name="id" value="${f.id}"/>
                    <g:submitButton name="delete" value="Delete"/>
                </g:form>
            </td>
        </tr>
    </g:each>

</table>

<div class="pagination">
    <g:paginate total="${filmCount}" params="${params}"/>
</div>

</body>
</html>
