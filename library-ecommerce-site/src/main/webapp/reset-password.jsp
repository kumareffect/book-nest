<%@page import="book_nest.dto.Customer"%>
<%@page import="book_nest.dao.FindUserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>
    <link rel="stylesheet" href="./css/reset-password.css">
</head>
<body>
<%
	FindUserDao findUserDao = new FindUserDao();
	Customer customer = findUserDao.findCustomer(Integer.parseInt(request.getParameter("id")));
	
%>
    <div class="center">
        <form id="registrationForm" action="passwordChange" method="POST" onsubmit="return validateForm()">
            <h3>Password Reset For <span style="color: crimson"><%= customer.getName() %></span></h3>
            <br>
            <input type="hidden" name="id" value="<%= customer.getId() %>">
            <label for="password">Password:</label>
            <input type="text" id="password" name="password" value="<%= customer.getPassword() %>" required>
    
            <label for="confirmPassword">Confirm Password:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" <%= customer.getPassword() %> required oninput="checkPasswordMatch()">
            <span id="passwordError" class="error"></span>
    
            <button type="submit">Submit</button>
        </form>
    </div>
    <script src="./js/script.js"></script>
</body>
</html>
