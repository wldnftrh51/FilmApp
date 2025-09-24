<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Create Film</title>
</head>

<body>
<h1>Edit Film</h1>

<g:form controller="film" action="update" method="PUT">
    <g:hiddenField name="id" value="${film?.id}"/>
    <!-- Form fields sama seperti create.gsp -->
    <div>
        <label>Title</label>
        <g:field name="title" value="${film?.title}"/>
    </div>

    <div>
        <label>Studio</label>
        <g:select name="studio.id" from="${studios}" optionKey="id" optionValue="name"
                  value="${film?.studio?.id}" noSelection="['': '--Select Studio--']"/>
    </div>

    <div>
        <label>Release Date</label>
        <g:field type="date" name="releseaseDate" value="${film?.releseaseDate}"/>
    </div>

    <div>
        <label>Film Type</label>
        <g:select id="filmType" name="filmType" from="${['Fiction', 'Documentary']}"
                  value="${film?.filmType}"/>
    </div>

    <div id="subgenreField">
        <label>Subgenre (Fiction)</label>
        <g:select name="subgenre.id" from="${subgenres}" optionKey="id" optionValue="name"
                  value="${film?.subgenre?.id}" noSelection="['':'--Select Subgenre--']"/>
    </div>

    <div id="subjectAreaField">
        <label>Subject Area (Documentary)</label>
        <g:field name="subjectArea" value="${film?.subjectArea}"/>
    </div>

    <div>
        <label>Has Sequel?</label>
        <g:checkBox id="hasSequel" name="hasSequel" value="${film?.hasSequel}"/>
    </div>

    <div id="sequelTitleField">
        <label>Sequel Title</label>
        <g:field name="sequelTitle" value="${film?.sequelTitle}"/>
    </div>

    <div>
        <label>Genres</label>
        <g:each in="${genres}" var="g">
            <label>
                <g:checkBox name="genres" value="${g.id}"
                            checked="${film?.genres?.id?.contains(g.id)}"/> ${g.name}
            </label><br/>
        </g:each>
    </div>

    <g:submitButton name="update" value="Update"/>
</g:form>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        function toggleFields() {
            const filmType = $('#filmType').val();
            if (filmType === 'Fiction') {
                $('#subgenreField').show();
                $('#subjectAreaField').hide();
            } else if (filmType === 'Documentary') {
                $('#subgenreField').hide();
                $('#subjectAreaField').show();
            } else {
                $('#subgenreField,#subjectAreaField').hide();
            }

            if ($('#hasSequel').is(':checked')) {
                $('#sequelTitleField').show();
            } else {
                $('#sequelTitleField').hide();
            }
        }

        toggleFields();
        $('#filmType').change(toggleFields);
        $('#hasSequel').change(toggleFields);
    });
</script>
</body>
</html>
