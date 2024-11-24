package book_nest.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.UUID;

import book_nest.dao.BookPurchaseDao;
import book_nest.dto.Book;
import book_nest.dto.Customer;
import book_nest.dto.Purchase;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/bookPurchase")
public class BookPurchaseController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int bookId = Integer.parseInt(req.getParameter("book_id"));
        double price = Double.parseDouble(req.getParameter("price"));
        String paymentId = UUID.randomUUID().toString();
        String bookName = req.getParameter("name");
        int customerId = Integer.parseInt(req.getParameter("customer_id"));
        LocalDateTime localTime = LocalDateTime.now();

        BookPurchaseDao bookPurchaseDao = new BookPurchaseDao();

        Customer customer = bookPurchaseDao.getCustomerById(customerId);
        Book book = bookPurchaseDao.getBookById(bookId);

        Purchase purchase = new Purchase(bookName, price, paymentId, localTime, customer, book);

        bookPurchaseDao.buyBook(purchase);

        req.setAttribute("purchase", purchase);

        req.getRequestDispatcher("/deliver.jsp").forward(req, resp);
    }
}
