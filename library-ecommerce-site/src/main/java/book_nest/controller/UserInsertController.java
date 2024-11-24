package book_nest.controller;

import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;
import java.time.LocalDateTime;

import book_nest.dao.UserDao;
import book_nest.dto.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/addUser")
@MultipartConfig 
public class UserInsertController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Part filePart = req.getPart("image");
        InputStream fileContent = filePart.getInputStream();
		
		String name = req.getParameter("name");
		byte[] imageBytes = fileContent.readAllBytes();
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		long mobile = Long.parseLong(req.getParameter("mobile"));
		LocalDate dob = LocalDate.parse(req.getParameter("dob"));
		LocalDateTime creationTime = LocalDateTime.now();
		String address = req.getParameter("address");
		String gender = req.getParameter("gender");
		
		Customer customer = new Customer(name, imageBytes, email, password, mobile, dob, address, gender, creationTime, null, null, null);
		UserDao userDao = new UserDao();
		userDao.addUser(customer);
		
		resp.sendRedirect("successPage.jsp");
	}
}
