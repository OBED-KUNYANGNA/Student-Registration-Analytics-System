package Student;

import dao.AdminDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.Admin;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        AdminDAO dao = new AdminDAO();
        // Updated this line to use 'login' instead of 'validate'
        Admin admin = dao.login(email, password);

        if (admin != null) {
            // Store the full admin object in the session
            HttpSession session = request.getSession();
            session.setAttribute("adminUser", admin);
            
           // Change "dashboard.jsp" to "view_students.jsp"
response.sendRedirect(request.getContextPath() + "/view_students.jsp");
        } else {
            // Redirect back with an error message if login fails
            response.sendRedirect("index.jsp?error=Invalid email or password");
        }
    }
}
