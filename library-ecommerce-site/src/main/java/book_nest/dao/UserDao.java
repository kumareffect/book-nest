package book_nest.dao;


import book_nest.dto.Customer;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import java.util.List;


import jakarta.persistence.*;

public class UserDao {
    private EntityManagerFactory emf;
    private EntityManager em;

    public UserDao() {
        emf = Persistence.createEntityManagerFactory("hibernate");
        em = emf.createEntityManager();
    }

    public void addUser(Customer customer) {
        EntityTransaction et = em.getTransaction();
        et.begin();
        em.persist(customer);
        et.commit();
    }

    public List<Customer> fetchUser() {
        return em.createQuery("from Customer", Customer.class).getResultList();
    }

    public Customer fetchUserByUsernameAndPassword(String username, String password) {
        try {
            return em.createQuery("SELECT c FROM Customer c WHERE c.name = :username AND c.password = :password", Customer.class)
                    .setParameter("username", username)
                    .setParameter("password", password)
                    .getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }
}
