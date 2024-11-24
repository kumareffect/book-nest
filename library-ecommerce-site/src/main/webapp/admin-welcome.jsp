<%@page import="java.util.Base64"%>
<%@page import="java.util.List"%>
<%@page import="book_nest.dao.AdminDao"%>
<%@page import="book_nest.dto.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Genre - Fiction</title>
    <link rel="stylesheet" href="./css/admin-welcome.css">
</head>
<body>
    <header>
        <img class="logo-main" src="./image/logo_main.png">
        <div class="heading"><h1>Welcome To Admin Dashboard</h1>
            <p>Be ready to perform some adjustment</p>
            <ul>
                <li><button class="mnguser">User Manage</button>
                <ul>
                <li><button onclick="location.href='./new-user.jsp'" class="mnuser">Add New User</button></li>
                <li><button onclick="location.href='./show-users.jsp'" class="mnuser">Show All Users</button></li>
                </ul>
            </li>
            </ul>
            <ul>
                <li><button class="mngbook">Book Manage</button>
                <ul>
                <li><button onclick="location.href='./new-genre.jsp'" class="mnuser">Add New Genre</button></li>
                <li><button onclick="location.href='./new-author.jsp'" class="mnuser">Add New Author</button></li>
                <li><button onclick="location.href='./show-authors.jsp'" class="mnuser">Show All Author</button></li>
                <li><button onclick="location.href='./new-book.jsp'" class="mnbook">Add New Book</button></li>
                <li><button onclick="location.href='./show-books.jsp'" class="mnbook">Show All Books</button></li>
                </ul>
            </li>
            </ul>
        </div>
            
    </header>
<main>
<% 
	Admin admin1 = new Admin();
	AdminDao adminDao = new AdminDao();
	List <Admin> admins = adminDao.displayAdmin();
	for(Admin admin : admins) {
		
		String base64Image = Base64.getEncoder().encodeToString(admin.getImage());

	%>
    <div class="info">
        <div class="cent">
        <div class="profile">
            <img class="pic" src="data:image/jpeg;base64,<%= base64Image %>" alt="Admin Image"/>
        </div>
        </div>
        <div class="table">
        <table>
        <tr>
        <td>
        <span class="left">Admin Id: </span>
        <td>
        <span class="right">ㅤ<%= admin.getId() %></span>
    	</td>
		</tr>
		
		<tr>
        <td>
        <span class="left">Admin Name: </span>
        <td>
        <span class="right">ㅤ<%= admin.getName() %></span>
    	</td>
		</tr>
		
		<tr>
        <td>
   		<span class="left">Admin Email: </span>
        <td>
         <span class="right">ㅤ<%= admin.getEmail() %></span>
    	</td>
		</tr>
		
		<tr>
        <td>
        <span class="left">Admin Gender: </span>
        <td>
        <span class="right">ㅤ<%= admin.getGender() %></span>
    	</td>
		</tr>
		
		<tr>
        <td>
        <span class="left">Admin Creation: </span>
        <td>
        <span class="right">‎‎‎ㅤ<%= admin.getCreation_time() %></span>
    	</td>
		</tr>
		
        </table>
        </div>
         <div class="cent">
        <button onclick="location.href='adminLogout'" class="logout">Logout</button>
        </div>
    </div>
</main>
	<%
	}
	%>
    <footer>
        <p>Contact Us: booknest@effect.com | (91) 98219-04395</p>
        <p>Opening Hours: Mon-Fri, 9 AM - 5 PM</p>
    </footer>
</body>
</html>