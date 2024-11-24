package book_nest.controller;

import java.io.IOException;

import book_nest.dao.CustomerDao;
import book_nest.dto.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/passwordChange")
public class ChangePassword extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		String password = req.getParameter("password");
		
		CustomerDao customerDao = new CustomerDao();
		
		customerDao.changePassword(id, password);

		req.getRequestDispatcher("successPage.jsp").forward(req, resp);
	}
}
