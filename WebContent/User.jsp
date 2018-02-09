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
  
     
     if(userType == null)
    	 userType = (String) request.getAttribute("userType");
     if(userType != null){
     request.setAttribute("userType", userType);
     }
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
                                <div><%=firstName%> <strong><%=lastName %></strong></div>
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
                <div class="col-lg-12">
                    <h1 class="page-header">Tables</h1>
                </div>
                 <!-- end  page header -->
            </div>
 
 			<div class="row">
 			<form method="post" action="MyServlet">
 			<input type="hidden" value=1 name="userAction"/>
 			 <input type="hidden" value=<%=request.getAttribute("firstName") %> name="firstName"/>
 			<input type="hidden" value=<%=request.getAttribute("lastName") %> name="lastName"/>
 			<input type="hidden" value=<%=request.getAttribute("userType") %> name="userType"/>			
 			<input type="submit" name="showData" value="showData"/>
 			</form>
 			</div>
 			
            <div class="row">
                <div class="col-lg-12">
                  <!--   Kitchen Sink -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            User Details
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>Contact</th>
                                            <th>Address</th>
                                             <th>Email</th>
                                        </tr>
                                    </thead>
                                    <div id="dataTables-example_filter" class="dataTables_filter"><label>Search:<input type="search" class="form-control input-sm" aria-controls="dataTables-example"></label></div>
                                    <tbody>
                                    <% if(entity != null){
                                    for(RegisterDTO data:entity){ %>
                                        <tr>
                                            <td><%=data.getId() %></td>
                                             <td><%=data.getFirstName() %></td>
                                              <td><%=data.getLastName() %></td>
                                               <td><%=data.getContact() %></td>
                                               <td><%=data.getAddress()%></td>
                                                <td><%=data.getEmail() %></td>
                                                 <%
                                                 if(!userType.isEmpty() && userType.equals("admin")){
                                                    %>
                                                <td><input type="submit" name=<%=data.getId()%> value="edit" onclick="updatefun('<%=data.getId()%>')"/></td>
                                                    <%} %>
                                        </tr>
                                        <% }
                                        }%>
                                       
                  
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                     <!-- End  Kitchen Sink -->
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
    <script>
        $(document).ready(function () {
            $('#dataTables-example').dataTable();
        });
    </script>
    <script>
    function updatefun(id){
    	
    	window.location.href="<%=request.getContextPath()%>/MyServlet?id="+id+"&userAction=2";
    	//get call update.java
    }
    </script>

</body>

</html>
