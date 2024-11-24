package book_nest.dao;

import book_nest.dto.Genre;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;

public class GenreDao {
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("hibernate");
	EntityManager em = emf.createEntityManager();
	EntityTransaction et = em.getTransaction();
	
	public void insertGenre(Genre genre) {
		et.begin();
		em.persist(genre);
		et.commit();
	}
	
	
	public Genre fetchGenre(int id) {
	    return em.find(Genre.class, id);
	}
}
