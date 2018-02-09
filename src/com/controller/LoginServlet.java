package com.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;

import com.demo.dto.PurchaseDTO;
import com.demo.dto.RegisterDTO;
import com.demo.dto.RegisterProductsDTO;
import com.model.Model;
import com.model.Student;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			int userAction = Integer.parseInt(request.getParameter("userAction"));
			switch (userAction) {
			case 0:
				login(request,response);
				break;
			case 2:logout(request,response);
			System.out.println("aa agaya main");
			break;
				default:
					response.sendRedirect("Error.jsp");
					break;
			}
		}catch(Exception e){
			e.printStackTrace();
				response.sendRedirect("Error.jsp");
			}
}

	private void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, JSONException {
		RegisterDTO result = Model.authenticateLogin(request);
		if(result!=null){
			request.setAttribute("login","true");
			HttpSession session = request.getSession(true);
			List<PurchaseDTO> purchase = Model.listPurchase();
			request.setAttribute("entity", purchase);
			List<RegisterProductsDTO> products = Model.listStock();
			List<Object> pricePro=Model.priceProd(products);
			request.setAttribute("pricePro", pricePro);

			List<RegisterDTO> listUsers = Model.listUsers();
			JSONObject dashboardData = Model.getDashboardData(products,listUsers,purchase);
			session.setAttribute("userId", result.getId());
			request.setAttribute("dashboardData", dashboardData);
			request.setAttribute("firstName", result.getFirstName());
			request.setAttribute("lastName", result.getLastName());
			request.setAttribute("userType", result.getType());
			getServletContext().getRequestDispatcher("/start.jsp").forward(request, response);
		}else{
			request.setAttribute("login","false");
			getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
		}
	}
	public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		HttpSession session=request.getSession(false);
		if(session!=null)
		{
			session.invalidate();
			
		}
		getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);

	}

}