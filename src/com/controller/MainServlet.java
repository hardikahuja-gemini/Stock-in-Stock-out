package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.demo.dto.RegisterProductsDTO;
import com.demo.dto.PurchaseDTO;

import com.model.Model;


public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public MainServlet() {
		super();

	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userAction=0;
		List<String> proname=new ArrayList<String>();

		if((request.getParameter("userAction"))!=null)
			userAction=Integer.parseInt(request.getParameter("userAction"));

		if(userAction==0)
		{
			List<RegisterProductsDTO> products = Model.getDataHibernateProducts();
			System.out.println(products);
			Map<String,String> map=new HashMap<String,String>();
			for(RegisterProductsDTO produ:products)
			{
				map.put(produ.getModelnumber(), produ.getStock());
			}
			//		List<Object> list =  Arrays.asList(products.toString().split(Pattern.quote(",")));
			for(RegisterProductsDTO pp:products)
			{
				proname.add(pp.getProductname());
			}
			System.out.println(proname);

			request.setAttribute("entity", products);
			request.setAttribute("ent", map);
			request.setAttribute("name", proname);


			getServletContext().getRequestDispatcher("/Me2.jsp").forward(request, response);
		}
		else if(userAction==2)
		{
			System.out.println("here");
			RegisterProductsDTO entity = new RegisterProductsDTO(request,true);
			entity = Model.ShowProducts(entity);
			if(entity != null){
				request.setAttribute("entity", entity);
				getServletContext().getRequestDispatcher("/Confirm.jsp").forward(request, response);
			}else{
				getServletContext().getRequestDispatcher("/Error.jsp").forward(request, response);
			}



		}
		else if(userAction==3){
			System.out.println("aa gaya main");
			PurchaseDTO register = new PurchaseDTO(request);
			Long i= (Long)Model.saveDataDatabaseHibernate(register);
			PrintWriter out =  response.getWriter();
			if(i!=0)
			{
				System.out.println("result here");
				out.print("Product Purchased Sucessfully");
			}
			else
				out.print("ERROR! TRY AGAIN");
			
		}
		else{
			
			//String pn=request.getParameter("productname");
			List<RegisterProductsDTO> plist=(List<RegisterProductsDTO>) Model.particularPro(request);
			System.out.println("accha "+plist);
			request.setAttribute("entity", plist);
			request.setAttribute("name", proname);

			getServletContext().getRequestDispatcher("/Me2.jsp").forward(request, response);

			
		}
		
		}



	}


