<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<script type="text/javascript">
	function loglogout() {
		document.getElementById("loglogout").submit();
	}
</script>
</head>
<body>

	<div>
		<div class="footer1">
			<div class="container">
				<div class="row">

					<div class="col-md-5 widget">

						<div class="container">
							<div class="row">
								<div class="col-md-1">
									<a href="https://www.unsw.edu.au/"> <img
										src="assets/images/UNSW.png" width="90" height="95" />
									</a>
								</div>
								<div class="col-md-1">
									<a href="https://www.unsw.edu.au/">
										<h3 style="color: white">UNSW</h3>
									</a>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-4 widget">
						<h3 class="widget-title">Contact us</h3>
						<div class="widget-body">
							<p>
								+61 041*******<br> <a href="mailto:#">z5******@zmail.unsw.edu.au</a><br>
								<br> 7/803 Anzac Parade Maroubra, NSW 2035, Sydney
								Australia
							</p>
						</div>
					</div>
					<div class="col-md-3 widget">
						<h3 class="widget-title">Follow us</h3>
						<div class="widget-body">
							<p class="follow-me-icons clearfix">
								<a href="https://www.twitter.com"><i
									class="fa fa-twitter fa-2"></i></a> <a
									href="https://www.facebook.com"><i
									class="fa fa-facebook fa-2"></i></a>
							</p>
						</div>
					</div>
				</div>

				<!-- /row of widgets -->
			</div>
		</div>

		<div class="footer2">
			<div class="container">
				<div class="row">
					<form action="user" method="post" id="loglogout">
						<div class="col-md-6 widget">
							<div class="widget-body">
								<p class="simplenav">
									<%
										if (request.getSession().getAttribute("username") == null) {
									%>
									<a class="active" href="#">Home</a> | <a
										href="advancedSearch.jsp">AdvancedSearch</a> |<a
										href="login.jsp">Sign In</a>
									<%
										} else {
											String username = (String) request.getSession().getAttribute(
													"username");
									%>
									<a class="active" href="#">Home</a> | <a
										href="advancedSearch.jsp">AdvancedSearch</a> |<a
										onclick="loglogout()">Sign Out</a><input type="hidden"
										name="user" value="logout">
									<%
										}
									%>
								</p>
							</div>
						</div>
					</form>
					<div class="col-md-6 widget">
						<div class="widget-body">
							<p class="text-right">Copyright &copy; 2015, Designed by
								DuangDuang</p>
						</div>
					</div>

				</div>
				<!-- /row of widgets -->
			</div>
		</div>
		</footer>
	</div>

	<script src="assets/js/jquery-2.1.1.min.js"></script>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script
		src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<script src="assets/js/headroom.min.js"></script>
	<script src="assets/js/jQuery.headroom.min.js"></script>
	<script src="assets/js/template.js"></script>
</body>
</html>