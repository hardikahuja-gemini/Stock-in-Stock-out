package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.dto.PurchaseDTO;
import com.demo.dto.RegisterDTO;
import com.model.Model;

public class PurchaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public PurchaseServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	doPost(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	int userAction=Integer.parseInt(request.getParameter("userAction"));
	System.out.println("user actions is "+userAction);
	switch(userAction)
	{
	case 0:purchase(request, response);
	break;
	}
	
	}


	void purchase(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		List<PurchaseDTO> purchase = Model.listPurchase();
		request.setAttribute("entity", purchase);
		System.out.println("this is purchase:"+purchase);
		
		getServletContext().getRequestDispatcher("/start.jsp").forward(request, response);		
	}
}

