package servlet;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {
    Connection con = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        System.out.println("Driver Loaded!");

        con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/book_portal",
            "root",
            "priya19"
        );

        System.out.println("Database Connected!");

    } catch (Exception e) {
        System.out.println("DB ERROR:");
        e.printStackTrace();
    }

    return con;
}
}