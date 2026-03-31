package Student;

import dao.StudentDAO;
import model.Student;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/StudentServlet")
@MultipartConfig
public class StudentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // 1. Get parameters from the HTML form (student_id REMOVED)
            String fullname = request.getParameter("fullname");
            String email = request.getParameter("email");
            String gender = request.getParameter("gender");
            String course = request.getParameter("course");

            // 2. Handle the photo upload
            Part part = request.getPart("photo");
            String fileName = part.getSubmittedFileName();

            // 3. Create student object and SET THE FIELDS
            Student s = new Student();
            s.setFullname(fullname);
            s.setEmail(email);
            s.setGender(gender);
            s.setCourse(course);
            s.setPhoto(fileName);
            // Note: s.setStudentId is NOT called here because we removed it

            // 4. Save to database using DAO
            StudentDAO studentDAO = new StudentDAO();
            boolean success = studentDAO.addStudent(s);

            // 5. Redirect based on success
            if (success) {
                // Redirects to the list with a success message in the URL
                response.sendRedirect(request.getContextPath() + "/view_students.jsp?msg=Registration%20Successful");
            } else {
                response.sendRedirect(request.getContextPath() + "/add_student.jsp?msg=Error%20Database%20Failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/add_student.jsp?msg=Error:%20" + e.getMessage());
        }
    }
}
