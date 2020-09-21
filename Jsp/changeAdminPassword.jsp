<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<div class="navbar navbar-inverse set-radius-zero">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand"> <img
					src="assets/img/logo.png" />
				</a>
			</div>

			<div class="right-div">
				<a href="logout.jsp" class="btn btn-info pull-right">LOG ME OUT</a>
			</div>
		</div>
	</div>
	<jsp:include page="adminHeader.jsp"></jsp:include>
	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">Change Password</h4>

				</div>
			</div>
			<div class="row">
				<%
				Connection connection = DatabaseConnection.getConnection();
				Statement statement = connection.createStatement();
				ResultSet resultSet = statement.executeQuery("select * from tbladmin where uname='" + session.getAttribute("uname") + "'");
				while (resultSet.next()) {
				%>
				<div class="col-md-8 col-sm-8 col-xs-12">
					<div class="panel panel-danger">
						<div class="panel-heading">Change Password</div>
						<div class="panel-body">
							<form action="AdminPasswordChange" method="post">
								<div class="form-group">
									<label>Current Password.:</label> <input type="text"
										name="cpassword" class="form-control"
										value="<%=resultSet.getString(3)%>" readonly>
								</div>
								<div class="form-group">
									<label>New Password.:</label> <input type="password"
										name="password" class="form-control" value="">
								</div>
								<div class="form-group">
									<label>Re Type Password.:</label> <input type="password"
										name="confpass" class="form-control" value="">
								</div>
								<div class="form-group">
									<label for="message" class="col-4 col-form-label"></label>
									<div class="col-8">
										<input type="submit" value="Change Password"
											class="btn btn-primary"> <input type="reset"
											value="Reset" class="btn btn-danger">
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<%
					}
				%>
			</div>
		</div>
	</div>
	<!-- CONTENT-WRAPPER SECTION END-->
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
	<%
		} else {
	response.sendRedirect("index.jsp");
	}
	%>
</body>
</html>
