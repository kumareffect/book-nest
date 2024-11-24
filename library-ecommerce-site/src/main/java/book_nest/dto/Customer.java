package book_nest.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Customer {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	 @Column(unique = true)
	private String name;
	@Lob
	@Column(columnDefinition="LONGBLOB")
	private byte[] image;
	private String email;
	private String password;
	private Long mobile;
	private LocalDate dob;
	private String address;
	private String gender;
	private LocalDateTime creation_time;
	
	
	@OneToMany(mappedBy="customer")
	private List<BookRating> bookRating;
	
	@OneToMany(mappedBy="customer")
	private List<Purchase> purchase;
	
	@ManyToMany(mappedBy = "customers")
	private List<Book> books;

	public Customer(String name, byte[] image, String email, String password, Long mobile, LocalDate dob,
			String address, String gender, LocalDateTime creation_time, List<BookRating> bookRating,
			List<Purchase> purchase, List<Book> books) {
		super();
		this.name = name;
		this.image = image;
		this.email = email;
		this.password = password;
		this.mobile = mobile;
		this.dob = dob;
		this.address = address;
		this.gender = gender;
		this.creation_time = creation_time;
		this.bookRating = bookRating;
		this.purchase = purchase;
		this.books = books;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Customer other = (Customer) obj;
		return Objects.equals(address, other.address) && Objects.equals(bookRating, other.bookRating)
				&& Objects.equals(books, other.books) && Objects.equals(creation_time, other.creation_time)
				&& Objects.equals(dob, other.dob) && Objects.equals(email, other.email)
				&& Objects.equals(gender, other.gender) && id == other.id && Arrays.equals(image, other.image)
				&& Objects.equals(mobile, other.mobile) && Objects.equals(name, other.name)
				&& Objects.equals(password, other.password) && Objects.equals(purchase, other.purchase);
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + Arrays.hashCode(image);
		result = prime * result + Objects.hash(address, bookRating, books, creation_time, dob, email, gender, id,
				mobile, name, password, purchase);
		return result;
	}

	
	
}
