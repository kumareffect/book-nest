package book_nest.controller;

import java.io.IOException;

import book_nest.dto.Admin;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminLogout")
public class AdminLogout extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession httpSession = req.getSession();
		Admin user = (Admin) httpSession.getAttribute("loginAdmin");
		
		if(user != null) {
			httpSession.invalidate();
			req.setAttribute("msg", "Your are logout Successfully!!!");
			req.getRequestDispatcher("admin-login.jsp").include(req, resp);
		} else {
			req.setAttribute("msg", "Your session has expired. Please log in again.");
			req.getRequestDispatcher("admin-login.jsp").include(req, resp);
		}
	}
}
