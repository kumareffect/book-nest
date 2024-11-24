package book_nest.controller;

import java.io.IOException;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import book_nest.dao.BookDao;
import book_nest.dto.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SearchSuggestions")
public class SearchSuggestionController extends HttpServlet {

    BookDao bookDAO;
    @Override
    public void init() throws ServletException {
        super.init();
        bookDAO = new BookDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("query");
        JSONArray jsonArray = new JSONArray();

        if (query != null && !query.trim().isEmpty()) {
            try {
                List<Book> books = bookDAO.searchBooks(query);

                for (Book book : books) {
                    JSONObject jsonObject = new JSONObject();
                    jsonObject.put("book_name", book.getName());
                    jsonObject.put("id", book.getId());
                    jsonArray.put(jsonObject);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        response.setContentType("application/json");
        response.getWriter().write(jsonArray.toString());
    }
}
