<%@page import="model.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Check if admin is logged in
    Admin admin = (Admin) session.getAttribute("adminUser");
    if (admin == null) { 
        response.sendRedirect("index.jsp"); 
        return; 
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Student | SAS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
    <style>
        body { background-color: #f4f7f6; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .sidebar { height: 100vh; width: 250px; position: fixed; left: 0; top: 0; background: #4e73df; color: white; z-index: 1000; }
        .main-content { margin-left: 250px; padding: 40px; }
        .nav-link { color: rgba(255,255,255,0.8); margin-bottom: 10px; transition: 0.3s; }
        .nav-link:hover, .nav-link.active { color: white; background: rgba(255,255,255,0.2); border-radius: 5px; }
        .card { border: none; border-radius: 15px; }
    </style>
</head>
<body>

    <div class="sidebar p-3 shadow">
        <div class="text-center mb-4">
            <i class="fas fa-chart-pie fa-2x mb-2"></i>
            <h5 class="fw-bold">SAS Admin</h5>
        </div>
        <hr>
        <ul class="nav flex-column">
            <li class="nav-item"><a class="nav-link" href="dashboard.jsp"><i class="fas fa-home me-2"></i> Dashboard</a></li>
            <li class="nav-item"><a class="nav-link" href="view_students.jsp"><i class="fas fa-user-graduate me-2"></i> Students</a></li>
            <li class="nav-item"><a class="nav-link active" href="add_student.jsp"><i class="fas fa-plus-circle me-2"></i> Add New</a></li>
        </ul>
    </div>

    <div class="main-content">
        <div class="container">
            <div class="card shadow-sm p-4">
                <h3 class="fw-bold text-primary mb-4"><i class="fas fa-user-plus me-2"></i>New Student Registration</h3>
                
                <%-- Status Messages --%>
                <% if(request.getParameter("msg") != null) { 
                    String msg = request.getParameter("msg");
                    String alertClass = msg.contains("Success") ? "alert-success" : "alert-danger";
                %>
                    <div class="alert <%= alertClass %> alert-dismissible fade show">
                        <%= msg %>
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                <% } %>

               <form action="StudentServlet" method="post" enctype="multipart/form-data">
    <div class="row">
       

        <div class="col-md-6 mb-3">
            <label class="form-label fw-bold">Full Name</label>
            <input type="text" name="fullname" class="form-control" placeholder="Enter Full Name" required>
            
            <input type="email" name="email" class="form-control" placeholder="Enter Email" required>
        </div>
    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold">Gender</label>
                            <select name="gender" class="form-select" required>
                                <option value="">Select Gender...</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold">Course / Program</label>
                            <select name="course" class="form-select" required>
                                <option value="">Select Course...</option>
                                <option>Data Science & Analytics</option>
                                <option>Computer Science</option>
                                <option>Information Technology</option>
                                <option>Cyber Security</option>
                            </select>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12 mb-3">
                            <label class="form-label fw-bold">Profile Photo</label>
                            <input type="file" name="photo" class="form-control" accept="image/*" required>
                        </div>
                    </div>

                    <div class="mt-4 text-end">
                        <button type="reset" class="btn btn-light px-4 me-2">Clear</button>
                        <button type="submit" class="btn btn-primary px-5 shadow-sm">Register Student</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>