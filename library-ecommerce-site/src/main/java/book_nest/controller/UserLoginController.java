package book_nest.controller;

import java.io.IOException;
import java.util.List;

import book_nest.dao.AdminDao;
import book_nest.dao.UserDao;
import book_nest.dto.Admin;
import book_nest.dto.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/userLogin")
public class UserLoginController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        UserDao userDao = new UserDao();
        Customer customer = null;

        try {
            customer = userDao.fetchUserByUsernameAndPassword(username, password);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (customer != null) {
            session.setAttribute("loginUser", customer); 
            resp.sendRedirect("index.jsp");
        } else {
            req.setAttribute("msg", "User or Password is wrong!!!");
            req.getRequestDispatcher("user-login.jsp").include(req, resp);
        }
    }
}
