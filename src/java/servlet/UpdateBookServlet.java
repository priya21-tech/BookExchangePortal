package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateBook")
public class UpdateBookServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);

if (session == null || !"admin".equals(session.getAttribute("role"))) {
    response.sendRedirect("login.jsp");
    return;
}

        String id = request.getParameter("id");
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String price = request.getParameter("price");

        try {
            Connection con = DBConnection.getConnection();

            String query = "UPDATE books SET title=?, author=?, price=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, title);
            ps.setString(2, author);
            ps.setDouble(3, Double.parseDouble(price));
            ps.setInt(4, Integer.parseInt(id));

            int i = ps.executeUpdate();

            if (i > 0) {
                response.sendRedirect("viewBooks.jsp");
            } else {
                response.getWriter().println("Update Failed!");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}