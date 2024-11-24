package book_nest.dao;

import book_nest.dto.Customer;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;

public class CustomerDao {
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("hibernate");
	EntityManager em = emf.createEntityManager();
	EntityTransaction et = em.getTransaction();
	
	public Customer fetchCustomer(int id) {
		return em.find(Customer.class, id);
	}
	
	public void changePassword(int id, String password) {
		et.begin();
		
		Customer customer = em.find(Customer.class, id);
		
		if(customer != null) {
			customer.setPassword(password);
			em.merge(customer);
		}else {
            System.out.println("User not found with ID: " + id);
        }
		et.commit();
	}
}
