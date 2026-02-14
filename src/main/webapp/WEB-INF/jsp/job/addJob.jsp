<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Post Job</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<nav class="navbar navbar-dark bg-dark px-4">
    <span class="navbar-brand">Job Portal</span>
    <a href="/" class="btn btn-outline-light">Home</a>
</nav>

<div class="container mt-4">
    <div class="card p-4 shadow mx-auto" style="max-width: 800px;">
        <h3 class="text-center mb-4">Post a Job</h3>

        <form action="/jobs/save" method="post">

            <div class="mb-3">
                <label>Job Title</label>
                <input type="text" name="title" class="form-control" required>
            </div>

            <div class="mb-3">
                <label>Company</label>
                <input type="text" name="company" class="form-control" required>
            </div>

            <div class="mb-3">
                <label>Location</label>
                <input type="text" name="location" class="form-control">
            </div>

            <div class="mb-3">
                <label>Salary</label>
                <input type="text" name="salary" class="form-control">
            </div>

            <div class="mb-3">
                <label>Description</label>
                <textarea name="description" class="form-control" rows="4"></textarea>
            </div>

            <button class="btn btn-primary w-100">Post Job</button>

        </form>
    </div>
</div>

</body>
</html>
