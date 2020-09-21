<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.connection.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="description" content="" />
<meta name="author" content="" />
<!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
<title>Online Exam System</title>
<!-- BOOTSTRAP CORE STYLE  -->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONT AWESOME STYLE  -->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!-- CUSTOM STYLE  -->
<link href="assets/css/style.css" rel="stylesheet" />
<!-- GOOGLE FONT -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
</head>
<body>
	<div class="navbar navbar-inverse set-radius-zero">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp"> <img
					src="images/logo.jpg" style="width: 200px; height: 70px;" />
				</a>
			</div>
		</div>
	</div>
	<section class="menu-section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="navbar-collapse collapse ">
					<ul id="menu-top" class="nav navbar-nav navbar-right">
						<li><a href="index.jsp">Home</a></li>
						<li><a href="studentLogin.jsp">Student Login</a></li>
						<li><a href="adminLogin.jsp">Admin Login</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	</section>
	<%
	String captcha = null;
	Connection connection = DatabaseConnection.getConnection();
	Statement statement = connection.createStatement();
	ResultSet resultset = statement.executeQuery("select captcha from tblcaptcha");
	if (resultset.next()) {
		captcha = resultset.getString(1);
	}
	%>
	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">Student Login</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-sm-6 col-xs-12">
					<img src="images/student.png" style="width: 250px; height: 250px;">
				</div>
				<div class="col-md-6 col-sm-6 col-xs-12">
					<div class="panel panel-info">
						<div class="panel-heading">Student Login</div>
						<div class="panel-body">
							<form action="StudentLogin" method="post">
								<div class="form-group">
									<label>User Name.:</label> <input type="text" name="uname"
										class="form-control">
								</div>
								<div class="form-group">
									<label>Password.:</label> <input type="password" name="upass"
										class="form-control">
								</div>
								<div class="form-group">
									<label>Verification code : </label> <input type="text"
										class="form-control1" name="vercode" maxlength="5"
										autocomplete="off" required style="height: 25px;" />&nbsp;<input
										type="text" name="captcha" value="<%=captcha%>" disabled
										style="height: 25px; width: 80px;">

								</div>

								<input type="submit" value="Student Login"
									class="btn btn-primary"> <input type="reset"
									value="Clear" class="btn btn-danger">
							</form>
						</div>
					</div>
				</div>
			</div>
			<!--/.ROW-->
		</div>
	</div>
	<section class="footer-section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">&copy; 2020 DEA Assignment</div>

		</div>
	</div>
	</section>
	<!-- FOOTER SECTION END-->
	<!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
	<!-- CORE JQUERY  -->
	<script src="assets/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS  -->
	<script src="assets/js/bootstrap.js"></script>
	<!-- CUSTOM SCRIPTS  -->
	<script src="assets/js/custom.js"></script>
	<script>
		(function(i, s, o, g, r, a, m) {
			i['GoogleAnalyticsObject'] = r;
			i[r] = i[r] || function() {
				(i[r].q = i[r].q || []).push(arguments)
			}, i[r].l = 1 * new Date();
			a = s.createElement(o), m = s.getElementsByTagName(o)[0];
			a.async = 1;
			a.src = g;
			m.parentNode.insertBefore(a, m)
		})
				(
						window,
						document,
						'script',
						'../../../../../../www.google-analytics.com/analytics.js',
						'ga');

		ga('create', 'UA-58127580-1', 'auto');
		ga('send', 'pageview');
	</script>
</body>
</html>