package com.demo.dto;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.mysql.jdbc.Blob;

public class RegisterProductsDTO {
		private long productId;
		private String productname;
		private String modelnumber;
		private String colour;
		private String price;
		private String stock;
		
		public RegisterProductsDTO()
		{
			}
		public RegisterProductsDTO(HttpServletRequest request,boolean update)
		{
			if(!update)
				productId =new Date().getTime()/1000;
			else{
				productId = Long.parseLong(request.getParameter("productId"));
				
			}
			//System.out.println("hello " +request.getParameter("id"));
//		productId = new Date().getTime()/1000;
			productname=request.getParameter("productname");
			modelnumber=request.getParameter("modelnumber");
			colour=request.getParameter("colour");
			price=request.getParameter("price");
			stock=request.getParameter("stock");
		}
		public String getProductname() {
			return productname;
		}
		public void setProductname(String productname) {
			this.productname = productname;
		}
		public String getModelnumber() {
			return modelnumber;
		}
		public void setModelnumber(String modelnumber) {
			this.modelnumber = modelnumber;
		}
		public String getColour() {
			return colour;
		}
		public void setColour(String colour) {
			this.colour = colour;
		}
		public String getPrice() {
			return price;
		}
		public void setPrice(String price) {
			this.price = price;
		}
		public long getProductId() {
			return productId;
		}
		public void setProductId(long productId) {
			this.productId = productId;
		}
		public String getStock() {
			return stock;
		}
		public void setStock(String stock) {
			this.stock = stock;
		}
		

	}


