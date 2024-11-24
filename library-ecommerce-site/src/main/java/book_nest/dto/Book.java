package book_nest.dto;

import java.util.Arrays;
import java.util.List;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Book {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	@Lob
	@Column(columnDefinition = "LONGBLOB")
	private byte[] image;
	private String publisher;
	private int edition;
	private int pages;
	private double price;
	private long isbn;
	@Column(columnDefinition = "TEXT")
	private String description;

	@OneToMany(mappedBy = "book")
	private List<BookRating> ratings;

	@ManyToOne
	@JoinColumn(name = "author_id")
	private Author author;

	@ManyToMany
	@JoinTable(name = "book_customer", 
			joinColumns = @JoinColumn(name = "book_id"),
			inverseJoinColumns = @JoinColumn(name = "customer_id") 
	)
	private List<Customer> customers;

	public Book(String name, byte[] image, String publisher, int edition, int pages, double price, long isbn,
			String description, List<BookRating> ratings, Author author, List<Customer> customers) {
		super();
		this.name = name;
		this.image = image;
		this.publisher = publisher;
		this.edition = edition;
		this.pages = pages;
		this.price = price;
		this.isbn = isbn;
		this.description = description;
		this.ratings = ratings;
		this.author = author;
		this.customers = customers;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public int getEdition() {
		return edition;
	}

	public void setEdition(int edition) {
		this.edition = edition;
	}

	public int getPages() {
		return pages;
	}

	public void setPages(int pages) {
		this.pages = pages;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public long getIsbn() {
		return isbn;
	}

	public void setIsbn(long isbn) {
		this.isbn = isbn;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<BookRating> getRatings() {
		return ratings;
	}

	public void setRatings(List<BookRating> ratings) {
		this.ratings = ratings;
	}

	public Author getAuthor() {
		return author;
	}

	public void setAuthor(Author author) {
		this.author = author;
	}

	public List<Customer> getCustomers() {
		return customers;
	}

	public void setCustomers(List<Customer> customers) {
		this.customers = customers;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + Arrays.hashCode(image);
		result = prime * result + Objects.hash(author, customers, description, edition, id, isbn, name, pages, price,
				publisher, ratings);
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Book other = (Book) obj;
		return Objects.equals(author, other.author) && Objects.equals(customers, other.customers)
				&& Objects.equals(description, other.description) && edition == other.edition && id == other.id
				&& Arrays.equals(image, other.image) && isbn == other.isbn && Objects.equals(name, other.name)
				&& pages == other.pages && Double.doubleToLongBits(price) == Double.doubleToLongBits(other.price)
				&& Objects.equals(publisher, other.publisher) && Objects.equals(ratings, other.ratings);
	}

	
	
}
