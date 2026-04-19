<%@ page import="java.sql.*" %>
<%@ page import="servlet.DBConnection" %>
<%
    String role = (String) session.getAttribute("role");

    if (role == null || !role.equals("admin")) {
        response.sendRedirect("dashboard.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Book</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<h2>Edit Book</h2>

<%
    String id = request.getParameter("id");

    Connection con = DBConnection.getConnection();
    PreparedStatement ps = con.prepareStatement("SELECT * FROM books WHERE id=?");
    ps.setInt(1, Integer.parseInt(id));

    ResultSet rs = ps.executeQuery();

    if(rs.next()) {
%>

<form action="updateBook" method="post">
    <input type="hidden" name="id" value="<%= rs.getInt("id") %>">

    Title: <input type="text" name="title" value="<%= rs.getString("title") %>"><br><br>
    Author: <input type="text" name="author" value="<%= rs.getString("author") %>"><br><br>
    Price: <input type="text" name="price" value="<%= rs.getDouble("price") %>"><br><br>

    <input type="submit" value="Update">
</form>

<%
    }
%>

</body>
</html>