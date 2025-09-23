<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'film.label', default: 'Film')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<div id="content" role="main">
    <div class="container">
        <section class="row">
            <a href="#create-film" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                         default="Skip to content&hellip;"/></a>

            <div class="nav" role="navigation">
                <ul>
                    <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                    <li><g:link class="list" action="index"><g:message code="default.list.label"
                                                                       args="[entityName]"/></g:link></li>
                </ul>
            </div>
        </section>
        <section class="row">
            <div id="create-film" class="col-12 content scaffold-create" role="main">
                <h1><g:message code="default.create.label" args="[entityName]"/></h1>
                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>
                <g:hasErrors bean="${this.film}">
                    <ul class="errors" role="alert">
                        <g:eachError bean="${this.film}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                    error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </g:hasErrors>
                <g:form resource="${this.film}" method="POST">
                    <fieldset class="form">

                        <!-- Title -->
                        <div class="fieldcontain" id="titleField">
                            <label for="title">Title</label>
                            <g:field name="title" value="${film?.title}" required=""/>
                        </div>

                        <!-- Studio -->
                        <div class="fieldcontain" id="studioField">
                            <label for="studio">Studio</label>
                            <g:field name="studio" value="${film?.studio}" required=""/>
                        </div>

                        <!-- Film Type -->
                        <div class="fieldcontain" id="filmTypeField">
                            <label for="filmType">Film Type</label>
                            <g:select id="filmType" name="filmType" from="${['Fiction', 'Documentary']}"
                                      value="${film?.filmType}"/>
                        </div>

                        <!-- Subgenre (Fiction) -->
                        <div class="fieldcontain" id="subgenreField">
                            <label for="subgenre">Subgenre (Fiction)</label>
                            <g:field name="subgenre" value="${film?.subgenre}"/>
                        </div>

                        <!-- Subject Area (Documentary) -->
                        <div class="fieldcontain" id="subjectAreaField">
                            <label for="subjectArea">Subject Area (Documentary)</label>
                            <g:field name="subjectArea" value="${film?.subjectArea}"/>
                        </div>

                        <!-- Has Sequel -->
                        <div class="fieldcontain">
                            <label for="hasSequel">Has Sequel?</label>
                            <g:checkBox id="hasSequel" name="hasSequel" value="${film?.hasSequel}"/>
                        </div>

                        <!-- Sequel Title -->
                        <div class="fieldcontain" id="sequelTitleField">
                            <label for="sequelTitle">Sequel Title</label>
                            <g:field name="sequelTitle" value="${film?.sequelTitle}"/>
                        </div>

                    </fieldset>


                    <fieldset class="buttons">
                        <g:submitButton name="create" class="save"
                                        value="${message(code: 'default.button.create.label', default: 'Create')}"/>
                    </fieldset>
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
                                $('#subgenreField').hide();
                                $('#subjectAreaField').hide();
                            }

                            if ($('#hasSequel').is(':checked')) {
                                $('#sequelTitleField').show();
                            } else {
                                $('#sequelTitleField').hide();
                            }
                        }

                        toggleFields(); // init

                        $('#filmType').change(toggleFields);
                        $('#hasSequel').change(toggleFields);
                    });
                </script>

            </div>
        </section>
    </div>
</div>
</body>
</html>
