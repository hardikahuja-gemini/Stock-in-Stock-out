package com.demo.dto;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

public class PurchaseDTO {
private long id;
private String modelnumber;
private String price;
private String quantity;

public PurchaseDTO(){
	
}
public PurchaseDTO(HttpServletRequest request) {
id=Long.parseLong(request.getParameter("id"));
	modelnumber=request.getParameter("modelnumber");
	//System.out.println(firstName);
	price=request.getParameter("price");
	quantity=request.getParameter("quantity");

	
}

public String getQuantity() {
	return quantity;
}
public void setQuantity(String quantity) {
	this.quantity = quantity;
}
public long getId() {
	return id;
}
public void setId(long id) {
	this.id = id;
}
public String getModelnumber() {
	return modelnumber;
}
public void setModelnumber(String modelnumber) {
	this.modelnumber = modelnumber;
}
public String getPrice() {
	return price;
}
public void setPrice(String price) {
	this.price = price;
}
}
