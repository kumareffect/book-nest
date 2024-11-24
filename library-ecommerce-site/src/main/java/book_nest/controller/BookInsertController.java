package book_nest.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import book_nest.dao.AuthorDao;
import book_nest.dao.BookDao;
import book_nest.dto.Author;
import book_nest.dto.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/addBook")
@MultipartConfig 
public class BookInsertController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Part filePart = req.getPart("image");
			InputStream fileContent = filePart != null ? filePart.getInputStream() : null;
			byte[] imageBytes = fileContent != null ? fileContent.readAllBytes() : null;

			String bookName = req.getParameter("name");
			String bookDesc = req.getParameter("description");
			int bookEdition = Integer.parseInt(req.getParameter("edition"));
			long bookISBN = Long.parseLong(req.getParameter("isbn"));
			int bookPages = Integer.parseInt(req.getParameter("pages"));
			double bookPrice = Double.parseDouble(req.getParameter("price"));
			String bookPublisher = req.getParameter("publisher");
			int authorId = Integer.parseInt(req.getParameter("author_id"));

			AuthorDao authorDao = new AuthorDao();
			Author author = authorDao.fetchAuthor(authorId);

			if (author == null) {
				resp.sendRedirect("errorPage.jsp?error=Author not found");
				return;
			}

			Book book = new Book(bookName, imageBytes, bookPublisher, bookEdition, bookPages, bookPrice, bookISBN, bookDesc, null, author, new ArrayList<>());

			BookDao bookDao = new BookDao();
			bookDao.insertBook(book);

			resp.sendRedirect("successPage.jsp");

		} catch (NumberFormatException e) {
			resp.sendRedirect("errorPage.jsp?error=Invalid numeric input");
		} catch (Exception e) {
			resp.sendRedirect("errorPage.jsp?error=An error occurred while processing the request");
			e.printStackTrace();
		}
	}
}
