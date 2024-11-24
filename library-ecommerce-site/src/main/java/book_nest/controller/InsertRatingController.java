package book_nest.controller;

import java.io.IOException;
import java.time.LocalDateTime;

import book_nest.dao.BookDao;
import book_nest.dao.CustomerDao;
import book_nest.dao.RatingCommentDao;
import book_nest.dto.Book;
import book_nest.dto.BookRating;
import book_nest.dto.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ratingComment")
@MultipartConfig 
public class InsertRatingController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String comment = req.getParameter("comment");
		int rating = Integer.parseInt(req.getParameter("ratingValue"));
		LocalDateTime date = LocalDateTime.now();
		int customerId = Integer.parseInt(req.getParameter("customer_id"));
		int bookId = Integer.parseInt(req.getParameter("book_id"));
		
		CustomerDao customerDao = new CustomerDao();
		
		Customer customer = customerDao.fetchCustomer(customerId);
		
		BookDao bookDao = new BookDao();
		Book book = bookDao.fetchById(bookId);
		
		BookRating bookRating = new BookRating(rating, comment, date, book, customer);
		
		RatingCommentDao ratingComment = new RatingCommentDao();
		ratingComment.insertRatingComment(bookRating);
		
		resp.sendRedirect(req.getHeader("Referer"));
	}
}
