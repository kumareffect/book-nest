package book_nest.dao;

import java.util.List;

import book_nest.dto.Author;
import book_nest.dto.BookRating;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;

public class BookRatingDao {
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("hibernate");
	EntityManager em = emf.createEntityManager();
	EntityTransaction et = em.getTransaction();
	
	public BookRating fetcBookRating(int id) {
		return em.find(BookRating.class, id);
	}
}
