package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        // Get form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Debug (VERY IMPORTANT)
        System.out.println("Name: " + name);
        System.out.println("Email: " + email);
        System.out.println("Password: " + password);

        try {
            Connection con = DBConnection.getConnection();

            // Check if connection is null
            if (con == null) {
                response.getWriter().println("<h2>Database Connection Failed!</h2>");
                return;
            }

            String query = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);

            int i = ps.executeUpdate();

            if (i > 0) {
                response.getWriter().println("<h2>Registration Successful!</h2>");
            } else {
                response.getWriter().println("<h2>Registration Failed!</h2>");
            }

        } catch (Exception e) {
            response.getWriter().println("<h2>ERROR:</h2>");
            response.getWriter().println(e.getMessage());
            e.printStackTrace();
        }
    }
}