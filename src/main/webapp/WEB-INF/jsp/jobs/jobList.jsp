<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<html>
<head>
    <title>Jobs</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<%
    Object userObj = session.getAttribute("loggedUser");
    com.jobportal.entity.User currentUser = null;
    String role = "";

    if (userObj != null) {
        currentUser = (com.jobportal.entity.User) userObj;
        if (currentUser.getRole() != null) {
            role = currentUser.getRole().trim().toUpperCase();
        }
    }
%>

<nav class="navbar navbar-dark bg-dark px-4">
    <span class="navbar-brand">Job Portal</span>

    <div class="ms-auto">
        <a href="/" class="btn btn-outline-light me-2">Home</a>

        <% if ("ADMIN".equals(role)) { %>
            <a href="/jobs/new" class="btn btn-success">Post Job</a>
        <% } %>
    </div>
</nav>

<div class="container mt-4">
    <h3 class="mb-4">Available Jobs</h3>

    <c:forEach var="job" items="${jobs}">
        <div class="card mb-3 p-3 shadow-sm">
            <h5>${job.title}</h5>
            <p><b>Company:</b> ${job.company}</p>
            <p><b>Location:</b> ${job.location}</p>
            <p><b>Salary:</b> ${job.salary}</p>
            <p>${job.description}</p>

            <!-- USER can Apply -->
            <% if ("USER".equals(role)) { %>
                <a href="/jobs/apply/${job.id}" class="btn btn-primary">
                    Apply
                </a>
            <% } %>

            <!-- ADMIN can view applicants -->
            <% if ("ADMIN".equals(role)) { %>
                <a href="/jobs/applicants/${job.id}" class="btn btn-dark ms-2">
                    View Applicants
                </a>
            <% } %>

        </div>
    </c:forEach>
</div>

</body>
</html>
