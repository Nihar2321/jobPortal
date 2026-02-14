<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Job Portal</title>

    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<nav class="navbar navbar-dark bg-dark px-4">

    <span class="navbar-brand">Job Portal</span>

    <div class="ms-auto">
        <%
            Object userObj = session.getAttribute("loggedUser");
            if (userObj != null) {
        %>
            <span class="text-white me-3">
                Welcome, ${loggedUser.firstName}
            </span>
            <a href="/logout" class="btn btn-danger">Logout</a>
        <%
            } else {
        %>
        	<a href="/jobs" class="btn btn-warning me-2">View Jobs</a>
            <a href="/register" class="btn btn-success me-2">Register</a>
            <a href="/login" class="btn btn-outline-light">Login</a>
        <%
            }
        %>
    </div>

</nav>



<div class="container mt-5">
    <div class="text-center">
        <h2>Welcome to Job Portal</h2>
        <p class="text-muted">Find jobs. Hire talent. Grow faster.</p>
    </div>
</div>

</body>
</html>
