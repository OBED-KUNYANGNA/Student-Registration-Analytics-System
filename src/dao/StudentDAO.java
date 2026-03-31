package dao;

import java.sql.*;
import java.util.*;
import model.Student;
import util.DBConnection;

public class StudentDAO {

    // Match these to your dbase columns: fullname, email, gender, course, photo
public boolean addStudent(Student s) {
    boolean f = false;
    String sql = "INSERT INTO students(fullname, email, gender, course, photo) VALUES(?,?,?,?,?)";
    try (Connection conn = util.DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setString(1, s.getFullname());
        ps.setString(2, s.getEmail());
        ps.setString(3, s.getGender());
        ps.setString(4, s.getCourse());
        ps.setString(5, s.getPhoto());
        if (ps.executeUpdate() == 1) f = true;
    } catch (Exception e) { e.printStackTrace(); }
    return f;
}

public List<Student> getAllStudents() {
    List<Student> list = new ArrayList<>();
    String sql = "SELECT * FROM students";
    try (Connection conn = util.DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {
        while (rs.next()) {
            Student s = new Student();
            s.setId(rs.getInt("id"));
            s.setFullname(rs.getString("fullname")); // Must be lowercase
            s.setEmail(rs.getString("email"));       // Must be lowercase
            s.setGender(rs.getString("gender"));
            s.setCourse(rs.getString("course"));
            s.setPhoto(rs.getString("photo"));
            list.add(s);
        }
    } catch (Exception e) { e.printStackTrace(); }
    return list;
}

   
   

    // FIXES the error in DeleteStudentServlet
    public boolean deleteStudent(int id) {
        boolean f = false;
        String sql = "DELETE FROM students WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            if (ps.executeUpdate() == 1) f = true;
        } catch (Exception e) { e.printStackTrace(); }
        return f;
    }

  // Add this to StudentDAO.java to fix the Dashboard Error
public int getCourseCount(String courseName) {
    int count = 0;
    String sql = "SELECT COUNT(*) FROM students WHERE course = ?";
    try (Connection conn = util.DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        
        ps.setString(1, courseName);
        ResultSet rs = ps.executeQuery();
        
        if (rs.next()) {
            count = rs.getInt(1);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return count;
}

// Add this to StudentDAO.java to fix the Search Error
public List<Student> searchStudents(String keyword) {
    List<Student> list = new ArrayList<>();
    String sql = "SELECT * FROM students WHERE fullname LIKE ? OR course LIKE ?";
    try (Connection conn = util.DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setString(1, "%" + keyword + "%");
        ps.setString(2, "%" + keyword + "%");
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Student s = new Student();
            s.setId(rs.getInt("id"));
            s.setFullname(rs.getString("fullname"));
            s.setEmail(rs.getString("email"));
            s.setGender(rs.getString("gender"));
            s.setCourse(rs.getString("course"));
            s.setPhoto(rs.getString("photo"));
            list.add(s);
        }
    } catch (Exception e) { e.printStackTrace(); }
    return list;
}


}
