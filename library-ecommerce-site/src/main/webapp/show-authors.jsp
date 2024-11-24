<%@page import="java.util.Base64"%>
<%@page import="book_nest.dto.Author"%>
<%@page import="java.util.List"%>
<%@page import="book_nest.dao.AuthorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Author Information Table</title>
    <link rel="stylesheet" href="./css/show-authors.css">
    <link rel="stylesheet" href="./css/header-footer.css">
</head>
<body>

<% 
	AuthorDao authorDao = new AuthorDao();
	List<Author> authors = authorDao.fetchAuthor();
%>

    <header>
        <img class="logo-main" src="./image/logo_main.png">
        <div class="heading"><h1>Welcome to Author Amendment Section</h1>
            <p>Edit and Delete the list of authors from here</p></div>
    </header>

   <div class="tbl-container">
    <table class="user-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Image</th>
                <th>Description</th>
                <th>Genre</th>
                <th style="text-align: center;" colspan="2">Action</th>
            </tr>
        </thead>
        <tbody>
        <%
        for(Author author : authors) {
        	String base64Image = Base64.getEncoder().encodeToString(author.getImage());
        %>
            <tr>
                <td><%= author.getId() %></td>
                <td><%= author.getName() %></td>
                <td><img class="pic" src="data:image/jpeg;base64,<%= base64Image %>" alt="Author Image"/></td>
                <td><%= author.getDescription() %></td>
                <td><%= author.getGenre().getList() %></td> 
                <td><button>Edit</button></td>
                <td><button>Delete</button></td>
            </tr>
            <%} %>
        </tbody>
    </table>
   </div>
</body>
</html>
