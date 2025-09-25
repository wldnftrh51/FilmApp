<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>All Films</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container my-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
%{--        <h1>Films</h1>--}%
        <h1><g:link action="index" class="text-decoration-none text-dark" >Film</g:link></h1>
        <g:link action="create" class="btn btn-primary">Create New Film</g:link>
    </div>

<!-- Search Form -->
    <g:form controller="film" action="index" method="get" class="d-flex mb-4">
        <input type="text" name="q" value="${params.q}" class="form-control me-2" placeholder="Search films..."/>
        <button type="submit" class="btn btn-outline-secondary">Search</button>
    </g:form>

<!-- Film Table -->
    <div class="table-responsive">
        <table class="table table-bordered table-hover align-middle">
            <thead class="table-light">
            <tr>
                <th>Title</th>
                <th>Studio</th>
                <th>Release Date</th>
                <th>Type of Film</th>
                <th>Genres</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${filmList}" var="f">
                <tr>
                    <td>${f.title}</td>
                    <td>${f.studio?.name ?: '-'}</td>
                    <td><g:formatDate date="${f.releaseDate}" format="yyyy-MM-dd"/></td>
                    <td>${f.filmType}</td>
                    <td>${f.genres*.name.join(', ')}</td>
                    <td>
                        <g:link action="show" id="${f.id}" class="btn btn-sm btn-info me-1">Show</g:link>
                        <g:link action="edit" id="${f.id}" class="btn btn-sm btn-warning me-1">Edit</g:link>
                        <g:form action="delete" method="DELETE" style="display:inline">
                            <g:hiddenField name="_method" value="DELETE"/>
                            <g:hiddenField name="id" value="${f.id}"/>
                            <g:submitButton name="delete" value="Delete" class="btn btn-sm btn-danger"
                                            onclick="return confirm('Are you sure?')"/>
                        </g:form>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>

    <!-- Pagination -->
    <div class="d-flex justify-content-center mt-4">
        <g:paginate total="${filmCount}" params="${params}" prev="«" next="»" class="pagination pagination-sm justify-content-center"/>
    </div>
</div>

</body>
</html>
