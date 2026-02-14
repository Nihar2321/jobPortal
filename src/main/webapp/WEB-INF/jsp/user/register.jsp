<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Account</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<nav class="navbar navbar-dark bg-dark px-4">
    <span class="navbar-brand">Job Portal</span>
    <a href="/" class="btn btn-outline-light">Home</a>
</nav>

<div class="container mt-4">

    <div class="card shadow mx-auto p-4" style="max-width: 850px;">
        <h3 class="text-center mb-4">Create Account</h3>

        <form action="/register" method="post">

            <!-- Row 1 -->
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label>First Name</label>
                    <input type="text" name="firstName" class="form-control" required>
                </div>

                <div class="col-md-6 mb-3">
                    <label>Last Name</label>
                    <input type="text" name="lastName" class="form-control" required>
                </div>
            </div>

            <!-- Row 2 -->
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label>Email</label>
                    <input type="email" name="email" class="form-control" required>
                </div>

                <div class="col-md-6 mb-3">
                    <label>Password</label>
                    <input type="password" name="password" class="form-control" required>
                </div>
            </div>

            <!-- Row 3 -->
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label>Phone</label>
                    <input type="text" name="phone" class="form-control">
                </div>

                <div class="col-md-6 mb-3">
                    <label>Location</label>
                    <input type="text" name="location" class="form-control">
                </div>
            </div>

            <!-- Row 4 -->
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label>Age</label>
                    <input type="number" name="age" class="form-control">
                </div>

                <div class="col-md-6 mb-3">
                    <label>Gender</label>
                    <select name="gender" class="form-control">
                        <option>Select</option>
                        <option>Male</option>
                        <option>Female</option>
                        <option>Other</option>
                    </select>
                </div>
            </div>

            <button class="btn btn-success w-100 mt-2">Register</button>

        </form>
    </div>

</div>

</body>
</html>
