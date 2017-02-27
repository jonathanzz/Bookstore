<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>register ok</title>
<link
	href="http://www.gbtags.com/gb/networks/uploads/8dedafe6-e613-4a38-bd77-fdfa5181fd3a/css/bootstrap.css"
	rel="stylesheet">
<link
	href="http://www.gbtags.com/gb/networks/uploads/8dedafe6-e613-4a38-bd77-fdfa5181fd3a/css/bootstrap-theme.css"
	rel="stylesheet">
<link
	href="http://www.gbtags.com/gb/networks/uploads/8dedafe6-e613-4a38-bd77-fdfa5181fd3a/css/animate.css"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="header.jsp" />
	<header id="head" class="secondary"></header>
	<br>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-md-8">
				<h3>Congratulations! We have send a confirm email to you.
					Please check your email box and click the url in the confirm email
					to finish register. Thank you!</h3><br>
				<h4>jump automatically after 3 seconds..</h4>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-8">
				<div class="progress">
					<div class="progress-bar progress-bar-success progress-bar-striped active"
						role="progressbar" aria-valuemin="0" aria-valuemax="80"
						style="width: 80%;"></div>
				</div>
				<%
					response.setHeader("Refresh", "3;URL=index.jsp");
				%>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>



	<jsp:include page="footer.jsp" />

</body>
</html>