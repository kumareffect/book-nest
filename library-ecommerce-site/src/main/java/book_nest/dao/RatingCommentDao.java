package book_nest.dao;

import java.util.List;

import org.hibernate.query.Query;

import book_nest.dto.BookRating;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;

public class RatingCommentDao {
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("hibernate");
	EntityManager em = emf.createEntityManager();
	EntityTransaction et = em.getTransaction();
	
	public void insertRatingComment(BookRating rating) {
		et.begin();
		em.persist(rating);
		et.commit();
	}
	
	public List<BookRating> fetchRatingComment(int id) {
	    return em.createQuery("SELECT b FROM BookRating b WHERE b.book.id = :bookId", BookRating.class)
	             .setParameter("bookId", id)
	             .getResultList();
	}


}
