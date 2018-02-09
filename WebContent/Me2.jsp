<!DOCTYPE html>
<%@page import="com.demo.dto.RegisterProductsDTO"%>
<%@page import="com.demo.dto.RegisterDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.Student"%>
<%@page import="java.util.List"%>
<%@page import="com.model.Model"%>
<%@page import="java.util.*"%>


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

    <%List<RegisterProductsDTO> entity = (List<RegisterProductsDTO>)(request.getAttribute("entity")); 
    List<String> name=(List<String>)request.getAttribute("name");
   	String elem = "";
    System.out.println("here1");
    %>
    
    
   
    
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
               

               

<!-- 
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-3x"></i>
                    </a>
                    dropdown user
                    <ul class="dropdown-menu dropdown-user">
                      
                        <li class="divider"></li>
                        <li><a href="Login.jsp"><i class="fa fa-sign-out fa-fw"></i>Logout</a>
                        </li>
                    </ul>
                    end dropdown-user
                </li> -->
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
                    <%-- <li>
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
                    </li> --%>
                 <!--    <li class="sidebar-search">
                        search section
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="Search...">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                        </div>
                        end search section
                    </li> -->
                    <li>
                        <a href="Me2.jsp"><i class="fa fa-dashboard fa-fw"></i>ALL ITEMS</a>
                    </li>
                   <%--    <%
                      System.out.println("here3"+userType);
                    if(!userType.isEmpty() && userType.equals("admin")){
                    %> --%>
                    <%Iterator<String> itr = name.iterator();
            		while(itr.hasNext()){
            			elem = itr.next();
            		
            		%>
                   
               <li>
                        <a onclick="particular('<%=elem%>')"  href="#"><i class="fa fa-dashboard fa-fw"></i><%=elem%></a>
                    </li>
                   
                   
                    <%} %>
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
                    <h1 class="page-header">WE HAVE WHAT YOU WANT..</h1>
                </div>
                 <!-- end  page header -->
            </div>
 
 			<div class="row">
 			<form method="post" action="MyServletProduct">
 			<input type="hidden" value=1 name="userAction"/>
 			
<!--  			<input type="submit" name="showData" value="showData"/>
 --> 			</form>
 			</div>
 			
            <div class="row">
                <div class="col-lg-12">
                  <!--   Kitchen Sink -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Product Details
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Model Number</th>
                                            <th>Product Name</th>
                                            <th>Colour</th>
                                            <th>Price</th>
                                            <th>Stock</th>
                                             
                                        </tr>
                                    </thead>
<!--                                     <div id="dataTables-example_filter" class="dataTables_filter"><label>Search:<input type="search" class="form-control input-sm" aria-controls="dataTables-example"></label></div>
 -->                                    <tbody>
                                    <%
                                    System.out.println("here5");
                                    if(entity!= null){
                                    for(RegisterProductsDTO data:entity){ %>
                                        <tr>
                                            <td><%=data.getModelnumber()%></td>
                                             <td><%=data.getProductname() %></td>
                                              <td><%=data.getColour() %></td>
                                               <td><%=data.getPrice() %></td>
                                               <td><%=data.getStock()%></td>
                                              
                                                
                                                <td><input type="submit" name=<%=data.getProductId()%> value="BUY" onclick="updatefun('<%=data.getProductId()%>')"/></td>
                                       <%}
                                                System.out.println("here6");%>
                                        </tr>
                                        
                                        <% }
                                        %>
                                       
                  
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
    <script type="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script>
    $(document).ready(function() {
        // Setup - add a text input to each footer cell
        $('#dataTables-example tfoot th').each( function () {
            var title = $(this).text();
            $(this).html( '<input type="text" placeholder="Search '+title+'" />' );
        } );
     
        // DataTable
        var table = $('#dataTables-example').DataTable();
     
        // Apply the search
        table.columns().every( function () {
            var that = this;
     
            $( 'input', this.footer() ).on( 'keyup change', function () {
                if ( that.search() !== this.value ) {
                    that
                        .search( this.value )
                        .draw();
                }
            } );
        } );
    } );
    </script>
    <script>
    function updatefun(productId){
    	alert("called");
    	window.location.href="<%=request.getContextPath()%>/MainServlet?productId="+productId+"&userAction=2";
    	//get call update.java
    }
    function particular(proname)
    {/* var reqData="";
    reqData+="userAction=4";
    reqData+="&productname="+proname;

    	$.get( "MainServlet",
                reqData,
                function(data) {
    		alert(data);
    	}
                
             ); */
    	window.location.href="<%=request.getContextPath()%>/MainServlet?productname="+proname+"&userAction=4";
                    }
    
    </script>

</body>

</html>
