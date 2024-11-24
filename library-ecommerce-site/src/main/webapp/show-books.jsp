<%@page import="java.util.Base64"%>
<%@page import="java.util.List"%>
<%@page import="book_nest.dto.Book"%>
<%@page import="book_nest.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Information Table</title>
    <link rel="stylesheet" href="./css/show-books.css">
    <link rel="stylesheet" href="./css/header-footer.css">
</head>
<body>
<%
	BookDao bookDao = new BookDao();
	List <Book> books = bookDao.fetchBook();
%>
    <header>
        <img class="logo-main" src="./image/logo_main.png">
        <div class="heading"><h1>Welcome to BookNest Amendment Section</h1>
            <p>Edit and Delete the list of books here</p></div>
    </header>
    <div class="tbl-container">
    <table class="book-table">
        <thead>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Description</th>
                <th>Edition</th>
                <th>Image</th>
                <th>ISBN</th>
                <th>Pages</th>
                <th>Publisher</th>
                <th>Author</th>
                <th>Genre</th>
                <th style="text-align: center;" colspan="2">Action</th>
            </tr>
        </thead>
        <tbody>
        <%
        for(Book book : books) {
        	
        	String base64Image = Base64.getEncoder().encodeToString(book.getImage());
        %>
            <tr>
                <td><%= book.getId() %></td>
                <td><%= book.getName() %></td>
                <td class="truncate-text" onclick="toggleText(this)"><%= book.getDescription() %></td>
                <td><%= book.getEdition() %></td>
                <td><img class="pic" src="data:image/jpeg;base64,<%= base64Image %>" alt="Book Image"/></td>
                <td><%= book.getIsbn() %></td>
                <td><%= book.getPages() %></td>
                <td><%= book.getPublisher() %></td>
                <td><%= book.getAuthor().getName() %></td>
                <td><%= book.getAuthor().getGenre().getList() %></td>
                <td><button>Edit</button></td>
                <td><button>Delete</button></td>
            </tr>
            <%} %>
        </tbody>
    </table>
</div>
	<script src="./js/script.js"></script>
</body>
</html>
