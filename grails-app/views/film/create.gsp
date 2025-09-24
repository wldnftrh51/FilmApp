<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Create Film</title>
</head>
<body>
<h1>Create Film</h1>

<g:form controller="film" action="save">
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
        <label>Film Type</label>
        <g:textField name="filmType" value="${film?.filmType}"/>
    </div>


    <div>
        <label>Genres</label><br/>
        <g:each in="${genres}" var="g">
            <label>
                <input type="checkbox" name="genres.id" value="${g.id}"
                       <g:if test="${film?.genres*.id?.contains(g.id)}">checked</g:if>/>
                ${g.name}
            </label><br/>
        </g:each>
    </div>

    <div>
        <g:submitButton name="create" value="Save"/>
    </div>
</g:form>
</body>
</html>
