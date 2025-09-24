<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Edit Film</title>
</head>
<body>
<h1>Edit Film</h1>

<g:form controller="film" action="update" method="PUT">
    <g:hiddenField name="id" value="${film.id}"/>

    <div>
        <label>Title</label>
        <g:textField name="title" value="${film?.title}"/>
    </div>

    <div>
        <label>Studio</label>
        <g:select name="studio.id" from="${studios}" optionKey="id" optionValue="name" value="${film?.studio?.id}"/>
    </div>

    <div>
        <label>Release Date</label>
        <g:datePicker name="releaseDate" precision="day" value="${film?.releaseDate}"/>
    </div>

    <div>
        <label>Genres</label><br/>
        <g:each in="${genres}" var="g">
            <label>
                <input type="checkbox" name="genres" value="${g.id}"
                       <g:if test="${film?.genres*.id?.contains(g.id)}">checked</g:if>/>
                ${g.name}
            </label><br/>
        </g:each>
    </div>

    <div>
        <g:submitButton name="update" value="Update"/>
    </div>
</g:form>
</body>
</html>
