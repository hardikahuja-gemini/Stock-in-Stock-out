<%@page import="java.util.regex.Pattern"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.demo.dto.RegisterProductsDTO"%>
<%@page import="com.demo.dto.RegisterDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.Student"%>
<%@page import="java.util.List"%>
<%@page import="java.util.*"%>
<%@page import="com.model.Model"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link href="assets/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/plugins/pace/pace-theme-big-counter.css" rel="stylesheet" />
   <link href="assets/css/style.css" rel="stylesheet" />
      <link href="assets/css/main-style.css" rel="stylesheet" />
<title>Insert title</title>
</head>
<%-- <%
JSONObject map = new JSONObject(request.getParameter("map"));
List<String> productList = Arrays.asList(request.getParameter("products").split(Pattern.quote(",")));
List<Object> products = new ArrayList<Object>(productList); 

String modelnumber=(String)request.getParameter("modelnumber");
System.out.print(products);
RegisterProductsDTO order=(RegisterProductsDTO)request.getParameter("entity");
%> --%>
<%RegisterProductsDTO order = (RegisterProductsDTO)(request.getAttribute("entity")); %>

<body class="body-Login-back">
 <div class="container">
      
        <div class="row">
            
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">                  
                    <div class="panel-heading">
                        <h3 class="panel-title">ORDER CONFIRMATION</h3>
                    </div>
                    <div class="panel-body">
                      
                            <fieldset>
                                <div class="form-group">
                                  ModelNumber:<%=order.getModelnumber()%>                               
                                   </div>
                                  
                                 <div class="form-group">
                                  ProductName:<%=order.getProductname()%>                               
                                   </div>
                                 <div class="form-group">
                                  Price Per Item:<%=order.getPrice()%>                               
                                   </div>
                                
                              
                                 <div class="form-group">
                                   STOCK: <input class="form-control" id="stock" name="stock" type="number" value="1" autofocus required>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <input type="button" id="button" value="BUY" onclick="updatefun()" class="btn btn-lg btn-success btn-block"/>
                            </fieldset>
                        <!-- </form> -->
                    </div>
                    <div style="padding_bottom:7px;"></div>
                    </div>
                </div>
            </div>
        </div>
         <script src="assets/plugins/jquery-1.10.2.js"></script>
    <script src="assets/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="assets/plugins/metisMenu/jquery.metisMenu.js"></script>
         <script type = "text/javascript" 
         src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script>
    function updatefun(){
    	<%-- var cc='<%=order.getStock()%>';
    	var d=document.getElementById("stock").value;
    	
    	 if(parseInt("d") > cc ){
    		alert("no");
    		}  --%>
    	 	 
    		 var reqData = "modelnumber="+'<%=order.getModelnumber()%>';
          	  reqData += "&quantity="+document.getElementById("stock").value;
          	reqData += "&price="+'<%=order.getPrice()%>';
          	reqData += "&id="+'<%=order.getProductId()%>';
          	reqData += "&userAction=3";
          	alert(reqData);
        	$.post("MainServlet",
                    reqData,
                    function(data){
        		alert(data);
                    }
              	 );
    
    	 }
    		
    		
    		/* $(document).ready(function() {
           	 $("#button").click(function(){
           	 
           	 
           	 
        
     	
           	 });
           	 });
    		 */
           	 
    </script>
</body>
</html>