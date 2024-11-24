<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Information Form</title>
    <link rel="stylesheet" href="css/new-book.css">
</head>
<body>
    <div class="form-container">
        <h2>Enter Book Information</h2>
        <form action="addBook" method="POST" enctype="multipart/form-data">

            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>

            <label for="description">Description:</label>
            <textarea id="description" name="description" rows="3" required></textarea>

            <label for="edition">Edition:</label>
            <input type="text" id="edition" name="edition" required>

            <label class="for-image" for="image">Upload Image:</label>
            <input type="file" id="image" name="image" accept="image/*" required>
            <br><br>
            <label for="isbn">ISBN:</label>
            <input type="text" id="isbn" name="isbn" required>

            <label for="pages">Pages:</label>
            <input type="number" id="pages" name="pages" required>
            
             <label for="price">Price:</label>
            <input type="number" id="price" name="price" required>

            <label for="publisher">Publisher:</label>
            <input type="text" id="publisher" name="publisher" required>

            <label for="author_id">Author ID (Foreign Key):</label>
            <input type="number" id="author_id" name="author_id" required>

            <button type="submit">Submit</button>
        </form>
    </div>
</body>
</html>
