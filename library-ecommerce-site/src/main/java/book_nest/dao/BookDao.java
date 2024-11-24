package book_nest.dao;

import java.util.List;

import book_nest.dto.Book;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;

public class BookDao {
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("hibernate");
	EntityManager em = emf.createEntityManager();
	EntityTransaction et = em.getTransaction();
	
	public void insertBook(Book book) {
		et.begin();
		em.persist(book);
		et.commit();
	}
	
	public List<Book> fetchBook() {
		return em.createQuery("from Book").getResultList();
	}
	
	public List<Book> fetchFeatured() {
		return em.createQuery("FROM Book b ORDER BY b.id DESC").setMaxResults(4).getResultList();
	}
	
	public Book fetchById(int id) {
		return em.find(Book.class, id);
	}
	
	public List<Book> fetchByGenreId(int genreId) {
	    return em.createQuery("SELECT b FROM Book b WHERE b.author.genre.id = :genreId", Book.class)
	             .setParameter("genreId", genreId)
	             .getResultList();
	}
	

	public List<Book> searchBooks(String query) {

	    TypedQuery<Book> typedQuery = em.createQuery(
	        "SELECT b FROM Book b WHERE b.name LIKE :query", Book.class);
	    typedQuery.setParameter("query", query + "%");
	    
	    return typedQuery.getResultList();  
	}

}
