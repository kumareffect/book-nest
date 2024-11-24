package book_nest.dao;

import java.util.List;

import book_nest.dto.Author;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;

public class AuthorDao {
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("hibernate");
	EntityManager em = emf.createEntityManager();
	EntityTransaction et = em.getTransaction();
	
	public void insertAuthor(Author author) {
		et.begin();
		em.persist(author);
		et.commit();
	}
	
	public List <Author> fetchAuthor() {
		return em.createQuery("from Author").getResultList();
	}
	
	public Author fetchAuthor(int id) {
		return em.find(Author.class, id);
	}
	
}
