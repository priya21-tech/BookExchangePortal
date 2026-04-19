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

@WebServlet("/addBook")
public class AddBookServlet extends HttpServlet {
    

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);

if (session == null || !"admin".equals(session.getAttribute("role"))) {
    response.sendRedirect("login.jsp");
    return;
}

        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String price = request.getParameter("price");

        try {
            Connection con = DBConnection.getConnection();

            String query = "INSERT INTO books (title, author, price) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, title);
            ps.setString(2, author);
            ps.setDouble(3, Double.parseDouble(price));

            int i = ps.executeUpdate();

            if (i > 0) {
                response.getWriter().println("Book Added Successfully!");
            } else {
                response.getWriter().println("Failed to Add Book!");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}