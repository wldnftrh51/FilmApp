<%@ page layout="auth" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="bg-light d-flex align-items-center" style="height: 100vh;">

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-4">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h3 class="text-center mb-4">🔐 Login</h3>

                    <g:if test='${flash.message}'>
                        <div class="alert alert-danger">${flash.message}</div>
                    </g:if>

                    <form action='${postUrl ?: "/login/authenticate"}' method='POST' autocomplete='off'>
                        <div class="mb-3">
                            <label for="username" class="form-label">Username</label>
                            <input type="text" class="form-control" id="username" name="username" required autofocus>
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>

                        <div class="d-grid mb-3">
                            <button type="submit" class="btn btn-primary">Login</button>
                        </div>

                        <div class="text-center">
                            <p class="mb-0">Belum punya akun?
                            <g:link controller="register" action="index">Register</g:link>
                            </p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
