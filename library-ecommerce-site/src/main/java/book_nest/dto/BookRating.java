package book_nest.dto;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
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
public class BookRating {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;
	private int rating;
	@Column(columnDefinition = "TEXT")
	private String comment;
	private LocalDateTime rating_time;

	@ManyToOne
	@JoinColumn(name = "book_id") 
	private Book book;

	@ManyToOne
	@JoinColumn(name = "customer_id")
	private Customer customer;

	public BookRating(int rating, String comment, LocalDateTime rating_time, Book book, Customer customer) {
		super();
		this.rating = rating;
		this.comment = comment;
		this.rating_time = rating_time;
		this.book = book;
		this.customer = customer;
	}

	

}
