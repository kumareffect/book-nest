package book_nest.dao;

import java.util.List;

import book_nest.dto.Admin;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;

public class AdminDao {
    EntityManagerFactory emf = Persistence.createEntityManagerFactory("hibernate");
    EntityManager em = emf.createEntityManager();
    EntityTransaction et = em.getTransaction();
    
    public void createAdmin(Admin admin) {
        et.begin();
        em.persist(admin);
        et.commit();
    }
    
    public List<Admin> displayAdmin() {
        return em.createQuery("from Admin", Admin.class).getResultList();
    }
    
    public Admin fetchAdminByUsernameAndPassword(String username, String password) {
        List<Admin> result = em.createQuery("SELECT a FROM Admin a WHERE a.name = :username AND a.password = :password", Admin.class)
                                .setParameter("username", username)
                                .setParameter("password", password)
                                .getResultList();
        
        if (result.isEmpty()) {
            return null;  
        } else {
            return result.get(0); 
        }
    }
}
