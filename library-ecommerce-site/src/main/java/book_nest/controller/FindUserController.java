package book_nest.controller;

import java.io.IOException;
import book_nest.dao.FindUserDao;
import book_nest.dto.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/findUser")
public class FindUserController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));

        FindUserDao findUserDao = new FindUserDao();
        Customer customer = findUserDao.findCustomer(id); 

        
        if (customer != null) {
            
            resp.sendRedirect("reset-password.jsp?id=" + id);
        } else {
     
            req.setAttribute("msg", "No user found with the provided ID.");
            req.getRequestDispatcher("/find-user.jsp").forward(req, resp);
        }
    }
}
