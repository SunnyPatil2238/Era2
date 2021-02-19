package com.example.Era.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity(name="customer")
public class Customer {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name ="CustId")
	private long CustId;
	
	@Column(name ="CustFirstName")
	private String CustFirstName;
	
	@Column(name ="CustLastName")
	private String CustLastName;
	
	@Column(name ="CustAddress1")
	private String CustAddress1;
	
	@Column(name ="CustAddress2")
	private String CustAddress2;
	
	@Column(name ="CustCity")
	private String CustCity;
	
	@Column(name ="CustTelephone")
	private String CustTelephone;
	
	@Column(name ="CustMail")
	private String CustMail;
	
	@Column(name ="CustBalance")
	private long CustBalance;

	public long getCustId() {
		return CustId;
	}

	public void setCustId(long custId) {
		CustId = custId;
	}

	public String getCustFirstName() {
		return CustFirstName;
	}

	public void setCustFirstName(String custFirstName) {
		CustFirstName = custFirstName;
	}

	public String getCustLastName() {
		return CustLastName;
	}

	public void setCustLastName(String custLastName) {
		CustLastName = custLastName;
	}

	public String getCustAddress1() {
		return CustAddress1;
	}

	public void setCustAddress1(String custAddress1) {
		CustAddress1 = custAddress1;
	}

	public String getCustAddress2() {
		return CustAddress2;
	}

	public void setCustAddress2(String custAddress2) {
		CustAddress2 = custAddress2;
	}

	public String getCustCity() {
		return CustCity;
	}

	public void setCustCity(String custCity) {
		CustCity = custCity;
	}

	public String getCustTelephone() {
		return CustTelephone;
	}

	public void setCustTelephone(String custTelephone) {
		CustTelephone = custTelephone;
	}

	public String getCustMail() {
		return CustMail;
	}

	public void setCustMail(String custMail) {
		CustMail = custMail;
	}

	public long getCustBalance() {
		return CustBalance;
	}

	public void setCustBalance(long custBalance) {
		CustBalance = custBalance;
	}

}
