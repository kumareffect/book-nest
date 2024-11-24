<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add a New Author</title>
    <link rel="stylesheet" href="./css/new-author.css">
</head>
<body>

<div class="container">
    <h2>Add a New Author</h2>
    <form action="addAuthor" method="POST" enctype="multipart/form-data">
        
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required />
        </div>

        <div class="form-group">
            <label for="image">Image:</label>
            <input type="file" id="image" name="image" accept="image/*" required />
        </div>

        <div class="form-group">
            <label for="description">Description:</label>
            <textarea id="description" name="description" required></textarea>
        </div>
        
        <div class="form-group">
            <label for="genre_id">Genre ID:</label>
            <input type="text" id="genre_id" name="genre_id" required />
        </div>

        <button type="submit">Add Author</button>
    </form>
</div>

</body>
</html>
