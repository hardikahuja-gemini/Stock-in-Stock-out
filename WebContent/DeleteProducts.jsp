<!DOCTYPE html>
<%@ page errorPage="Error.jsp" %>  
<%@page import="com.demo.dto.RegisterProductsDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
  <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bootsrtap Free Admin Template - SIMINTA | Admin Dashboad Template</title>
    <!-- Core CSS - Include with every page -->
    <link href="assets/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/plugins/pace/pace-theme-big-counter.css" rel="stylesheet" />
   <link href="assets/css/style.css" rel="stylesheet" />
      <link href="assets/css/main-style.css" rel="stylesheet" />
<%RegisterProductsDTO entity = (RegisterProductsDTO)(request.getAttribute("entity")); %>
</head>
<body class="body-Login-back">

    <div class="container">
      
        <div class="row">
            
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">                  
                    <div class="panel-heading">
                        <h3 class="panel-title">Deletion In Process..</h3>
                    </div>
                    <div class="panel-body">
                        <!-- <form role="form"  action="UpdateServlet.java"> -->
                        <!-- <input type="hidden" value="1" name="userAction"/> -->
                        <input type="hidden" name="productId" id="productId" value=<%=entity.getProductId()%> />
                            <fieldset>
                                <div class="form-group">
                                  Model Number:<input class="form-control" id="modelnumber" name="modelnumber" value=<%=entity.getModelnumber()%> type="email" autofocus required>
                                </div>
                                  <div class="form-group">
                                  Product Name:<input class="form-control" id="productname" name="productname" value=<%=entity.getProductname()%> type="text" autofocus required>
                                </div>
                                <div class="form-group">
                                 Colour:<input class="form-control" id="colour" name="colour" type="text" value=<%=entity.getColour()%> autofocus required>
                                </div>
                                 <div class="form-group">
                                 Price:<input class="form-control" id="price" name="price" type="text" value=<%=entity.getPrice()%> autofocus required>
                                </div>
                                 <div class="form-group">
                                   Stock:<input class="form-control" id="stock" name="stock" type="text" value=<%=entity.getStock()%> autofocus required>
                                </div>
<%--                               <input class="form-control" id="userType" name="userType" type="text" value=<%=entity.getType()%> autofocus required>
 --%>                                <!-- Change this to a button or input when using this as a form -->
                                <input type="button" id="button" value="Delete" class="btn btn-lg btn-success btn-block"/>
                            </fieldset>
                        <!-- </form> -->
                    </div>
                    <div style=""padding_bottom: 7px></div>
                    </div>
                </div>
            </div>
        </div>
    

     <!-- Core Scripts - Include with every page -->
    <script src="assets/plugins/jquery-1.10.2.js"></script>
    <script src="assets/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="assets/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script type = "text/javascript" 
         src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
		
      <script type = "text/javascript" language = "javascript">
         $(document).ready(function() {
        	 $("#button").click(function(){
        		 var reqData = "modelnumber="+document.getElementById("modelnumber").value;
           	  reqData += "&productname="+document.getElementById("productname").value;
           	reqData += "&colour="+document.getElementById("colour").value;
           	reqData += "&price="+document.getElementById("price").value;
           	reqData += "&stock="+document.getElementById("stock").value;
           	reqData += "&productId="+document.getElementById("productId").value;
        	reqData += "&userAction=2";
           	$.post( "DeleteServlet",
                    reqData,
                    function(data) {
           		alert(data);
           		/* $("#display").css("display","block");
                       $('#display').html(data); */
                    }
                 );
         });
         });
      </script>

</body>
</html>