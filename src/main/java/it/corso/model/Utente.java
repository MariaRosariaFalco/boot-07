package it.corso.model;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.Pattern;

public class Utente {
	
	@Pattern(regexp="[a-zA-Z\\s']{1,50}", message="Caratteri non ammessi")
	private String nome;
	
	@Min(value=1, message="Valore troppo basso")
	@Max(value=120, message= "Valore troppo alto")
	private int eta;
	
	@Pattern(regexp="[a-zAZ.]{1,20}", message="Username non valido")
	private String username;
	
	@Pattern(regexp="(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{6,20}", message="Password troppo debole") //dice che deve avere almeno un numero, almeno una minuscola, almeno una lettera maiuscola, nel range delle quadre, con minimo sei caratteri e massimo 20
	private String password;
	
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public int getEta() {
		return eta;
	}
	public void setEta(int eta) {
		this.eta = eta;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	

}
