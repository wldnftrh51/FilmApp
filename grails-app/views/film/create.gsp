<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Create Film</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container py-5">

    <h1><g:link action="index" class="text-decoration-none text-dark">Film</g:link></h1>

    <h2 class="mt-4 mb-4">Create Film</h2>

    <g:form controller="film" action="save" class="needs-validation" html="[novalidate:'novalidate']">

        <div class="mb-3">
            <label class="form-label">Title</label>
            <g:textField name="title" value="${film?.title}" class="form-control"/>
        </div>

        <div class="mb-3">
            <label class="form-label">Studio</label>
            <g:select name="studio.id" from="${studios}" optionKey="id" optionValue="name"
                      value="${film?.studio?.id}" class="form-select"/>
        </div>

        <div class="mb-3">
            <label class="form-label">Release Date</label>
            <g:field type="date" name="releaseDate"
                     value="${film?.releaseDate ? formatDate(format: 'yyyy-MM-dd', date: film.releaseDate) : ''}"
                     class="form-control"/>
        </div>

        <div class="mb-3">
            <label class="form-label">Film Type</label>
            <select id="filmType" name="filmType" class="form-select">
                <option value="Fiction" <g:if test="${film?.filmType == 'Fiction'}">selected</g:if>>Fiction</option>
                <option value="Documentary" <g:if test="${film?.filmType == 'Documentary'}">selected</g:if>>Documentary</option>
            </select>
        </div>

        <div id="sourceDiv" class="mb-3" style="display: none;">
            <label class="form-label">Source</label>
            <g:textField name="source" value="${film?.source}" class="form-control"/>
        </div>

        <div>
            <label>Genres</label>
        <div class="row">
            <g:each in="${genres}" var="g" status="i">
                <div class="col-2">
                    <div class="form-check">
                        <input class="form-check-input border border-dark" type="checkbox" name="genres.id" value="${g.id}"
                               <g:if test="${film?.genres*.id?.contains(g.id)}">checked</g:if> id="genre${g.id}"/>
                        <label class="form-check-label" for="genre${g.id}">
                            ${g.name}
                        </label>
                    </div>
                </div>
            <%-- Tambahkan baris baru tiap 5 checkbox --%>
                <g:if test="${(i + 1) % 5 == 0}">
                    </div><div class="row">
                </g:if>
            </g:each>
        </div>
        </div>


        <div class="mb-3">
            <label class="form-label">Add Synopsis?</label>
            <select id="hasSynopsis" class="form-select">
                <option value="NO">NO</option>
                <option value="YES">YES</option>
            </select>
        </div>

        <div id="synopsisDiv" class="mb-3" style="display:none;">
            <label class="form-label">Synopsis</label>
            <g:textArea name="synopsis" value="${film?.synopsis}" class="form-control" rows="4"/>
        </div>

        <div class="mb-3">
            <g:submitButton name="create" value="Save" class="btn btn-success"/>
        </div>

    </g:form>

</div>

<!-- jQuery & Custom JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<asset:javascript src="jqueryFilm.js" />
</body>
</html>
