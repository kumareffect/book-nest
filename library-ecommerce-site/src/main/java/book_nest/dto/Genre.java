package book_nest.dto;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Genre {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String list;
	
	@OneToMany(mappedBy="genre")
	private List<Author> author;

	public Genre(String list, List<Author> author) {
		super();
		this.list = list;
		this.author = author;
	}
	
	
}
