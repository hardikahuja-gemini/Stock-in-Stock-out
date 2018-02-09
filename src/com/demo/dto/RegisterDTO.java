package com.demo.dto;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.sun.xml.internal.bind.v2.runtime.output.StAXExStreamWriterOutput;

// Generated May 30, 2009 6:49:31 AM by Hibernate Tools 3.2.4.GA

/**
 * This class contains the course details.
 * 
 */
public class RegisterDTO {

	private long id;
	private String firstName;
	private String lastName;
	private String address;
	private String contact;
	private String email;
	private String password;
	private String type;
	
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public RegisterDTO() {
	}

	public RegisterDTO(HttpServletRequest request,boolean update) {
		System.out.println(update);
		if(!update)
			id =new Date().getTime()/1000;
		else{
			System.out.println("hello " +request.getParameter("id"));
			id = Long.parseLong(request.getParameter("id"));
			
		}
		firstName=request.getParameter("firstName");
		System.out.println(firstName);
		lastName=request.getParameter("lastName");
		address=request.getParameter("address");
		email=request.getParameter("email");
		contact=request.getParameter("contact");
		type = request.getParameter("userType");
		password=request.getParameter("password");
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
