<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String user = (String) session.getAttribute("user");
    String role = (String) session.getAttribute("role");

    // 🔐 Session protection
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>

<div class="container">

    <h1>Welcome <%= user %></h1>
    <p>You are successfully logged in!</p>

    <br>

    <!-- 👑 ADMIN ONLY -->
    <% if ("admin".equals(role)) { %>
        <a href="addBook.jsp"><button>Add Book</button></a>
    <% } %>

    <!-- 👤 COMMON FOR ALL -->
    <a href="viewBooks.jsp"><button>View Books</button></a>

    <br><br>

    <a href="logout"><button>Logout</button></a>

</div>

</body>
</html>