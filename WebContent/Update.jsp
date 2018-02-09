<!DOCTYPE html>
<%@ page errorPage="Error.jsp" %>  
<%@page import="com.demo.dto.RegisterDTO"%>
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
<%RegisterDTO entity = (RegisterDTO)(request.getAttribute("entity")); %>
</head>
<body class="body-Login-back">

    <div class="container">
      
        <div class="row">
            
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">                  
                    <div class="panel-heading">
                        <h3 class="panel-title">Update In Process..</h3>
                    </div>
                    <div class="panel-body">
                        <!-- <form role="form"  action="UpdateServlet.java"> -->
                        <!-- <input type="hidden" value="1" name="userAction"/> -->
                        <input type="hidden" name="id" id="id" value=<%=entity.getId()%> />
                            <fieldset>
                                <div class="form-group">
                                  E-mail:<input class="form-control" id="email" name="email" value=<%=entity.getEmail()%> type="email" autofocus required>
                                </div>
                                  <div class="form-group">
                                  FirstName:  <input class="form-control" id="firstname" name="firstname"  value=<%=entity.getFirstName()%> type="text" autofocus required>
                                </div>
                                <div class="form-group">
                                 LastName   <input class="form-control" id="lastname" name="lastname" type="text" value=<%=entity.getLastName()%> autofocus required>
                                </div>
                                 <div class="form-group">
                                 Address:   <input class="form-control" id="address" name="address" type="text" value=<%=entity.getAddress()%> autofocus required>
                                </div>
                                 <div class="form-group">
                                   Contact: <input class="form-control" id="contact" name="contact" type="text" value=<%=entity.getContact()%> autofocus required>
                                </div>
                              <input class="form-control" id="userType" name="userType" type="text" value=<%=entity.getType()%> autofocus required>
                                <!-- Change this to a button or input when using this as a form -->
                                <input type="button" id="button" value="Update" class="btn btn-lg btn-success btn-block"/>
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
        		 var reqData = "email="+document.getElementById("email").value;
           	  reqData += "&firstName="+document.getElementById("firstname").value;
           	reqData += "&lastName="+document.getElementById("lastname").value;
           	reqData += "&address="+document.getElementById("address").value;
           	reqData += "&contact="+document.getElementById("contact").value;
        	reqData += "&userType="+document.getElementById("userType").value;
           	reqData += "&id="+document.getElementById("id").value;
        	reqData += "&userAction=1";
           	$.post( "UpdateServlet",
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