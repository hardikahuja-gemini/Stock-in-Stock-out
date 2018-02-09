package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.demo.dto.RegisterDTO;
import com.demo.dto.RegisterProductsDTO;
import com.model.Model;

public class MyServletProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			int userAction = Integer.parseInt(request.getParameter("userAction"));
			switch (userAction) {
			case 0:
				saveData(request,response);
				break;
		    case 1:
				getData(request,response);
				break;
			case 2:
				getUpdateData(request,response);
				break;
			case 5:removeData(request,response);
			     break;
			default:
				break;
			}
			}catch(Exception e){
				response.sendRedirect("Error.jsp");
			}
		}

	

		private void getData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			List<RegisterProductsDTO> products = Model.getDataHibernateProducts();
			request.setAttribute("entity", products);
			request.setAttribute("firstName", request.getParameter("firstName"));
			request.setAttribute("lastName", request.getParameter("lastName"));
			request.setAttribute("userType", request.getParameter("userType"));
			getServletContext().getRequestDispatcher("/ShowProducts.jsp").forward(request, response);
		}

		private void saveData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//			Student entity=new Student(request);
			RegisterProductsDTO register = new RegisterProductsDTO(request,false);
			Long i= (Long)Model.saveDataDatabaseHibernate(register);
			PrintWriter out =  response.getWriter();
			if(i!=0)
			{
				System.out.println("result here");
				out.print("Product Registered Sucessfully");
			}
			else
				out.print("Product not Registered Sucessfully");
			
		}
		
		private void getUpdateData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			System.out.println("here");
			RegisterProductsDTO entity = new RegisterProductsDTO(request,true);
			entity = Model.UpdateProducts(entity,false);
			if(entity != null){
				request.setAttribute("entity", entity);
			getServletContext().getRequestDispatcher("/UpdateProducts.jsp").forward(request, response);
			}else{
				getServletContext().getRequestDispatcher("/ShowProducts.jsp").forward(request, response);
			}
			
		}
		private void removeData(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
			System.out.println("here");
			RegisterProductsDTO entity = new RegisterProductsDTO(request,true);
			entity = Model.DeleteProducts(entity,false);
			if(entity != null){
				request.setAttribute("entity", entity);
			getServletContext().getRequestDispatcher("/DeleteProducts.jsp").forward(request, response);
			}else{
				getServletContext().getRequestDispatcher("/ShowProducts.jsp").forward(request, response);
			}
			
		}
	}


