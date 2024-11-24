package book_nest.dto;

import java.time.LocalDateTime;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Purchase {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    private String book_name;
    private double amount;
    private String paymentId;
    private LocalDateTime time;

    @ManyToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "customer_id")
    private Customer customer;

    @ManyToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "book_id")
    private Book book; 

	public Purchase(String book_name, double amount, String paymentId, LocalDateTime time, Customer customer,
			Book book) {
		super();
		this.book_name = book_name;
		this.amount = amount;
		this.paymentId = paymentId;
		this.time = time;
		this.customer = customer;
		this.book = book;
	}

    
}
