<%@page import="book_nest.dto.BookRating"%>
<%@page import="book_nest.dao.RatingCommentDao"%>
<%@page import="book_nest.dto.Genre"%>
<%@page import="book_nest.dao.GenreDao"%>
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
    <title>Genre - Fiction</title>
    <link rel="stylesheet" href="./css/genre.css">
</head>
<body>
    <%

int id = Integer.parseInt(request.getParameter("id"));
GenreDao genreDao = new GenreDao();
Genre genre = genreDao.fetchGenre(id);



%>
    <header>
        <img class="logo-main" src="./image/logo_main.png">
        <div class="heading"><h1>Welcome to BookNest Library</h1>
            <p>Your gateway to endless knowledge and entertainment</p></div>
    </header>

    <section id="genre-title">
        <h2><%= genre.getList() %> Books</h2>
        <p>Browse through our collection of fiction books and immerse yourself in incredible stories and imaginative worlds.</p>
    </section>

    <section id="book-list">
<%
BookDao bookDao = new BookDao();
List <Book> books = bookDao.fetchByGenreId(id);

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

    <footer>
        <p>Contact Us: booknest@effect.com | (91) 98219-04395</p>
        <p>Opening Hours: Mon-Fri, 9 AM - 5 PM</p>
    </footer>
    
     <script src="./js/script.js"></script>
</body>
</html>
