<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login | Student Analytics System</title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
        
        <link rel="stylesheet" type="text/css" href="css/style.css">
        
        <style>
            /* Specific centering for the login page */
            body {
                height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                background-color: #f0f2f5;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-5 col-lg-4">
                    
                    <div class="card analytics-card p-4 shadow-sm border-0">
                        <div class="text-center mb-4">
                            <div class="bg-primary text-white rounded-circle d-inline-flex align-items-center justify-content-center mb-3" style="width: 70px; height: 70px;">
                                <i class="fas fa-chart-pie fa-2x"></i>
                            </div>
                            <h3 class="fw-bold text-dark">Welcome Back</h3>
                            <p class="text-muted">Enter credentials to access the system</p>
                        </div>

                        <form action="LoginServlet" method="post">
                            
                            <div class="mb-3">
                                <label class="form-label small fw-bold text-secondary">Email Address</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light border-end-0"><i class="fas fa-envelope text-primary"></i></span>
                                    <input type="email" name="email" class="form-control bg-light border-start-0" placeholder="admin@university.edu" required>
                                </div>
                            </div>

                            <div class="mb-4">
                                <label class="form-label small fw-bold text-secondary">Password</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light border-end-0"><i class="fas fa-lock text-primary"></i></span>
                                    <input type="password" name="password" class="form-control bg-light border-start-0" placeholder="••••••••" required>
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary w-100 py-2 shadow-sm fw-bold">
                                Sign In <i class="fas fa-arrow-right ms-2"></i>
                            </button>
                            
                        </form>
                        
                        <div class="mt-4 text-center">
                            <small class="text-muted">&copy; 2026 Student Analytics System</small>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>