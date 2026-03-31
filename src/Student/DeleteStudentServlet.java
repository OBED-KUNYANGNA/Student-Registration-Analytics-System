package Student;

import dao.StudentDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteStudentServlet")
public class DeleteStudentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Get the primary key 'id' from the URL link
        String idParam = request.getParameter("id");
        
        try {
            if (idParam != null) {
                int id = Integer.parseInt(idParam);
                
                // 2. Call the DAO to delete by numeric ID
                StudentDAO dao = new StudentDAO();
                boolean success = dao.deleteStudent(id);
                
                // 3. Redirect back with a status message
                if (success) {
                  response.sendRedirect(request.getContextPath() + "/view_students.jsp?msg=Student deleted successfully");
                } else {
                    
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("view_students.jsp?msg=Invalid Student ID");
        }
    }
}
