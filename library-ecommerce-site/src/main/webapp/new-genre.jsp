<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./css/new-genre.css">
</head>
<body>
<h3>${msg}</h3>
    <form action="genre" method="GET">
        <h2>Genre</h2>
      
        <label for="list">Genre</label>
        <select id="list" name="list">
          <option value="" disabled selected>Please select one</option>
          <option value="Fiction">Fiction</option>
          <option value="Non-Fiction">Non-Fiction</option>
          <option value="Science">Science</option>
          <option value="History">History</option>
          <option value="Biography">Biography</option>
        </select>
      
        <button type="submit">Submit</button>
      </form>
      
</body>
</html>