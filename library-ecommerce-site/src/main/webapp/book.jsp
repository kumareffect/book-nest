<%@page import="book_nest.dto.Book"%>
<%@page import="book_nest.dto.BookRating"%>
<%@page import="book_nest.dao.RatingCommentDao"%>
<%@page import="book_nest.dao.BookDao"%>
<%@page import="book_nest.dto.Customer"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Base64"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Details</title>
<link rel="stylesheet" href="./css/book.css">
<link rel="stylesheet" href="./css/comment.css">
</head>
<body>
	<%
        Customer loginUser = (Customer) session.getAttribute("loginUser");
        int userId = (loginUser != null) ? loginUser.getId() : -1; 
    %>

	<%
        int id = Integer.parseInt(request.getParameter("id"));
        BookDao bookDao = new BookDao();
        Book books = bookDao.fetchById(id);
        String base64Image = Base64.getEncoder().encodeToString(books.getImage());
    %>

	<div class="book-detail-card">
		<div class="book-image">
			<img src="data:image/jpeg;base64,<%= base64Image %>" alt="Book Image" />
		</div>
		<div class="book-info">
			<h1 class="book-title"><%= books.getName() %></h1>
			<p>
				<strong>ID:</strong> <span><%= books.getId() %></span>
			</p>
			<p>
				<strong>Description:</strong> <span class="description"><%= books.getDescription() %></span>
			</p>
			<p>
				<strong>Edition:</strong> <span><%= books.getEdition() %></span>
			</p>
			<p>
				<strong>ISBN:</strong> <span><%= books.getIsbn() %></span>
			</p>
			<p>
				<strong>Pages:</strong> <span><%= books.getPages() %></span>
			</p>
			<p>
				<strong>Publisher:</strong> <span><%= books.getPublisher() %></span>
			</p>
			<p>
				<strong>Author:</strong> <span><%= books.getAuthor().getName() %></span>
			</p>
			<p>
				<strong>Price:</strong> <span>₹<%= books.getPrice() %></span>
			</p>

			<!-- Purchase Form -->
			<!-- Purchase Form -->
			<% if (loginUser != null) { %>
			<!-- Check if user is logged in -->
			<form action="bookPurchase" method="POST">
				<input type="hidden" name="book_id" value="<%= books.getId() %>">
				<input type="hidden" name="price" value="<%= books.getPrice() %>">
				<input type="hidden" name="name" value="<%= books.getName() %>">
				<input type="hidden" name="customer_id"
					value="<%= loginUser.getId() %>">
				<button type="submit" class="buy">Buy</button>
			</form>
			<% } else { %>
			<p>
				Please <a href="./user-login.jsp">log in</a> to purchase this book.
			</p>
			<% } %>


			<!-- Review Section -->
			<div class="book-reviews">
				<h2>Customer Reviews</h2>
				<%
                    RatingCommentDao ratingCommentDao = new RatingCommentDao();
                    List<BookRating> bookRatings = ratingCommentDao.fetchRatingComment(books.getId());
                    
                    if (bookRatings != null && !bookRatings.isEmpty()) {
                        for (BookRating rating : bookRatings) {
                            String base64CustomerImage = Base64.getEncoder().encodeToString(rating.getCustomer().getImage());
                %>
				<div class="review">
					<p>
						<strong>Customer Name:</strong>
						<%= rating.getCustomer().getName() %></p>
					<img class="profile"
						src="data:image/jpeg;base64,<%= base64CustomerImage %>"
						alt="Customer Image" />
					<p>
						<strong>Rating:</strong> <span class="star-ratings"> <%= "&#9733;".repeat(rating.getRating()) + "&#9734;".repeat(5 - rating.getRating()) %>
						</span>
					</p>
					<p>
						<strong>Comment:</strong>
						<%= rating.getComment() %></p>
				</div>
				<%
                        }
                    } else {
                %>
				<p>No reviews yet.</p>
				<%
                    }
                %>
			</div>

			<!-- Add Review Form for Logged-in Users -->
			<% if (loginUser != null) { %>
			<button class="rating">Give Rating and Reviews</button>
			<div id="fields" class="hidden-fields">
				<div class="star-rating">
					<% for (int i = 1; i <= 5; i++) { %>
					<span class="star" onclick="rateStars(<%= i %>)"
						onmouseover="hoverStars(<%= i %>)" onmouseout="resetHover()">☆</span>
					<% } %>
				</div>

				<form action="ratingComment" method="POST">
					<input type="hidden" id="ratingValue" name="ratingValue" value="0">
					<label for="message">Your Message:</label>
					<textarea id="message" name="comment" rows="6"
						placeholder="Type your message here..."></textarea>
					<input type="hidden" name="customer_id"
						value="<%= loginUser.getId() %>"> <input type="hidden"
						name="book_id" value="<%= books.getId() %>">
					<button class="submit" type="submit" onclick="submitRating()">Submit
						Rating</button>
				</form>
			</div>
			<% } else { %>
			<p>
				<a href="./user-login.jsp">Log in</a> to add reviews.
			</p>
			<% } %>
		</div>
	</div>

	<!-- External JavaScript -->
	<script src="./js/script.js"></script>
</body>
</html>
