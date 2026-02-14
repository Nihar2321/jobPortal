<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Job Portal</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            height: 100vh;
            margin: 0;
            background: url('/resources/bgHome.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        .overlay {
            height: 100vh;
            background: rgba(255,255,255,0.75); /* keeps text readable */
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        .hero-box {
            padding: 40px;
            border-radius: 15px;
        }

        .hero-title {
            font-size: 60px;
            font-weight: 700;
            color: #222;
        }

        .hero-sub {
            font-size: 22px;
            color: #555;
            margin-bottom: 30px;
        }

        .browse-btn {
            padding: 15px 40px;
            font-size: 20px;
            border-radius: 10px;
        }
    </style>
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-dark bg-dark px-4">
    <span class="navbar-brand">Job Portal</span>

    <div class="ms-auto">
        <%
            Object userObj = session.getAttribute("loggedUser");
            if (userObj == null) {
        %>
            <a href="/login" class="btn btn-outline-light me-2">Login</a>
            <a href="/register" class="btn btn-success">Register</a>
        <%
            } else {
                com.jobportal.entity.User u = (com.jobportal.entity.User) userObj;
        %>
            <span class="text-white me-3">Welcome, <%= u.getFirstName() %></span>
            <a href="/logout" class="btn btn-danger">Logout</a>
        <%
            }
        %>
    </div>
</nav>

<!-- CENTER SECTION -->
<div class="overlay">
    <div class="hero-box">
        <div class="hero-title">Welcome to Job Portal</div>
        <div class="hero-sub">Find jobs. Hire talent. Grow faster.</div>

        <a href="/jobs" class="btn btn-primary browse-btn">
            Browse Jobs
        </a>
    </div>
</div>

</body>
</html>
