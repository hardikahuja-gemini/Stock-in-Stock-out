<!DOCTYPE html>
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

</head>

<body class="body-Login-back">

    <div class="container">
       
        <div class="row">
            <div class="col-md-6 col-md-offset-3 text-center logo-margin ">
              <img src="assets/img/logo.png" alt=""/>
                </div>
            <div class="col-md-6 col-md-offset-3">
                <div class="login-panel panel panel-default">                  
                    <div class="panel-heading">
                        <h3 class="panel-title">Enter your Details</h3>
                    </div>
                    <div class="panel-body">
                        <form  method="post" action="MyServlet">
                            <fieldset>
                            <input type="hidden" value=0 name="userAction">
                                <div class="form-group col-md-6">
                                    <input class="form-control" placeholder="First Name" name="firstName" type="text" autofocus required>
                                </div>
                                <div class="form-group col-md-6">
                                    <input class="form-control" placeholder="Last Name" name="lastName" type="text" autofocus required>
                                </div>
                                <div class="form-group col-md-12">
                                    <input class="form-control" placeholder="Address" name="address" type="text" value="" required>
                                </div>
                                   <div class="form-group col-md-6">
                                    <input class="form-control" placeholder="Email" name="email" type="email" autofocus required>
                                </div>
                                <div class="form-group col-md-6">
                                    <input class="form-control" placeholder="contact" name="contact" type="text" autofocus required>
                                </div>
                                <div class="form-group col-md-6">
                                    <input class="form-control" placeholder="password" name="password" type="text" autofocus required>
                                </div>
                                <div class="form-group col-md-6">
                                    <input class="form-control" placeholder="confirm password" name="cpassword" type="text" autofocus required>
                                </div>
                                <input type="hidden" name="userType" value="user"/>
                               <div class="form-group col-md-12 center">
    <input type="submit" class="btn btn-lg btn-success btn-block" value="Register"/>
                </div>
                            </fieldset>
                        </form>
                    </div>
                    <div style="padding-bottom: 7px; padding-left:7px;">
                    <a href="Login.jsp">Click here to Sign In</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

     <!-- Core Scripts - Include with every page -->
    <script src="assets/plugins/jquery-1.10.2.js"></script>
    <script src="assets/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="assets/plugins/metisMenu/jquery.metisMenu.js"></script>

</body>

</html>
