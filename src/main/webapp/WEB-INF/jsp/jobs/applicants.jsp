<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<html>
<head>
    <title>Applicants</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-4">
    <h3>Applicants for this Job</h3>

    <table class="table table-bordered mt-3">
        <tr>
            <th>Application ID</th>
            <th>User ID</th>
            <th>Status</th>
            <th>Action</th>
        </tr>

        <c:forEach var="app" items="${applications}">
            <tr>
                <td>${app.id}</td>
                <td>${app.userId}</td>
                <td>${app.status}</td>
                <td>
                    <a href="/applications/approve/${app.id}" class="btn btn-success btn-sm">
                        Approve
                    </a>

                    <a href="/applications/reject/${app.id}" class="btn btn-danger btn-sm ms-2">
                        Reject
                    </a>
                </td>
            </tr>
        </c:forEach>

    </table>
</div>

</body>
</html>
