package dao;

import java.sql.*;
import model.Admin;
import util.DBConnection;

public class AdminDAO {

    public Admin login(String email, String password) {
        Admin admin = null;
        String sql = "SELECT * FROM admins WHERE email=? AND password=?";

        // Initialize connection inside try-with-resources to prevent "null" errors
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    admin = new Admin();
                    // Use small letters to match your database
                    admin.setId(rs.getInt("id"));
                    admin.setEmail(rs.getString("email"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return admin;
    }
}
