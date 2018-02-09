package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.dto.RegisterDTO;
import com.model.Model;

/**
 * Servlet implementation class MyUpdateServlet
 */
public class MyUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
		int userAction = Integer.parseInt(request.getParameter("userAction"));
		System.out.println("userAction"+userAction);
		switch(userAction){
		case 0:
			getData(request,response);
			break;
		default:
			break;
		}
		}catch(Exception e){
			e.printStackTrace();
			response.sendRedirect("Error.jsp");
		}
	}

	private void getData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("here");
		RegisterDTO entity = new RegisterDTO(request,false);
		entity = Model.Update(entity,false);
		if(entity != null){
			request.setAttribute("entity", entity);
		getServletContext().getRequestDispatcher("/Update.jsp").forward(request, response);
		}else{
			getServletContext().getRequestDispatcher("/User.jsp").forward(request, response);
		}
		
	}
	
}
