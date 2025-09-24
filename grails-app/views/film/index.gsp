<h1>All Films</h1>
<g:link action="create">Create New Film</g:link>
<table>
    <tr>
        <th>Title</th>
        <th>Studio</th>
        <th>Release Date</th>
        <th>Genres</th>
        <th>Actions</th>
    </tr>
    <g:each in="${filmList}" var="f">
        <tr>
            <td>${f.title}</td>
            <td>${f.studio?.name}</td>
            <td><g:formatDate date="${f.releseaseDate}" format="yyyy-MM-dd"/></td>
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
