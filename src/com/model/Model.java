package com.model;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.mapping.Array;
import org.json.JSONException;
import org.json.JSONObject;

import com.demo.dto.PurchaseDTO;
import com.demo.dto.RegisterDTO;
import com.demo.dto.RegisterProductsDTO;
import com.demo.util.HibernateUtil;

public class Model{
	public static Session session = HibernateUtil.getSessionFactory().openSession();

	public Model() {

	}

	/*public static List<Student> getData(){
		List<Student> studentData = new ArrayList<Student>();
		try {
			Connection con = getConnection();
			if(con == null)
				return studentData;
			PreparedStatement ps=con.prepareStatement("select * from register");
			ResultSet data = ps.executeQuery();
			while(data.next()){
				Student student = new Student();
				student.setId(data.getInt("id"));
				student.setFirstname(data.getString("fname"));
				student.setLasttname(data.getString("lname"));
				student.setContact(data.getString("contact"));
				student.setEmail(data.getString("email"));
				studentData.add(student);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return studentData;
	}
	 */
	public static List<RegisterDTO> getDataHibernate(){
		if (session != null && !session.isOpen()) {
			session = HibernateUtil.getSessionFactory().openSession();
		}
		session.clear();
		List<RegisterDTO> users = null;
		Transaction transaction = null;
		//List<RegisterDTO> studentData = new ArrayList<RegisterDTO>();
		try {
			transaction = session.beginTransaction();
			users = session.createQuery("from RegisterDTO").list();
			System.out.println("users "+users);
			transaction.commit();
		} catch (HibernateException e) {
			// transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return users;
	}
	public static List<RegisterProductsDTO> getDataHibernateProducts(){
		if (session != null && !session.isOpen()) {
			session = HibernateUtil.getSessionFactory().openSession();
		}
		session.clear();
		List<RegisterProductsDTO> products = null;
		Transaction transaction = null;
		//List<RegisterDTO> studentData = new ArrayList<RegisterDTO>();
		try {
			transaction = session.beginTransaction();
			products = session.createQuery("from RegisterProductsDTO").list();
			System.out.println("products "+products);
			transaction.commit();
		} catch (HibernateException e) {
			// transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return products;
	}


	public static Connection getConnection(){
		Connection con = null;
		String driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/demo?autoReconnect=true";
		String user="root";
		String password="";
		try {
			Class.forName(driver);
			con=DriverManager.getConnection(url,user,password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	/*public  static int saveDataDatabase(Student student)
	{
		int i = 0;
		try {
			Connection con = getConnection();
			if(con == null)
				return i;
			PreparedStatement ps=con.prepareStatement("insert into register(id,fname,lname,address,contact,email,password) values(?,?,?,?,?,?,?)");
			ps.setInt(1, student.getId());
			ps.setString(2,student.getFirstname());
			ps.setString(3,student.getLasttname());
			ps.setString(4,student.getAddress());
			ps.setString(5,student.getContact());
			ps.setString(6,student.getEmail());
			ps.setString(7,student.getPassword());
			i=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}
	 */
	public  static Long saveDataDatabaseHibernate(Object entity)
	{
		session = getSession();
		session.clear();
		Transaction transaction = null;
		Long Id = null;
		try {
			transaction = session.beginTransaction();
			System.out.println("idhar"+entity);
			Id = (Long) session.save(entity);
			System.out.println("inserted"+entity);
			transaction.commit();
		} catch (Exception e) {
			System.out.println("bahar");
			e.printStackTrace();
			transaction.rollback();
		} finally {
			System.out.println("here");
			closeSession(session);
		}
		System.out.println(Id);
		return Id;
	}
	public static void closeSession(Session session) {
		session.flush();
		session.clear();
		session.close();
	}

	public static Session getSession(){
		if (session != null && !session.isOpen()) {
			session = HibernateUtil.getSessionFactory().openSession();
		}
		return session;
	}

	public static RegisterDTO authenticateLogin(HttpServletRequest request) {
		session = getSession();
		session.clear();
		Transaction transaction = null;
		RegisterDTO user = null;
		try {
			transaction = session.beginTransaction();
			System.out.println(transaction);
			List<RegisterDTO> users = session.createQuery("from RegisterDTO where email=:email and password=:password"
					+ "").setString("email", request.getParameter("email").toString())
					.setString("password", request.getParameter("password").toString()).list();
			Iterator iterator = users.iterator();
			while (iterator.hasNext()) {
				user = (RegisterDTO) iterator.next();
			}
			transaction.commit();
		} catch (HibernateException e) {
			transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return user;
	}
	public static RegisterDTO Update(RegisterDTO entity, boolean updateValues)
	{
		RegisterDTO user=null;
		session=getSession();
		session.clear();
		Transaction transaction =null;
		try{
			transaction = session.beginTransaction();
			System.out.println("id"+entity.getId());
			user = (RegisterDTO) session.get(RegisterDTO.class, entity.getId());
			System.out.println("user" + user);
			if(updateValues){
				user = getUpdated(user,entity);
				session.saveOrUpdate(user);
				transaction.commit();
			}
		} catch (HibernateException e) {
			transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return user;

	}

	private static RegisterDTO getUpdated(RegisterDTO user, RegisterDTO entity) {
		user.setAddress(entity.getAddress());
		user.setContact(entity.getContact());
		user.setFirstName(entity.getFirstName());
		user.setLastName(entity.getLastName());
		user.setType(entity.getType());
		user.setEmail(entity.getEmail());
		return user;
	}
	public static RegisterProductsDTO UpdateProducts(RegisterProductsDTO entity, boolean updateValues)
	{
		RegisterProductsDTO pro=null;
		session=getSession();
		session.clear();
		Transaction transaction =null;
		try{
			transaction = session.beginTransaction();
			System.out.println("Productid"+entity.getProductId());
			pro = (RegisterProductsDTO) session.get(RegisterProductsDTO.class, entity.getProductId());
			System.out.println("product" + pro);
			if(updateValues){
				pro = getUpdatedProducts(pro,entity);
				session.saveOrUpdate(pro);
				transaction.commit();
			}
		} catch (HibernateException e) {
			transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return pro;

	}

	private static RegisterProductsDTO getUpdatedProducts(RegisterProductsDTO pro, RegisterProductsDTO entity) {
		pro.setModelnumber(entity.getModelnumber());
		pro.setProductname(entity.getProductname());
		pro.setColour(entity.getColour());
		pro.setStock(entity.getStock());
		pro.setPrice(entity.getPrice());
		return pro;
	}
	public static RegisterProductsDTO DeleteProducts(RegisterProductsDTO entity, boolean updateValues)
	{
		RegisterProductsDTO pro=null;
		session=getSession();
		session.clear();
		Transaction transaction =null;
		try{
			transaction = session.beginTransaction();
			System.out.println("Productid"+entity.getProductId());
			pro = (RegisterProductsDTO) session.get(RegisterProductsDTO.class, entity.getProductId());
			System.out.println("product" + pro);
			if(updateValues){
				pro = getDeletedProducts(pro,entity);
				session.delete(pro);
				transaction.commit();
			}
		} catch (HibernateException e) {
			transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return pro;

	}
	private static RegisterProductsDTO getDeletedProducts(RegisterProductsDTO pro, RegisterProductsDTO entity) {
		pro.setModelnumber(entity.getModelnumber());
		pro.setProductname(entity.getProductname());
		pro.setColour(entity.getColour());
		pro.setStock(entity.getStock());
		pro.setPrice(entity.getPrice());
		return pro;
	}

	public static List<PurchaseDTO> listPurchase() {
		List<PurchaseDTO> listPurchased = new ArrayList<>();
		if (session != null && !session.isOpen()) {
			session = HibernateUtil.getSessionFactory().openSession();
		}
		System.out.println("In this");
		session.clear();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			System.out.println("txn "+transaction);
			List<PurchaseDTO> users = session.createQuery("from PurchaseDTO").list();
			System.out.println("internal "+users);
			Iterator iterator = users.iterator();
			while (iterator.hasNext()) {
				PurchaseDTO purchase = (PurchaseDTO) iterator.next();
				listPurchased.add(purchase);
			}
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} finally {
			System.out.println("finally");
			session.close();
		}
		return listPurchased;
	}


	public static List<RegisterProductsDTO> listStock() {
		List<RegisterProductsDTO> listPurchased = new ArrayList<>();
		if (session != null && !session.isOpen()) {
			session = HibernateUtil.getSessionFactory().openSession();
		}
		System.out.println("In this");
		session.clear();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			System.out.println("txn "+transaction);
			List<RegisterProductsDTO> users = session.createQuery("from RegisterProductsDTO").list();
			System.out.println("internal "+users);
			Iterator iterator = users.iterator();
			while (iterator.hasNext()) {
				RegisterProductsDTO purchase = (RegisterProductsDTO) iterator.next();
				listPurchased.add(purchase);
			}
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} finally {
			System.out.println("finally");
			session.close();
		}
		return listPurchased;
	}

	public static List<RegisterDTO> listUsers() {
		List<RegisterDTO> listUser = new ArrayList<>();
		if (session != null && !session.isOpen()) {
			session = HibernateUtil.getSessionFactory().openSession();
		}
		System.out.println("In this");
		session.clear();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			System.out.println("txn "+transaction);
			List<RegisterDTO> users = session.createQuery("from RegisterDTO").list();
			System.out.println("internal "+users);
			Iterator iterator = users.iterator();
			while (iterator.hasNext()) {
				RegisterDTO user = (RegisterDTO) iterator.next();
				listUser.add(user);
			}
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} finally {
			System.out.println("finally");
			session.close();
		}
		return listUser;
	}
	public static List<Object> priceProd(List<RegisterProductsDTO> prod) throws JSONException
	{  
		List<Object> dataList = new ArrayList<>();
		if(prod.isEmpty()){
			return dataList;
		}
		for(RegisterProductsDTO products:prod)
		{
			JSONObject data = new JSONObject();
			data.put("a",products.getPrice());
			data.put("y",(String)products.getProductname());
			dataList.add(data);

		}System.out.println("hehehehee"+dataList);
		return dataList;
	}

	public static void main(String[] args) {
		System.out.println(listPurchase());
	}

	public static JSONObject getDashboardData(List<RegisterProductsDTO> products,List<RegisterDTO> listUser, List<PurchaseDTO> purchase) throws JSONException {
		JSONObject data = new JSONObject();
		if(products.isEmpty() || purchase.isEmpty()||listUser.isEmpty()){
			return data;
		}
		long productsSold = 0L;
		BigDecimal amount = new BigDecimal("0");
		for(PurchaseDTO purchased:purchase){
			if(!purchased.getQuantity().isEmpty()){
				productsSold += Long.parseLong(purchased.getQuantity());
			}
			BigDecimal itemPrice = new BigDecimal(purchased.getPrice());
			itemPrice = itemPrice.multiply(new BigDecimal(purchased.getQuantity()));
			amount = amount.add(itemPrice);
		}
		long totalProducts = 0L;
		BigDecimal productPrice = new BigDecimal("0");
		for(RegisterProductsDTO product:products){
			if(!product.getPrice().isEmpty()){
				totalProducts += Long.parseLong(product.getStock());
			}
			BigDecimal itemPrice = new BigDecimal(product.getPrice());
			itemPrice =  itemPrice.multiply(new BigDecimal(product.getStock()));
			productPrice = productPrice.add(itemPrice);
		}
		int totalUsers=0;
		for(RegisterDTO userRegistered:listUser)
		{
			if(!userRegistered.getEmail().isEmpty()){
				totalUsers ++;
			}

		}
		data.put("profit", (productPrice.subtract(new BigDecimal(amount.toString()))));
		data.put("productsLeft", totalProducts - productsSold);
		data.put("totalProducts", totalProducts);
		data.put("productsSold", productsSold);
		data.put("productsAmount", amount.toString());
		data.put("totalUsers", totalUsers);
		return data;
	}
	public static RegisterProductsDTO ShowProducts(RegisterProductsDTO entity)
	{
		RegisterProductsDTO pro=null;
		session=getSession();
		session.clear();
		Transaction transaction =null;
		try{
			transaction = session.beginTransaction();
			System.out.println("Productid"+entity.getProductId());
			pro = (RegisterProductsDTO) session.get(RegisterProductsDTO.class, entity.getProductId());
			System.out.println("producthello" + pro);
			/*if(updateValues){
				pro = getUpdatedProducts(pro,entity);
				session.saveOrUpdate(pro);
				transaction.commit();
			}*/
		} catch (HibernateException e) {
			transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return pro;

	}
	public static List<RegisterProductsDTO> particularPro(HttpServletRequest request) {
		session = getSession();
		session.clear();
		Transaction transaction = null;
		List<RegisterProductsDTO> partpro = null;
		try {
			transaction = session.beginTransaction();
			System.out.println(transaction);
			partpro = session.createQuery("from RegisterProductsDTO where productname=:productname"
					+ "").setString("productname", request.getParameter("productname").toString())
					.list();
			Iterator iterator = partpro.iterator();
//			while (iterator.hasNext()) {
//				pro = (List<RegisterProductsDTO>)iterator.next();
//			}
			transaction.commit();
		} catch (HibernateException e) {
			transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return partpro;
	}


}
