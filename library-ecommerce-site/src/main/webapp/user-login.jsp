<%@page import="book_nest.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>

<%
    Customer loginUser = (Customer) session.getAttribute("loginUser");
    if (loginUser != null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

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
      <h2>User Login</h2>
      <form action="userLogin" method="post">
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <button type="submit">Login</button>
        <a href="./find-user.jsp" class="forgot-password">Forgot Password?</a>
        <span>New Here? </span><span class="new" onclick="location.href='new-user.jsp'">Create an account now!!!</span>
      </form>
    </div>
  </div>

</body>
</html>
