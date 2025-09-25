<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Edit Film</title>
</head>
<body>
<g:link action="index">Back to List</g:link>
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

%{--    <div>--}%
%{--        <label>Release Date</label>--}%
%{--        <g:datePicker name="releaseDate" precision="day" value="${film?.releaseDate}"/>--}%
%{--    </div>--}%

    <div>
        <label>Release Date</label>
        %{--        <g:field type="date" name="releaseDate" value="${film?.releaseDate?.format('yyyy-MM-dd')}"/>--}%
        <g:field type="date" name="releaseDate"
                 value="${film?.releaseDate ? formatDate(format: 'yyyy-MM-dd', date: film.releaseDate) : ''}"/>

    </div>

    <div>
        <label>Film Type</label>
        <select id="filmType" name="filmType">
            <option value="Fiction" <g:if test="${film?.filmType == 'Fiction'}">selected</g:if>>Fiction</option>
            <option value="Documentary" <g:if test="${film?.filmType == 'Documentary'}">selected</g:if>>Documentary</option>
        </select>
    </div>

    <div id="sourceDiv" style="display: none;">
        <label>Source</label>
        <g:textField name="source" value="${film?.source}"/>
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
        <label>Add Synopsis?</label>
        <select id="hasSynopsis">
            <option value="NO">NO</option>
            <option value="YES">YES</option>
        </select>
    </div>

    <div id="synopsisDiv" style="display:none;">
        <label>Synopsis</label>
        <g:textArea name="synopsis" value="${film?.synopsis}"/>
    </div>

    <div>
        <g:submitButton name="update" value="Update"/>
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

        function toggleSynopsis() {
            if ($('#hasSynopsis').val() === 'YES'){
                $('#synopsisDiv').show();
            } else {
                $('#synopsisDiv').hide();
            }
        }

        toggleSource();
        toggleSynopsis();

        $('#filmType').change(function() {
            toggleSource();
        });

        $('#hasSynopsis').change(function () {
            toggleSynopsis();
        });
    });
</script>

</body>
</html>
