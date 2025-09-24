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

%{--    <div>--}%
%{--        <label>Film Type</label>--}%
%{--        <g:textField name="filmType" value="${film?.filmType}"/>--}%
%{--    </div>--}%

    <div>
        <label>Film Type</label>
        <select id="filmType" name="filmType">
            <option value="Fiction" <g:if test="${film?.filmType == 'Fiction'}">selected</g:if>>Fiction</option>
            <option value="Documentary" <g:if test="${film?.filmType == 'Documentary'}">selected</g:if>>Documentary</option>
        </select>
    </div>

    <div id="sourceDiv" style="display: none;">
        <label>Source</label>
        <g:textField name="subjectArea" value="${film?.subjectArea}"/>
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

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
    $(document).ready(function() {
        function toggleSource() {
            if ($('#filmType').val() === 'Documentary') {
                $('#sourceDiv').show();
            } else {
                $('#sourceDiv').hide();
            }
        }

        toggleSource();

        $('#filmType').change(function() {
            toggleSource();
        });
    });
</script>

</body>
</html>
