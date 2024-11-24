package book_nest.controller;

import java.io.IOException;
import java.util.List;

import book_nest.dao.AdminDao;
import book_nest.dto.Admin;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminLogin")
public class AdminLoginController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();

		String user = req.getParameter("username");
		String password = req.getParameter("password");

		AdminDao adminDao = new AdminDao();
		Admin admin = adminDao.fetchAdminByUsernameAndPassword(user, password);

		if (admin != null) {
			session.setAttribute("loginAdmin", admin);
			resp.sendRedirect("admin-welcome.jsp");
		} else {
			req.setAttribute("msg", "User or Password is wrong!!!");
			req.getRequestDispatcher("admin-login.jsp").include(req, resp);
		}
	}
}
