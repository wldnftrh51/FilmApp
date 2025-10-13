<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><g:layoutTitle default="Authentication"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous"
    >
    <g:layoutHead/>
    <style>
    body {
        background: linear-gradient(135deg, #e3f2fd, #f8f9fa);
        min-height: 100vh;
    }
    .auth-card {
        max-width: 400px;
        width: 100%;
    }
    </style>
</head>
<body class="d-flex justify-content-center align-items-center">

<div class="auth-card">
    <g:layoutBody/>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>
