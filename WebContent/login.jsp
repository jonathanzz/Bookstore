<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Sergey Pozhilov (GetTemplate.com)">
<title>sign in</title>
<link rel="stylesheet" media="screen"
	href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/bootstrap-theme.css"
	media="screen">
<link rel="stylesheet" href="assets/css/main.css">
<!-- <script src="assets/js/html5shiv.js"></script>
<script src="assets/js/respond.min.js"></script> -->
</head>
<body>
	<jsp:include page="header.jsp" />

	<header id="head" class="secondary"></header>

	<!-- container -->
	<div class="container">

		<ol class="breadcrumb">
			<li><a href="index.jsp">Home</a></li>
			<li class="active">User access</li>
		</ol>
		<div class="row">

			<!-- Article main content -->
			<article class="col-xs-12 maincontent"> <header
				class="page-header">
			<h1 class="page-title">Sign in</h1>
			</header>
			<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
				<div class="panel panel-default">
					<div class="panel-body">
						<h3 class="thin text-center">Sign in to your account</h3>
						<p class="text-center text-muted">
							New to our BookStore? <a href="register.jsp">Register</a> a new
							account first.
						</p>
						<%
							String status = (String) request.getAttribute("status");
							if (status != null) {
						%>
						<div
							style="padding: 4px 10px; color: rgb(255, 0, 0); font-size: 13px; font-weight: bold;">
							<center><%=status%></center>
						</div>
						<%
							}
						%>
						<hr>
						<form action="<%=request.getContextPath()%>/user" method="post">
							<div class="top-margin">
								<label>Username/Email <span class="text-danger">*</span></label>
								<input name="username" type="text" class="form-control">
							</div>
							<div class="top-margin">
								<label>Password <span class="text-danger">*</span></label> <input
									name="password" type="password" class="form-control">
							</div>

							<hr>

							<div class="row">
								<div class="col-lg-4 text-right">
									<input style = "margin-left: 400px" class="btn button4" name="user" type='submit' value='login' />
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

			</article>
			<!-- /Article -->

		</div>
	</div>
	<!-- /container -->

	<jsp:include page="footer.jsp" />
</body>
</html>