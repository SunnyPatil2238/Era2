package com.example.Era.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name="User")
public class User {

	@Id
	private String userName;
	
	private String password;
	
	private String verify;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getVerify() {
		return verify;
	}

	public void setVerify(String verify) {
		this.verify = verify;
	}
	
	
}
