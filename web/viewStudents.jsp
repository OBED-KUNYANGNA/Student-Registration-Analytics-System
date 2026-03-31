<%@page import="model.Student"%>
<%@page import="java.util.List"%>
<%@page import="dao.StudentDAO"%>
<%@page import="model.Admin"%>
<%
    // Security check: redirect to login if session is empty
    Admin admin = (Admin) session.getAttribute("adminUser");
    if (admin == null) { 
        response.sendRedirect("login.jsp"); 
        return; 
    }
    
    // Fetch students using the updated DAO
    StudentDAO dao = new StudentDAO();
    List<Student> students = dao.getAllStudents();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Registered Students | SAS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
    <style>
        body { background-color: #f4f7f6; }
        .sidebar { height: 100vh; width: 250px; position: fixed; left: 0; top: 0; background: #4e73df; color: white; }
        .main-content { margin-left: 250px; padding: 30px; }
        .student-img { width: 50px; height: 50px; object-fit: cover; border-radius: 50%; border: 2px solid #4e73df; }
    </style>
</head>
<body>

    <div class="sidebar p-3 shadow">
        <h5 class="fw-bold text-center mb-4">SAS Admin</h5>
        <hr>
        <ul class="nav flex-column">
            <li class="nav-item"><a class="nav-link text-white" href="dashboard.jsp"><i class="fas fa-home me-2"></i> Dashboard</a></li>
            <li class="nav-item"><a class="nav-link text-white active" href="view_students.jsp"><i class="fas fa-user-graduate me-2"></i> Students</a></li>
            <li class="nav-item"><a class="nav-link text-white" href="add_student.jsp"><i class="fas fa-plus-circle me-2"></i> Add New</a></li>
        </ul>
    </div>

    <div class="main-content">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="fw-bold text-primary">Student Records</h2>
            <a href="add_student.jsp" class="btn btn-primary shadow-sm"><i class="fas fa-plus me-2"></i>Register New</a>
        </div>

        <div class="card border-0 shadow-sm">
            <div class="card-body p-0">
                <table class="table table-hover align-middle mb-0">
                    <thead class="table-light">
                        <tr>
                            <th>Photo</th>
                            <th>Full Name</th>
                            <th>Email</th>
                            <th>Gender</th>
                            <th>Course</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if(students.isEmpty()) { %>
                            <tr><td colspan="6" class="text-center p-4 text-muted">No students registered yet.</td></tr>
                        <% } else { 
                            for(Student s : students) { %>
                            <tr>
                                <td><img src="<%= s.getPhoto() %>" class="student-img" alt="Profile"></td>
                                <td class="fw-bold"><%= s.getFullname() %></td>
                                <td><%= s.getEmail() %></td>
                                <td><%= s.getGender() %></td>
                                <td><span class="badge bg-info text-dark"><%= s.getCourse() %></span></td>
                                <td>
                                    <button class="btn btn-sm btn-outline-danger"><i class="fas fa-trash"></i></button>
                                </td>
                            </tr>
                        <% } } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>