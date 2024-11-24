package book_nest.dto;

import java.time.LocalDateTime;

import org.hibernate.annotations.Type;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Admin {
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
	private String gender;
	private LocalDateTime creation_time;
	
	
	public Admin(String name, byte[] image, String email, String password, String gender, LocalDateTime creation_time) {
		super();
		this.name = name;
		this.image = image;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.creation_time = creation_time;
	}
	
}


