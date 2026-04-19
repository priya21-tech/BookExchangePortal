<%
    String role = (String) session.getAttribute("role");

    if (role == null || !role.equals("admin")) {
        response.sendRedirect("dashboard.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Book</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<h2>Add Book</h2>

<form action="addBook" method="post">
    Title: <input type="text" name="title"><br><br>
    Author: <input type="text" name="author"><br><br>
    Price: <input type="text" name="price"><br><br>

    <input type="submit" value="Add Book">
</form>

</body>
</html>