package book_nest.dao;

import book_nest.dto.Book;
import book_nest.dto.Customer;
import book_nest.dto.Purchase;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;

public class BookPurchaseDao {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("hibernate");
    EntityManager em = emf.createEntityManager();
    EntityTransaction et = em.getTransaction();
    
    public void buyBook(Purchase purchase) {
        if (purchase == null) {
            throw new IllegalArgumentException("Purchase entity cannot be null");
        }
        
        try {
            et.begin();
            em.persist(purchase); 

            int bookId = purchase.getBook().getId();
            int customerId = purchase.getCustomer().getId();
            
            String sql = "INSERT INTO book_customer (book_id, customer_id) VALUES (:bookId, :customerId)";
            Query query = em.createNativeQuery(sql);
            query.setParameter("bookId", bookId);
            query.setParameter("customerId", customerId);
            query.executeUpdate(); 

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback(); 
            }
            throw e;
        }
    }

    public Customer getCustomerById(int id) {
        return em.find(Customer.class, id);
    }

    public Book getBookById(int id) {
        return em.find(Book.class, id);
    }

    public Purchase getPurchaseById(int id) {
        return em.find(Purchase.class, id);  
    }
}
