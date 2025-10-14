<%@ page layout="auth" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="bg-light d-flex align-items-center" style="height: 100vh;">

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h3 class="text-center mb-4">📝 Register</h3>

                    <g:if test='${flash.message}'>
                        <div class="alert alert-danger">${flash.message}</div>
                    </g:if>

                    <g:form controller="register" action="save" method="POST" autocomplete="off">
                        <div class="mb-3">
                            <label for="username" class="form-label">Username</label>
                            <g:textField name="username" class="form-control" required="true"/>
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <g:passwordField name="password" class="form-control" required="true"/>
                        </div>

                        <div class="mb-3">
                            <label for="role" class="form-label">Register As</label>
                            <g:select name="role"
                                      from="${['ROLE_USER':'User', 'ROLE_ADMIN':'Admin']}"
                                      optionKey="key" optionValue="value"
                                      class="form-select"/>
                        </div>

                        <div class="d-grid mb-3">
                            <button type="submit" class="btn btn-success">Create Account</button>
                        </div>

                        <div class="text-center">
                            <p class="mb-0">Sudah punya akun?
                            <g:link controller="login" action="auth">Login</g:link>
                            </p>
                        </div>
                    </g:form>

                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
