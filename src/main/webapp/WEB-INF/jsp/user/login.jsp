<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<nav class="navbar navbar-dark bg-dark px-4">
    <span class="navbar-brand">Job Portal</span>
    <a href="/" class="btn btn-outline-light">Home</a>
</nav>

<div class="container mt-5">
    <div class="card mx-auto p-4 shadow" style="max-width: 450px;">
        <h3 class="text-center mb-4">Login</h3>

        <form action="/login" method="post">

            <div class="mb-3">
                <label>Email</label>
                <input type="email" name="email" class="form-control" required>
            </div>

            <div class="mb-3">
                <label>Password</label>
                <input type="password" name="password" class="form-control" required>
            </div>

            <button class="btn btn-primary w-100">Login</button>
        </form>

        <p class="text-danger text-center mt-3">
            ${error}
        </p>

    </div>
</div>

</body>
</html>
