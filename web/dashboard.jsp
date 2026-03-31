<%@page import="dao.StudentDAO"%>
<%@page import="model.Student"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // 1. Data Fetching
    StudentDAO studentDao = new StudentDAO();
    List<Student> allStudents = studentDao.getAllStudents();
    int studentCount = (allStudents != null) ? allStudents.size() : 0;

    // Course counts for chart data
    int dsCount = studentDao.getCourseCount("Data Science & Analytics");
    int csCount = studentDao.getCourseCount("Computer Science");
    int itCount = studentDao.getCourseCount("Information Technology");
    int cyberCount = studentDao.getCourseCount("Cyber Security");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard | Student Analytics</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
    
    <style>
        body { background-color: #f4f7f6; margin: 0; padding: 0; }
        
        /* SIDEBAR - Keep fixed for navigation */
        .sidebar {
            width: 250px;
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            background: #4e73df;
            color: white;
            z-index: 1000;
            padding-top: 20px;
        }
        
        /* MAIN CONTENT - Pushed right by sidebar width */
        .main-content {
            margin-left: 250px; 
            padding: 40px;
            min-height: 100vh;
        }

        .nav-link { color: rgba(255,255,255,0.8); margin-bottom: 15px; padding: 10px 20px; display: block; text-decoration: none; }
        .nav-link:hover, .nav-link.active { color: white; background: rgba(255,255,255,0.1); border-radius: 5px; }
        .card { border: none; border-radius: 12px; background: white; }
        
        /* Search Box styling for top right */
        .search-box {
            max-width: 350px;
        }
    </style>
</head>
<body>

    <div class="sidebar shadow">
        <div class="text-center mb-4">
            <i class="fas fa-chart-pie fa-2x mb-2 text-white"></i>
            <h5 class="fw-bold text-white">SAS Admin</h5>
        </div>
        <hr class="mx-3 text-white">
        <nav class="px-3">
            <a class="nav-link active" href="dashboard.jsp"><i class="fas fa-tachometer-alt me-2"></i> Dashboard</a>
            <a class="nav-link" href="view_students.jsp"><i class="fas fa-users me-2"></i> Students</a>
            <a class="nav-link" href="add_student.jsp"><i class="fas fa-user-plus me-2"></i> Add New</a>
        </nav>
    </div>

    <div class="main-content">
        <div class="container-fluid">
            
            <div class="d-flex justify-content-between align-items-center mb-5">
                <h2 class="fw-bold text-dark mb-0">Admin Dashboard</h2>
                
                <form action="view_students.jsp" method="GET" class="search-box">
                    <div class="input-group shadow-sm border rounded">
                        <input type="text" name="search" class="form-control border-0" placeholder="Search students..." required>
                        <button class="btn btn-white text-primary" type="submit">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                </form>
            </div>

            <div class="row mb-5">
                <div class="col-md-4">
                    <div class="card shadow p-4 border-start border-primary border-5">
                        <small class="text-primary fw-bold text-uppercase">Total Students</small>
                        <h2 class="fw-bold mb-0 mt-2"><%= studentCount %></h2>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-10">
                    <div class="card shadow p-4">
                        <h5 class="fw-bold mb-4 text-secondary text-center">Student Distribution by Course</h5>
                        <div style="height: 400px; position: relative;">
                            <canvas id="myPieChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        const ctx = document.getElementById('myPieChart').getContext('2d');
        new Chart(ctx, {
            type: 'pie',
            data: {
                labels: ['Data Science', 'Computer Science', 'Info Tech', 'Cyber Security'],
                datasets: [{
                    data: [<%= dsCount %>, <%= csCount %>, <%= itCount %>, <%= cyberCount %>],
                    backgroundColor: ['#4e73df', '#1cc88a', '#f6c23e', '#e74a3b'],
                    hoverOffset: 25
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { position: 'bottom', labels: { padding: 20 } }
                }
            }
        });
    </script>
</body>
</html>