<%@ page import="model.Admin, dao.AdminDAO" %>
<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <style>
        body { font-family: Arial; text-align: center; padding-top: 80px; background: #f0f2f5; }
        form { display: inline-block; padding: 20px; background: white; border-radius: 8px; box-shadow: 0 0 10px #ccc; }
        input { margin: 5px 0; padding: 8px; width: 200px; }
        input[type=submit] { background: #007bff; color: white; border: none; cursor: pointer; }
        input[type=submit]:hover { background: #0056b3; }
        span { color: red; }
    </style>
</head>
<body>

    <h2>Admin Login</h2>
    <form method="post" action="LoginServlet">
        <input type="email" name="email" placeholder="Email" required /><br/>
        <input type="password" name="password" placeholder="Password" required /><br/>
        <input type="submit" value="Login" /><br/>
        <span>${msg}</span>
    </form>
</body>
</html>