<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored = "false"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login Form</title>
    <link rel="stylesheet" href="./css/user-login.css">
</head>
<body>
<h3>${msg}</h3>
  
  <div class="admin-form">
  <div class="login-container">
    <h2>Find User</h2>
    <form action="findUser" method="post">
      <input type="text" name="id" placeholder="Your Id No." required>
      <button type="submit">Find</button>
    </form>
  </div>
  </div>

</body>
</html>
