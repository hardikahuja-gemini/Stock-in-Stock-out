package com.model;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

public class Student
{
private int id;
private String firstname;
private String lastname;
private String address;
private String email;
private String contact;
private String password;

public void setId(int id)
{
	this.id=id;
}

public int getId()
{
	return id;
}

public void setFirstname(String firstname)
{
	this.firstname=firstname;
}
	
public String getFirstname()
{
	return firstname;
}
	
public void setLasttname(String lastname)
{
	this.lastname=lastname;
}
	
public String getLasttname()
{
	return lastname;
}
	
	
public void setContact(String contact)
{
	this.contact=contact;
}
	
public String getContact()
{
	return contact;
}
	
public void setEmail(String email)
{
	this.email=email;
}
	
public String getEmail()
{
	return email;
}
	

public Student(HttpServletRequest request)
{
	id=(int) (new Date().getTime()/1000);
	firstname=request.getParameter("firstName");
	lastname=request.getParameter("lastName");
	address=request.getParameter("address");
	email=request.getParameter("email");
	contact=request.getParameter("contact");
	password= request.getParameter("password");
}

public Student() {
	// TODO Auto-generated constructor stub
}

public String getAddress() {
	return address;
}

public void setAddress(String address) {
	this.address = address;
}

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}

}