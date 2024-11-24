package book_nest.controller;

import java.io.IOException;

import book_nest.dao.GenreDao;
import book_nest.dto.Genre;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/genre")
public class GenreInsertController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String genreType = req.getParameter("list");
		
		Genre genre = new Genre(genreType, null);
		
		GenreDao genreDao = new GenreDao();
		genreDao.insertGenre(genre);
		
		req.setAttribute("msg", "Genre added successfully!!!");
        req.getRequestDispatcher("new-genre.jsp").include(req, resp);
	}
}
