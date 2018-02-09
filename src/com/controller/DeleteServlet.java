package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.dto.RegisterDTO;
import com.demo.dto.RegisterProductsDTO;
import com.model.Model;

/**
 * Servlet implementation class Update
 */
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DeleteServlet() {
       
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userAction = Integer.parseInt(request.getParameter("userAction"));
		System.out.println("userAction"+userAction);
				switch(userAction){
				case 0:
					getData(request,response);
					break;
				case 1:
					update(request,response);
					break;
				case 2:
					DeleteProducts(request,response);
					break;
				default:
					break;
				}
		
	}


	private void getData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("here");
		RegisterDTO entity = new RegisterDTO(request,false);
		entity = Model.Update(entity,false);
		if(entity != null){
			request.setAttribute("entity", entity);
		getServletContext().getRequestDispatcher("/UpdateProducts.jsp").forward(request, response);
		}else{
			getServletContext().getRequestDispatcher("/ShowProducts.jsp").forward(request, response);
		}
		
	}


	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("IN UPDATE METHOD");
		RegisterDTO entity = new RegisterDTO(request,true);
		entity =  Model.Update(entity,true);
		PrintWriter out =  response.getWriter();
		System.out.println(entity);
		if(entity != null){
			request.setAttribute("entity", entity);
			out.print("Update Sucessfully");
			}else{
				out.print("Update failed");
			}
		
	}
	private void DeleteProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("IN Delete METHOD");
		RegisterProductsDTO entity = new RegisterProductsDTO(request,true);
		entity =  Model.DeleteProducts(entity,true);
		PrintWriter out =  response.getWriter();
		System.out.println(entity);
		if(entity != null){
			request.setAttribute("entity", entity);
			out.print("Delete Sucessfully");
			}else{
				out.print("Update failed");
			}
		
	}

}
