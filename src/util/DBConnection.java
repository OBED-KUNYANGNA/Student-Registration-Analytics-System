package util;

import java.sql.*;

public class DBConnection {
    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            // This returns the connection directly to the DAO
            return DriverManager.getConnection("jdbc:mysql://localhost:3306/student_db", "root", "");
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
