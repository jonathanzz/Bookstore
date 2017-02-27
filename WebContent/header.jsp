<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Sergey Pozhilov (GetTemplate.com)">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Wowphotos Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<title>header</title>
<link href="assets/css/buttons.css" rel="stylesheet">
<link rel="stylesheet" media="screen"
	href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/bootstrap-theme.css"
	media="screen">
<link rel="stylesheet" href="assets/css/main.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="assets/js/html5shiv.js"></script>
<script src="assets/js/respond.min.js"></script>
<link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all">
<link href="assets/css/carstyle.css" rel="stylesheet" type="text/css"
	media="all" />
<link
	href='http://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700'
	rel='stylesheet' type='text/css'>

<script type="text/javascript" src="assets/js/jquery.1.4.2-min.js"></script>
<script type="text/javascript" src="assets/js/Calculation.js"></script>
<script type="application/x-javascript">
	
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 



</script>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.easydropdown.js"></script>
<script>
	$(document).ready(function(c) {
		$('.alert-close').on('click', function(c) {
			$('.message').fadeOut('slow', function(c) {
				$('.message').remove();
			});
		});
	});
</script>
<script>
	$(document).ready(function(c) {
		$('.alert-close1').on('click', function(c) {
			$('.message1').fadeOut('slow', function(c) {
				$('.message1').remove();
			});
		});
	});
</script>
<style>
.demo {
	display: inline-block;
	*display: inline;
	*zoom: 1;
	width: 140px;
	height: 20px;
	line-height: 20px;
	font-size: 12px;
	overflow: hidden;
	-ms-text-overflow: ellipsis;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.demo:hover {
	height: auto;
	white-space: normal;
}
</style>
<script type="text/javascript">
function logout(){
	document.getElementById("logout").submit();
}</script>
</head>
<body>
	<!-- Fixed navbar -->
	<div class="navbar navbar-inverse navbar-fixed-top headroom">
		<div class="container">
			<div class="navbar-header">
				<!-- Button for smallest screens -->
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a></a>
				<div class="navbar-header">
					<a class="navbar-brand" href="index.jsp">BookStore</a>
				</div>
			</div>

			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav pull-right">
					<li><a href="index.jsp">Home</a></li>
					<li><a href="advancedSearch.jsp">AdvancedSearch</a></li>
					<%
						if (request.getSession().getAttribute("username") == null) {
					%>
					<li><a class="btn" href="login.jsp">SIGN IN</a></li>
					<%
						} else {
							String username = (String) request.getSession().getAttribute(
									"username");
					%>
					<li><a href="cart.jsp">Cart</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><%=username%><b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="accountinfo.jsp">information</a></li>
							<li><a href="myorder.jsp">My Order</a></li>
							<li><a href="addBook.jsp">Sell Book</a></li>
							<li><a href="onsell.jsp">On Sell</a></li>
							<li><a href="changepass.jsp">Change Password</a></li>
							<li><a onclick="logout()">Sign Out</a></li>
						</ul></li>
					<%
						}
					%>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>
	<form action="user" method="post" id="logout">
	<input type="hidden" name="user" value="logout"></form>
	<!-- /.navbar -->
</body>
</html>