<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Studios</title>
</head>
<body>
<h1>Studios</h1>

<a href="${createLink(controller:'studio', action:'create')}">Create New Studio</a>

<g:form controller="studio" action="index" method="get">
    <input type="text" name="q" value="${params.q}" placeholder="Search studios..."/>
    <button type="submit">Search</button>
</g:form>

<table>
    <thead>
    <tr>
        <th>Name</th>
        <th>Country</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${studioList}" var="studio">
        <tr>
            <td>${studio.name}</td>
            <td>${studio.country}</td>
            <td>
                <g:link action="show" id="${studio.id}">Show</g:link> |
                <g:link action="edit" id="${studio.id}">Edit</g:link> |
                <g:form controller="studio" action="delete" method="POST" style="display:inline">
                    <g:hiddenField name="_method" value="DELETE"/>
                    <g:hiddenField name="id" value="${studio.id}"/>
                    <g:submitButton name="delete" value="Delete" onclick="return confirm('Are you sure?')"/>
                </g:form>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>

<div class="pagination">
    <g:paginate total="${studioCount}" params="${params}"/>
</div>

</body>
</html>
