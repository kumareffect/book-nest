package book_nest.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.LocalDateTime;

import book_nest.dao.AdminDao;
import book_nest.dto.Admin;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/defaultCreation")
public class AdminCreateController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		LocalDateTime dateCreated = LocalDateTime.now();

		byte[] imagehere = Files.readAllBytes(Paths.get("D:/kumargaurav.jpg"));
		
		Admin admin = new Admin("Kumar", imagehere, "kumar@gmail.com", "effect", "male", dateCreated);
		AdminDao adminDao = new AdminDao();
		adminDao.createAdmin(admin);
	}

}
