
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
<title>Insert title here</title>
</head>
<%    List<RegisterProductsDTO> products = (List<RegisterProductsDTO>)request.getAttribute("entity"); 
JSONObject map= new JSONObject(request.getAttribute("ent").toString());
String mapData = map.toString();
request.setAttribute("entity", products);
request.setAttribute("ent", map);
%>
<body>


            
            <div class="row">
                 <!--  page header -->
                <div class="col-lg-12">
                    <h1 class="page-header" style="color:blue;text-align:center;">SIMINTA SPORTS</h1>
                </div>
                 <!-- end  page header -->
            </div>
 
 			
            <div class="row">
                <div class="col-lg-12">
                  <!--   Kitchen Sink -->
                    <div class="panel panel-default">
                        <div style="text-align: center;" class="panel-heading">
                           Buy Your favourite Products On Siminta 
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Model Number</th>
                                            <th>Product Name</th>
                                            <th>Colour</th>
                                            <th>Price</th>
                                            <th>Stock</th>
                                             
                                        </tr>
                                    </thead>
                                    <div id="dataTables-example_filter" class="dataTables_filter"><label>Search:<input type="search" class="form-control input-sm" aria-controls="dataTables-example"></label></div>
                                    <tbody>
                                    <%
                                    System.out.println("here5");
                                    if(products!= null){
                                    for(RegisterProductsDTO data:products){ %>
                                        <tr>
                                            <td><%=data.getModelnumber()%></td>
                                             <td><%=data.getProductname() %></td>
                                              <td><%=data.getColour() %></td>
                                               <td><%=data.getPrice() %></td>
                                               <td><%=data.getStock()%></td>
                                               
                                                
                                                <td><input type="submit" class="btn btn-default btn-sm" name=<%=data.getProductId()%> value="BUY" onclick="updatefun('<%=data.getProductId()%>')"/></td>
                                     
                                             
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
    function updatefun(productId){
    	alert("called");
    <%-- 	var json = '<%=mapData%>';
    	var productData = '<%=products.toString()%>'; --%>
<%--     	window.location.href="<%=request.getContextPath()%>/Confirm.jsp?modelnumber="+modelnumber+"&map="+json+"&products="+productData+"";
 --%>    	//get call update.java
	window.location.href="<%=request.getContextPath()%>/MainServlet?productId="+productId+"&userAction=2";

 
    }
    </script>

</body>
</html>