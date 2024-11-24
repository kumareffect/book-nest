<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Information Form</title>
    <link rel="stylesheet" href="./css/new-user.css">
</head>
<body>
    <div class="form">
        <div class="form-container">
            <h2>Enter User Information</h2>
            <form action="addUser" method="POST" enctype="multipart/form-data">
    
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
    
                <label for="image">Upload Image:</label>
                <input type="file" id="image" name="image" accept="image/*" required>
    
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
    
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
    
                <label for="mobile">Mobile:</label>
                <input type="tel" id="mobile" name="mobile" pattern="[+0-9]{10,15}" required>
    
                <label for="dob">Date of Birth:</label>
                <input type="date" id="dob" name="dob" required>
    
                <label for="address">Address:</label>
                <textarea id="address" name="address" rows="2" required></textarea>
    
                <label for="gender">Gender:</label>
                <select id="gender" name="gender" required>
                    <option value="">Select</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
    
                <button type="submit">Submit</button>
            </form>
        </div>
    </div>
</body>
</html>
