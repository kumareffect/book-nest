<%@page import="book_nest.dto.Customer"%>
<%@page import="java.util.Base64"%>
<%@page import="book_nest.dto.Book"%>
<%@page import="java.util.List"%>
<%@page import="book_nest.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library System</title>
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/glow.css">
</head>
<body>

<%
    Customer loginUser = (Customer) session.getAttribute("loginUser");

%>

<% if (loginUser != null) { %>
           
        
        
        
    <header>
        <img class="logo-main" src="./image/logo_main.png">
        <div class="heading"><h1><span class="container">
  Welcome <span class="rainbow-text">  <%=  loginUser.getName() %>!</span>
</span>  to BookNest Library 
        <button onclick="location.href='userLogout'" class="logout">Logout</button></h1>
            <p>Your gateway to endless knowledge and entertainment</p></div>
            
    </header>
    
    <% } else { %>
            <div class="head">Welcome, Guest! Please <a class="log" href="user-login.jsp">log in</a> to access more features like rating, comment and other cool stuff.</div>
        <% } %>

<section id="search">
    <h2>Find Your Next Book</h2>
    <form id="search-form">
        <input type="text" name="query" id="search-input" autocomplete="off" placeholder="Search by book name" oninput="fetchSuggestions(this.value)">
        <input type="hidden" name="id" id="book-id">
        <button type="button" onclick="searchBook()">Search</button> 
        <div class="cent">
            <div id="suggestions" class="suggestions" ></div>
        </div>
    </form>
</section>



   
    <section id="genres">
        <h2>Explore by Genre</h2>
        <div class="genre-list">
            <a href="genre.jsp?id=1">Fiction</a>
            <a href="genre.jsp?id=2">Non-Fiction</a>
            <a href="genre.jsp?id=3">Science</a>
            <a href="genre.jsp?id=4">History</a>
            <a href="genre.jsp?id=5">Biography</a>
        </div>
    </section>

    <section id="featured">
        <h2>Featured Books</h2>
        
   <%
	BookDao bookDao = new BookDao();
	List <Book> books = bookDao.fetchFeatured();
	
	for(Book book : books) {
    	
    	String base64Image = Base64.getEncoder().encodeToString(book.getImage());
%>
        <div class="book">
            <img class="pic" src="data:image/jpeg;base64,<%= base64Image %>" alt="Book Image"/>
            <h3 class="truncate-text" onclick="toggleTexts(this)"><%= book.getName() %></h3>
            <p><%= book.getAuthor().getName() %></p>
            <a href="book.jsp?id=<%= book.getId() %>" class="btn">Learn More</a>
            <span>₹<%= book.getPrice() %></span>
        </div>
        
        <%} %>
       
    </section>

    <section id="user-access">
        <h2>Account Access</h2>
        <a href="admin-login.jsp" class="btn">Admin Login</a>
        <a href="user-login.jsp" class="btn">User Login</a>
    </section>

    <footer>
        <p>Contact Us: booknest@effect.com | (91) 98219-04395</p>
        <p>Opening Hours: Mon-Fri, 9 AM - 5 PM</p>
    </footer>
    
    <script src="./js/script.js"></script>
</body>
</html>
