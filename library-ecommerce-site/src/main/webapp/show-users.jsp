<%@page import="java.util.Base64"%>
<%@page import="book_nest.dto.Customer"%>
<%@page import="java.util.List"%>
<%@page import="book_nest.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Information Table</title>
    <link rel="stylesheet" href="./css/show-users.css">
    <link rel="stylesheet" href="./css/header-footer.css">
</head>
<body>

<% 
	UserDao userDao = new UserDao();
	List<Customer> customers = userDao.fetchUser();
%>

    <header>
        <img class="logo-main" src="./image/logo_main.png">
        <div class="heading"><h1>Welcome to User Amendment Section</h1>
            <p>Edit and Delete the list of Users from here</p></div>
    </header>

   <div class="tbl-container">
    <table class="user-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Image</th>
                <th>Email</th>
                <th>Password</th>
                <th>Mobile</th>
                <th>Date of Birth</th>
                <th>Address</th>
                <th>Gender</th>
                <th>Creation Time</th>
                <th style="text-align: center;" colspan="2">Action</th>
            </tr>
        </thead>
        <tbody>
        <%
        for(Customer customer : customers) {
        	String base64Image = Base64.getEncoder().encodeToString(customer.getImage());
        %>
            <tr>
                <td><%= customer.getId() %></td>
                <td><%= customer.getName() %></td>
                <td><img class="pic" src="data:image/jpeg;base64,<%= base64Image %>" alt="Customer Image"/></td>
                <td><%= customer.getEmail() %></td>
                <td><%= customer.getPassword()  %></td> 
                <td><%= customer.getMobile()  %></td>
                <td><%= customer.getDob()  %></td>
                <td><%= customer.getAddress() %></td>
                <td><%= customer.getGender() %></td>
                <td><%= customer.getCreation_time() %></td>
                <td><button>Edit</button></td>
                <td><button>Delete</button></td>
            </tr>
            <% }%>
        </tbody>
    </table>
   </div>
</body>
</html>
