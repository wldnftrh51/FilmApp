<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Genres</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<div class="container my-5">
    <div>
        <h1><g:link action="index" class="text-decoration-none text-dark">Genre</g:link></h1>
        <g:link action="create" class="btn btn-primary">Create New Genre</g:link>
    </div>

%{--    <a href="${createLink(controller: 'genre', action: 'create')}">Create New Genre</a>--}%

    <g:form controller="genre" action="index" method="get" class="d-flex mb-4">
        <input type="text" name="q" value="${params.q}" class="form-control me-2" placeholder="Search genres..."/>
        <button type="submit" class="btn btn-outline-secondary">Search</button>
    </g:form>

    <div class="table-responsive">
        <table class="table table-bordered table-hover align-middle">
            <thead class="table-light">
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
                        <g:link action="show" id="${genre.id}" class="btn btn-sm btn-info me-1">Show</g:link> |
                        <g:link action="edit" id="${genre.id}" class="btn btn-sm btn-warning me-1">Edit</g:link> |
                        <g:form action="delete" method="post" style="display:inline">
                            <g:hiddenField name="_method" value="DELETE"/>
                            <g:hiddenField name="id" value="${genre.id}"/>
                            <g:submitButton name="delete" value="Delete" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')"/>
                        </g:form>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>

    <div class="pagination">
        <g:paginate total="${genreCount}" params="${params}"/>
    </div>
</div>

</body>
</html>
