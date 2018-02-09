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
import com.model.Model;
import com.model.Student;

/**
 * Servlet implementation class MyServlet
 */
public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
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
		case 3:
			registerInternal(request,response);
			break;
		default:
			break;
		}
		}catch(Exception e){
			response.sendRedirect("Error.jsp");
		}
	}

	private void registerInternal(HttpServletRequest request, HttpServletResponse response) throws IOException {
		RegisterDTO register = new RegisterDTO(request,false);
		Long i= (Long)Model.saveDataDatabaseHibernate(register);
		PrintWriter out = response.getWriter();
		if(i!=0)
		{   request.setAttribute("firstName", register.getFirstName());
			request.setAttribute("lastName", register.getLastName());
			HttpSession session = request.getSession(true);
			session.setAttribute("userId", register.getId());
			out.write("Register successfully");
		}
		else
			out.write("Not Register successfully");
		
	}

	private void getUpdateData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("here");
		RegisterDTO entity = new RegisterDTO(request,true);
		entity = Model.Update(entity,false);
		if(entity != null){
			request.setAttribute("entity", entity);
		getServletContext().getRequestDispatcher("/Update.jsp").forward(request, response);
		}else{
			getServletContext().getRequestDispatcher("/User.jsp").forward(request, response);
		}
		
	}

	private void getData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<RegisterDTO> students = Model.getDataHibernate();
		request.setAttribute("entity", students);
		request.setAttribute("firstName", request.getParameter("firstName"));
		request.setAttribute("lastName", request.getParameter("lastName"));
		request.setAttribute("userType", request.getParameter("userType"));
		getServletContext().getRequestDispatcher("/User.jsp").forward(request, response);
	}

	private void saveData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		Student entity=new Student(request);
		RegisterDTO register = new RegisterDTO(request,false);
		Long i= (Long)Model.saveDataDatabaseHibernate(register);
		if(i!=0)
		{   request.setAttribute("firstName", register.getFirstName());
			request.setAttribute("lastName", register.getLastName());
			HttpSession session = request.getSession(true);
			session.setAttribute("userId", register.getId());
			getServletContext().getRequestDispatcher("/start.jsp").forward(request, response);
			
		}
		else
			response.sendRedirect("Error.jsp");
		
	}
	}
