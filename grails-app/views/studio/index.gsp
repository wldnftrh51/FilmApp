<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Studios</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container my-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h1><g:link action="index" class="text-decoration-none text-dark">Studios</g:link></h1>
        <g:link action="create" class="btn btn-primary">Create New Studio</g:link>
    </div>

    <g:form controller="studio" action="index" method="get" class="d-flex mb-4">
        <input type="text" name="q" value="${params.q}" class="form-control me-2" placeholder="Search studios..."/>
        <button type="submit" class="btn btn-outline-secondary">Search</button>
    </g:form>

    <div class="table-responsive">
        <table class="table table-bordered table-hover align-middle">
            <thead class="table-light">
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
                        <g:link action="show" id="${studio.id}" class="btn btn-sm btn-info me-1">Show</g:link>
                        <sec:ifAnyGranted roles="ROLE_ADMIN">
                            <g:link action="edit" id="${studio.id}" class="btn btn-sm btn-warning me-1">Edit</g:link>
                            <g:form controller="studio" action="delete" method="POST" style="display:inline">
                                <g:hiddenField name="_method" value="DELETE"/>
                                <g:hiddenField name="id" value="${studio.id}"/>
                                <g:submitButton name="delete" value="Delete" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')"/>
                            </g:form>
                        </sec:ifAnyGranted>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="d-flex justify-content-center gap-3 mt-4">
            <g:paginate total="${studioCount}" params="${params}" prev="«" next="»" class="pagination pagination-sm justify-content-center"/>
        </div>
    </div>
</div>

</body>
</html>
