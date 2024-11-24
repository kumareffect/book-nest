<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored = "false"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login Form</title>
    <link rel="stylesheet" href="./css/admin-login.css">
</head>
<body>
<h3>${msg}</h3>
  
  <div class="admin-form">
  <div class="login-container">
    <h2>Admin Login</h2>
    <form action="adminLogin" method="post">
      <input type="text" name="username" placeholder="Username" required>
      <input type="password" name="password" placeholder="Password" required>
      <button type="submit">Login</button>
    </form>
  </div>
  </div>

</body>
</html>
