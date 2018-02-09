<!DOCTYPE html>
<%@page import="java.util.Map"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.dialect.FirebirdDialect"%>
<%@page import="com.demo.dto.PurchaseDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page errorPage="Error.jsp" %>  
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>STOCK MANAGER</title>
    <!-- Core CSS - Include with every page -->
    <link href="assets/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/plugins/pace/pace-theme-big-counter.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />
    <link href="assets/css/main-style.css" rel="stylesheet" />
    <!-- Page-Level CSS -->
    <link href="assets/plugins/morris/morris-0.4.3.min.css" rel="stylesheet" />
        <%List<PurchaseDTO> entity = (List<PurchaseDTO>)(request.getAttribute("entity")); 
        JSONObject dashboardData = (JSONObject)(request.getAttribute("dashboardData")); 
        List<Object> dashData =  (List<Object>)(request.getAttribute("pricePro")); 

        System.out.println("this is entity"+entity);
        %>
    
    <% String userType =  (String)request.getAttribute("userType");
      String firstName = "";
      String lastName = "";
     

      %>
   
    <%
    if(!(request.getSession(true).getAttribute("userId").toString()).isEmpty()){
      firstName = (String)request.getAttribute("firstName");
     lastName = (String)request.getAttribute("lastName");
     System.out.println("helloooo"+userType);


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
                <a class="navbar-brand" href="index.html">
                    <img src="assets/img/logo.png" alt="" />
                </a>
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
                                <div><%=request.getAttribute("firstName")%> <strong><%=request.getAttribute("lastName")%></strong></div>
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
                     <li class="selected">
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
                <!-- Page Header -->
                <div class="col-lg-12">
                    <h1 class="page-header">Dashboard</h1>
                </div>
                <!--End Page Header -->
            </div>

            <div class="row">
                <!-- Welcome -->
                <div class="col-lg-12">
                    <div class="alert alert-info">
                        <i class="fa fa-folder-open"></i><b>&nbsp;Hello ! </b>Welcome <b><%=request.getAttribute("firstName")%> </b><%=request.getAttribute("lastName")%> </b>
                    </div>
                </div>
                <!--end  Welcome -->
            </div>


            <div class="row">
                <!--quick info section -->
                <div class="col-lg-3">
                    <div class="alert alert-danger text-center">
                        <i class="fa fa-calendar fa-3x"></i>&nbsp;<b><%=dashboardData.optString("productsAmount") %> </b>Amount of Money Recieved
                        

                    </div>
                </div>
                <div class="col-lg-3">
                    <div  style="height:93px;" class="alert alert-success text-center">
                        <i class="fa  fa-beer fa-3x"></i>&nbsp;<b><%=dashboardData.optString("profit") %></b>Profit Recorded  
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="alert alert-info text-center">
                        <i class="fa fa-rss fa-3x"></i>&nbsp;<b><%=dashboardData.optString("productsSold") %></b> Total Products Sold
                        out of <%=dashboardData.optString("totalProducts") %>&nbsp; Products

                    </div>
                </div>
                <div class="col-lg-3">
                    <div  style="height:93px;" class="alert alert-warning text-center">
                        <i class="fa  fa-pencil fa-3x"></i>&nbsp;<b> <%=dashboardData.optString("productsLeft") %></b>Products Left
                    </div>
                </div>
                 
                <!--end quick info section -->
            </div>

            <div class="row">
                <div class="col-lg-8">



                    <!--Area chart example -->
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i>Products and Their Price
                           <!--  <div class="pull-right">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                        Actions
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu pull-right" role="menu">
                                        <li><a href="#">Action</a>
                                        </li>
                                        <li><a href="#">Another action</a>
                                        </li>
                                        <li><a href="#">Something else here</a>
                                        </li>
                                        <li class="divider"></li>
                                        <li><a href="#">Separated link</a>
                                        </li>
                                    </ul>
                                </div>
                            </div> -->
                        </div>

                        <div class="panel-body">
                            <div id="morris_bar"></div>
                        </div>

                    </div>
                    <!--End area chart example -->
                    <!--Simple table example -->
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i>Last few Sales
                           <!--  <div class="pull-right">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                        Actions
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu pull-right" role="menu">
                                        <li><a href="#">Action</a>
                                        </li>
                                        <li><a href="#">Another action</a>
                                        </li>
                                        <li><a href="#">Something else here</a>
                                        </li>
                                        <li class="divider"></li>
                                        <li><a href="#">Separated link</a>
                                        </li>
                                    </ul>
                                </div>
                            </div> -->
                        </div>

                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-hover table-striped">
                                            <thead>
                                                <tr>
                                                    <th>MODEL_NUMBER</th>
                                                    <th>PRICE</th>
                                                    <th>QUANTITY</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                    <% 
                                                    System.out.print("entiyty here"+entity);
                                                    if(entity != null){
                                    for(PurchaseDTO data:entity){ %>
                                        <tr>
                                            <td><%=data.getModelnumber() %></td>
                                             <td><%=data.getPrice() %></td>
                                              <td><%=data.getQuantity() %></td>
                                             
                                               
                                        </tr>
                                        <% }
                                        }%>

                                            </tbody>
                                        </table>
                                    </div>

                                </div>

                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!--End simple table example -->

                </div>

                <div class="col-lg-4">
                 
                    <div class="panel panel-primary text-center no-boder">
                        <div class="panel-body blue">
                            <i class="fa fa-pencil-square-o fa-3x"></i>
                            <h3> <%=dashboardData.optString("totalUsers")%>:Number of Registerd Users  </h3>
                        </div>
                      <!--   <div class="panel-footer">
                            <span class="panel-eyecandy-title">Number of Users
                    </div> -->
                            </span>
                        </div>
                    </div>
                       <div class="col-lg-4">
                    <!-- Donut Example-->
                    <div style="margin-top:25px;"class="panel panel-primary">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i>Donut Chart
                        </div>
                        <div class="panel-body">
                            <div id="morris_chart"></div>
<!--                             <a href="#" class="btn btn-default btn-block">View Details</a>
 -->                       
                            </div>

                    </div>
                    <!--End Donut Example-->
                </div>
                   






                </div>

            </div>

            <div class="row">
              <!--   <div class="col-lg-4">
                    Notifications
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <i class="fa fa-bell fa-fw"></i>Notifications Panel
                        </div>

                        <div class="panel-body">
                            <div class="list-group">
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-comment fa-fw"></i>New Comment
                                    <span class="pull-right text-muted small"><em>4 minutes ago</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-twitter fa-fw"></i>3 New Followers
                                    <span class="pull-right text-muted small"><em>12 minutes ago</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-envelope fa-fw"></i>Message Sent
                                    <span class="pull-right text-muted small"><em>27 minutes ago</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-tasks fa-fw"></i>New Task
                                    <span class="pull-right text-muted small"><em>43 minutes ago</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-upload fa-fw"></i>Server Rebooted
                                    <span class="pull-right text-muted small"><em>11:32 AM</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-bolt fa-fw"></i>Server Crashed!
                                    <span class="pull-right text-muted small"><em>11:13 AM</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-warning fa-fw"></i>Server Not Responding
                                    <span class="pull-right text-muted small"><em>10:57 AM</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-shopping-cart fa-fw"></i>New Order Placed
                                    <span class="pull-right text-muted small"><em>9:49 AM</em>
                                    </span>
                                </a>

                            </div>
                            /.list-group
                            <a href="#" class="btn btn-default btn-block">View All Alerts</a>
                        </div>

                    </div>
                    End Notifications
                </div> -->
            <!--     <div class="col-lg-3">
                    Donut Example
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i>Donut Chart Example
                        </div>
                        <div class="panel-body">
                            <div id="morris_chart"></div>
                            <a href="#" class="btn btn-default btn-block">View Details</a>
                        </div>

                    </div>
                    End Donut Example
                </div> -->
               <!--  <div class="col-lg-4">
                    Chat Panel Example
                    <div class="chat-panel panel panel-primary">
                        <div class="panel-heading">
                            <i class="fa fa-comments fa-fw"></i>
                            Chat
                            <div class="btn-group pull-right">
                                <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-chevron-down"></i>
                                </button>
                                <ul class="dropdown-menu slidedown">
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-refresh fa-fw"></i>Refresh
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-check-circle fa-fw"></i>Available
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-times fa-fw"></i>Busy
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-clock-o fa-fw"></i>Away
                                        </a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-sign-out fa-fw"></i>Sign Out
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="panel-body">
                            <ul class="chat">
                                <li class="left clearfix">
                                    <span class="chat-img pull-left">
                                        <img src="http://placehold.it/50/55C1E7/fff" alt="User Avatar" class="img-circle" />
                                    </span>
                                    <div class="chat-body clearfix">
                                        <div class="header">
                                            <strong class="primary-font">Jack Sparrow</strong>
                                            <small class="pull-right text-muted">
                                                <i class="fa fa-clock-o fa-fw"></i>12 mins ago
                                            </small>
                                        </div>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.
                                        </p>
                                    </div>
                                </li>
                                <li class="right clearfix">
                                    <span class="chat-img pull-right">
                                        <img src="http://placehold.it/50/FA6F57/fff" alt="User Avatar" class="img-circle" />
                                    </span>
                                    <div class="chat-body clearfix">
                                        <div class="header">
                                            <small class=" text-muted">
                                                <i class="fa fa-clock-o fa-fw"></i>13 mins ago</small>
                                            <strong class="pull-right primary-font">Bhaumik Patel</strong>
                                        </div>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.
                                        </p>
                                    </div>
                                </li>
                                <li class="left clearfix">
                                    <span class="chat-img pull-left">
                                        <img src="http://placehold.it/50/55C1E7/fff" alt="User Avatar" class="img-circle" />
                                    </span>
                                    <div class="chat-body clearfix">
                                        <div class="header">
                                            <strong class="primary-font">Jack Sparrow</strong>
                                            <small class="pull-right text-muted">
                                                <i class="fa fa-clock-o fa-fw"></i>14 mins ago</small>
                                        </div>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.
                                        </p>
                                    </div>
                                </li>
                                <li class="right clearfix">
                                    <span class="chat-img pull-right">
                                        <img src="http://placehold.it/50/FA6F57/fff" alt="User Avatar" class="img-circle" />
                                    </span>
                                    <div class="chat-body clearfix">
                                        <div class="header">
                                            <small class=" text-muted">
                                                <i class="fa fa-clock-o fa-fw"></i>15 mins ago</small>
                                            <strong class="pull-right primary-font">Bhaumik Patel</strong>
                                        </div>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.
                                        </p>
                                    </div>
                                </li>
                            </ul>
                        </div>

                        <div class="panel-footer">
                            <div class="input-group">
                                <input id="btn-input" type="text" class="form-control input-sm" placeholder="Type your message here..." />
                                <span class="input-group-btn">
                                    <button class="btn btn-warning btn-sm" id="btn-chat">
                                        Send
                                    </button>
                                </span>
                            </div>
                        </div>

                    </div>
                    End Chat Panel Example
                </div> -->
            </div>


         


        </div>
        <!-- end page-wrapper -->

    </div>
    <!-- end wrapper -->

    <!-- Core Scripts - Include with every page -->
    <script src="assets/plugins/jquery-1.10.2.js"></script>
    <script src="assets/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="assets/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="assets/plugins/pace/pace.js"></script>
    <script src="assets/scripts/siminta.js"></script>
    <!-- Page-Level Plugin Scripts-->
    <script src="assets/plugins/morris/raphael-2.1.0.min.js"></script>
    <script src="assets/plugins/morris/morris.js"></script>
    <script src="assets/scripts/dashboard-demo.js"></script>
 
    <script>

    function data(){
    	 /* $(document).ready(function() { */
        		 var reqData = "";
           /* 	  reqData += "&firstName="+document.getElementById("firstName").value;
           	reqData += "&lastName="+document.getElementById("lastName").value;
           	reqData += "&address="+document.getElementById("address").value;
           	reqData += "&contact="+document.getElementById("contact").value;
           	reqData += "&password="+document.getElementById("password").value;
           	reqData += "&userType="+document.getElementById("userType").value; */
        	reqData += "&userAction=0";
             	$.get( "PurchaseServlet",
                      reqData,
                      function(data) {
                      }
                   );
    	 }
    	/*  $(document).ready(function(){
    		 var donut_chart=Morris.Donut({
    			 element: 'morris-donut-chart',
    		        data: [{
    		            label: "TOTAL PRODUCTS",
    		            value: 12
    		        }, {
    		            label: "SOLD PRODUCTS",
    		            value: 30
    		        }, {
    		            label: "STOCK LEFT",
    		            value: 20
    		        }],
    		        resize: true
    		 
    		 });
    		 
    	 
    	 }); */
    	 Morris.Donut({
    		  element: 'morris_chart',
    		  data: [
    		    {label: "SOLD PRODUCTS", value:<%=dashboardData.optString("productsSold")%>},
    		    {label: "STOCK LEFT", value:<%=dashboardData.optString("productsLeft")%>}
    		  ]
    		});
    	  Morris.Bar({
    	        element: 'morris_bar',
    	        data:<%=dashData%>
    	        	<%-- [
    	           
    	            
    	            {
    	            y: 'TOTAL PRODUCTS',
    	            a: <%=dashboardData.optString("totalProducts")%>
    	          
    	        }, {
    	            y: 'SOLD PRODUCTS',
    	            a: <%=dashboardData.optString("productsSold")%>
    	           
    	        }, {
    	            y: 'STOCK LEFT',
    	            a: <%=dashboardData.optString("productsLeft")%>
    	        
    	        }] --%>
    	  ,
    	        xkey: 'y',
    	       // ykeys: ['a', 'b'],
    	       ykeys: ['a'],
    	      //  labels: ['Series A', 'Series B'],
    	       labels: ['Price'], 
    	      hideHover: 'auto',
    	        resize: true
    	    });
    	
    	 
    	    	 
 
    </script>

</body>

</html>
