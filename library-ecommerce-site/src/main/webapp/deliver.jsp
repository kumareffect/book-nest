<%@page import="java.util.Base64"%>
<%@page import="book_nest.dto.Purchase"%>
<%@page import="book_nest.dto.Customer"%>
<%@page import="book_nest.dto.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delivery Details</title>
<link rel="stylesheet" href="./css/delivery.css">
</head>
<body>
    <%
        // Retrieve the purchase object passed from the controller
        Purchase purchase = (Purchase) request.getAttribute("purchase");
        if (purchase != null) {
            Book book = purchase.getBook();
            Customer customer = purchase.getCustomer();
            String base64Book = Base64.getEncoder().encodeToString(book.getImage());
            String base64Customer = Base64.getEncoder().encodeToString(customer.getImage());
    %>
    <h1>Order Confirmation</h1>
    <p><strong>Payment ID:</strong> <%= purchase.getPaymentId() %></p>
    <p><strong>Book Name:</strong> <%= book.getName() %></p>
    <p><strong>Price:</strong> ₹<%= purchase.getAmount() %></p>
    <p><strong>Purchase Date:</strong> <%= purchase.getTime() %></p>
    <p><strong>Customer Name:</strong> <%= customer.getName() %></p>
    <p><strong>Delivery Address:</strong> <%= customer.getAddress() %></p>
    
    <a href="<%= request.getContextPath() %>/downloadPurchasePdf?purchase_id=<%= purchase.getId() %>">Download PDF</a>
    <%
        } else {
    %>
    <p>Sorry, no purchase details are available.</p>
    <%
        }
        
    %>
    
</body>
</html>
