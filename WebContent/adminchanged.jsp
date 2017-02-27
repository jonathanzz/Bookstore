<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Change Password</title>
<link rel="stylesheet" media="screen"
	href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/bootstrap-theme.css"
	media="screen">
<link rel="stylesheet" href="assets/css/main.css">
<!-- Bootstrap -->
<link href="assets/admin/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<link href="assets/admin/bootstrap/css/bootstrap-responsive.min.css"
	rel="stylesheet" media="screen">
<link href="assets/admin/assets/styles.css" rel="stylesheet"
	media="screen">
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<script src="assets/admin/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
</head>
<body>
	<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
		<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-signin" action="admin" method="post">
					<h2 class="form-signin-heading">Change Password</h2>
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
					<input name="current" type="text" class="input-block-level"
						placeholder="Current Password"> <input name="new"
						type="text" class="input-block-level" placeholder="New Password">
					<input name="confirm" type="password" class="input-block-level"
						placeholder="Confirm Password"> <input
						class="btn btn-large btn-primary" type="submit" value='OK' /> <input
						name="admin" value="pwdchange" type="hidden" />
				</form>
			</div>
		</div>
	</div>
	<!-- /container -->
	<script src="assets/admin/vendors/jquery-1.9.1.min.js"></script>
	<script src="assets/admin/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>