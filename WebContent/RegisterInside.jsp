<!DOCTYPE html>
<%@page import="com.demo.dto.RegisterDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.Student"%>
<%@page import="java.util.List"%>
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

    <!-- Page-Level CSS -->
    <link href="assets/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
    <%List<RegisterDTO> entity = (List<RegisterDTO>)(request.getAttribute("entity")); 
    String newId = "";
   
    String firstName = "";
    String lastName = "";
    String userType="";
    %>
    
    <%
    if(!(request.getSession(true).getAttribute("userId").toString()).isEmpty()){
      firstName = request.getParameter("firstName");
     lastName = request.getParameter("lastName");
     request.setAttribute("firstName",firstName);
     request.setAttribute("lastName",lastName);
     userType=(String)request.getParameter("userType");
     request.setAttribute("userType", userType);

     }else{%>
     <jsp:forward page = "Login.jsp" />
    <% }%>
    
</head>

<body>
    <!--  wrapper -->
    <div id="wrapper">
        <!-- navbar top -->
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation" id="navbar">
            <!-- navbar-header -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
               <!--  <a class="navbar-brand" href="index.html">
                    <img src="assets/img/logo.png" alt="" />
                </a> -->
            </div>
            <!-- end navbar-header -->
            <!-- navbar-top-links -->
            <ul class="nav navbar-top-links navbar-right">
                <!-- main dropdown -->
            

                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-3x"></i>
                    </a>
                    <!-- dropdown user-->
                    <ul class="dropdown-menu dropdown-user">
                       
                        <li class="divider"></li>
                        <li><a href="Login.jsp"><i class="fa fa-sign-out fa-fw"></i>Logout</a>
                        </li>
                    </ul>
                    <!-- end dropdown-user -->
                </li>
                <!-- end main dropdown -->
            </ul>
            <!-- end navbar-top-links -->

        </nav>
        <!-- end navbar top -->

        <!-- navbar side -->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <!-- sidebar-collapse -->
            <div class="sidebar-collapse">
                <!-- side-menu -->
                <ul class="nav" id="side-menu">
                    <li>
                        <!-- user image section-->
                        <div class="user-section">
                            <div class="user-section-inner">
                                <img src="assets/img/user.jpg" alt="">
                            </div>
                            <div class="user-info">
                                <div><%=firstName%> <strong><%=lastName%></strong></div>
                                <div class="user-text-online">
                                    <span class="user-circle-online btn btn-success btn-circle "></span>&nbsp;Online
                                </div>
                            </div>
                        </div>
                        <!--end user image section-->
                    </li>
                    <li class="sidebar-search">
                        <!-- search section-->
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="Search...">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                        </div>
                        <!--end search section-->
                    </li>
                    <li>
                        <a href="index.html"><i class="fa fa-dashboard fa-fw"></i>Dashboard</a>
                    </li>
                      <%
                    if(!userType.isEmpty() && userType.equals("admin")){
                    %>
                   
                      <li>
                        <a href="RegisterInside.jsp?firstName=<%= request.getAttribute("firstName")%>&lastName=<%= request.getAttribute("lastName")%>&userType=<%=request.getAttribute("userType")%>"><i class="fa fa-dashboard fa-fw"></i>Register Users</a>
                    </li>
                   
                    <li>
                        <a href="proInsertInside.jsp?firstName=<%= request.getAttribute("firstName")%>&lastName=<%= request.getAttribute("lastName")%>&userType=<%=request.getAttribute("userType")%>"><i class="fa fa-dashboard fa-fw"></i>Products Entry</a>
                    </li>
                  <%} %>
                       <li>
                        <a href="User.jsp?firstName=<%= request.getAttribute("firstName")%>&lastName=<%= request.getAttribute("lastName")%>&userType=<%=request.getAttribute("userType")%>"><i class="fa fa-dashboard fa-fw"></i>Registered Users</a>
                    </li>
                      <li>
                        <a href="ShowProducts.jsp?firstName=<%= request.getAttribute("firstName")%>&lastName=<%= request.getAttribute("lastName")%>&userType=<%=request.getAttribute("userType")%>"><i class="fa fa-dashboard fa-fw"></i>Registered Products</a>
                    </li>
                   
                   
                </ul>
                <!-- end side-menu -->
            </div>
            <!-- end sidebar-collapse -->
        </nav>
        <!-- end navbar side -->
        <!--  page-wrapper -->
        <div id="page-wrapper">

            
            <div class="row">
                 <!--  page header -->
              
                 <!-- end  page header -->
            </div>
 
 			<div class="row">
 			<form method="post" action="MyServlet">
 			<input type="hidden" value=1 name="userAction"/>
 			<input type="submit" name="showData" value="showData"/>
 			</form>
 			</div>
 			
          
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="login-panel panel panel-default">                  
                    <div class="panel-heading">
                        <h3 class="panel-title">Enter your Details</h3>
                    </div>
                    <div class="panel-body">
                        <form  method="post">
                            <fieldset>
                            <input type="hidden" value=2 name="userAction">
                                <div class="form-group col-md-6">
                                    <input class="form-control" placeholder="First Name" id="firstName" type="text" autofocus required>
                                </div>
                                <div class="form-group col-md-6">
                                    <input class="form-control" placeholder="Last Name" id="lastName" type="text" autofocus required>
                                </div>
                                <div class="form-group col-md-12">
                                    <input class="form-control" placeholder="Address" id="address" type="text" value="" required>
                                </div>
                                   <div class="form-group col-md-6">
                                    <input class="form-control" placeholder="Email" id="email" type="email" autofocus required>
                                </div>
                                <div class="form-group col-md-6">
                                    <input class="form-control" placeholder="contact" id="contact" type="text" autofocus required>
                                </div>
                                <div class="form-group col-md-6">
                                    <input class="form-control" placeholder="password" id="password" type="text" autofocus required>
                                </div>
                                <div class="form-group col-md-6">
                                    <input class="form-control" placeholder="confirm password" id="cpassword" type="text" autofocus required>
                                </div>
                                <input type="hidden" id="userType" value="user"/>
                               <div class="form-group col-md-12 center">
    					<input type="button" id="button" class="btn btn-lg btn-success btn-block" value="Register"/>
                </div>
                            </fieldset>
                        </form>
                    </div>
                   
                </div>
            </div>
        </div>

    </div>
    <!-- end wrapper -->

    <!-- Core Scripts - Include with every page -->
    <script src="assets/plugins/jquery-1.10.2.js"></script>
    <script src="assets/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="assets/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="assets/plugins/pace/pace.js"></script>
    <script src="assets/scripts/siminta.js"></script>
    <!-- Page-Level Plugin Scripts-->
    <script src="assets/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="assets/plugins/dataTables/dataTables.bootstrap.js"></script>
   <!--  <script>
        $(document).ready(function () {
            $('#dataTables-example').dataTable();
        });
    </script> -->
    <script>
    	
    	 $(document).ready(function() {
        	 $("#button").click(function(){
        		 var reqData = "email="+document.getElementById("email").value;
           	  reqData += "&firstName="+document.getElementById("firstName").value;
           	reqData += "&lastName="+document.getElementById("lastName").value;
           	reqData += "&address="+document.getElementById("address").value;
           	reqData += "&contact="+document.getElementById("contact").value;
           	reqData += "&password="+document.getElementById("password").value;
           	reqData += "&userType="+document.getElementById("userType").value;
        	reqData += "&userAction=3";
           	$.post( "MyServlet",
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
