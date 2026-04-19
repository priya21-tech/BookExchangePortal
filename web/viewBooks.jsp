<%@ page import="java.sql.*" %>
<%@ page import="servlet.DBConnection" %>
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
    <title>View Books</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>

<div class="container">

    <h1>All Books</h1>

    <!-- 👑 ADMIN ONLY -->
    <% if ("admin".equals(role)) { %>
        <a href="addBook.jsp"><button>Add Book</button></a>
    <% } %>

    <!-- COMMON -->
    <a href="dashboard.jsp"><button>Dashboard</button></a>
    <a href="logout"><button>Logout</button></a>

    <br><br>

    <table border="1">
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Author</th>
            <th>Price</th>
            <th>Action</th>
        </tr>

        <%
            try {
                Connection con = DBConnection.getConnection();

                String query = "SELECT * FROM books";
                PreparedStatement ps = con.prepareStatement(query);

                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
        %>

        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getString("author") %></td>
            <td><%= rs.getDouble("price") %></td>

            <!-- 🔥 THIS IS WHERE YOUR CODE GOES -->
            <td>
                <% if ("admin".equals(role)) { %>
                    <a href="editBook.jsp?id=<%= rs.getInt("id") %>">
                        <button>Edit</button>
                    </a>

                    <a href="deleteBook?id=<%= rs.getInt("id") %>">
                        <button>Delete</button>
                    </a>
                <% } else { %>
                    <span style="color: #aaa;">View Only</span>
                <% } %>
            </td>
        </tr>

        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>

    </table>

</div>

</body>
</html>