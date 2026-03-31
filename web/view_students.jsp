<%@page import="model.Student"%>
<%@page import="java.util.List"%>
<%@page import="dao.StudentDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>View Students</title>
    <style>
 .table-blue-header {
            background-color: #007bff !important;
            color: white !important;
        }
        .btn-secondary {
            background-color: #0056b3 !important;
            border: none;
        }
    </style>

    
       
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
   
    <body class="bg-light">
        <div class="container mt-5">
            <h2 class="text-center mb-4">Registered Students</h2>

            <%
                // Display Success or Error Messages
                String msg = request.getParameter("msg");
                if (msg != null) {
            %>
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <strong>Notice:</strong> <%= msg %>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <%
                }
            %>

            <div class="card shadow">
                <div class="card-body">
                    <table class="table table-hover">
                        <thead class="table-blue-header">
                            <tr>
                                <th>ID</th> <th>Full Name</th>
                                <th>Email</th>
                                <th>Gender</th>
                                <th>Course</th>
                                <th>Photo</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                StudentDAO dao = new StudentDAO();
                                List<Student> list = dao.getAllStudents();
                                if (list.isEmpty()) {
                            %>
                                <tr>
                                    <td colspan="7" class="text-center">No Students Found</td>
                                </tr>
                            <%
                                } else {
                                    for (Student s : list) {
                            %>
                               <tr>
        <td><%= s.getId() %></td>
        <td><%= s.getFullname() %></td> 
        <td><%= s.getEmail() %></td>
        <td><%= s.getGender() %></td>
        <td><%= s.getCourse() %></td>
        <td>
           <img src="img/<%= s.getPhoto() %>" width="50" height="50" class="rounded-circle">
        </td>
        <td>
            <a href="edit_student.jsp?id=<%= s.getId() %>" class="btn btn-sm btn-primary">Edit</a>
            <a href="DeleteStudentServlet?id=<%= s.getId() %>" class="btn btn-sm btn-danger">Delete</a>
        </td>
    </tr>
                            <%
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
            
            <div class="text-center mt-3">
                <a href="dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>