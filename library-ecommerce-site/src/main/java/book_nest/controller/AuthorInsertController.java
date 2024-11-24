package book_nest.controller;

import java.io.IOException;
import java.io.InputStream;

import book_nest.dao.AuthorDao;
import book_nest.dao.GenreDao;
import book_nest.dto.Author;
import book_nest.dto.Genre;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;


@WebServlet("/addAuthor")
@MultipartConfig 
public class AuthorInsertController extends HttpServlet {
    
   @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
       
        Part filePart = req.getPart("image");
        InputStream fileContent = filePart.getInputStream();
        byte[] imageBytes = fileContent.readAllBytes();

      
        String authorName = req.getParameter("name");
        String authorDesc = req.getParameter("description");

    
        int genreId = Integer.parseInt(req.getParameter("genre_id"));
        GenreDao genreDao = new GenreDao();
        Genre genre = genreDao.fetchGenre(genreId);
      
        Author author = new Author(authorName, imageBytes, authorDesc, null, genre);  

     
        AuthorDao authorDao = new AuthorDao();
        authorDao.insertAuthor(author);

    
        resp.sendRedirect("successPage.jsp");
    }
}
