<%@page import="com.factory.DAOFactory,com.vo.*,com.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>register</title>
<script src="assets/js/usercheck.js"></script>
<SCRIPT LANGUAGE="javascript">
	function sub() {
		var form = document.getElementById("register");
		if (check()) {
			if (undersub())
				form.submit();
		}
	}
	function undersub() {
		var term = document.getElementById("term");
		var name = document.getElementById("name").value;
		var pwd = document.getElementById("pwd").value;
		var email = document.getElementById("email").value;
		if(name.length==0||pwd.length==0){
			document.getElementById("error").innerHTML = "Username or password can not be empty!";
			return false;
		}else
			document.getElementById("error").innerHTML ="";
		if(email.length==0){
			document.getElementById("error").innerHTML = "Email address can not be empty!";
			return false;
		}else
			document.getElementById("error").innerHTML ="";
			
		if (!term.checked) {
			document.getElementById("error").innerHTML = "Please agree the terms and conditions!";
			return false;
		} else
			document.getElementById("error").innerHTML = "";
		return true;
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp" />

	<header id="head" class="secondary"></header>

	<!-- container -->
	<div class="container">

		<ol class="breadcrumb">
			<li><a href="index.jsp">Home</a></li>
			<li class="active">Registration</li>
		</ol>

		<div class="row">

			<!-- Article main content -->
			<article class="col-xs-12 maincontent"> <header
				class="page-header">
			<h1 class="page-title">Registration</h1>
			</header>

			<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
				<div class="panel panel-default">
					<div class="panel-body">
						<h3 class="thin text-center">Register a new account</h3>
						<p class="text-center text-muted">
							Already have an account? <a href="login.jsp">Login</a>
						</p>
						<center>
							<div id="error"
								style="padding: 4px 10px; color: rgb(255, 0, 0); font-size: 13px; font-weight: bold;">

								<%
									String status = (String) request.getAttribute("status");
									if (status != null) {
								%><%=status%>
								<%
									}
								%>
							</div>
						</center>
						<hr>
						<form action="user" method="post" id="register">
							<div class="top-margin">
								<label>Username <span class="text-danger">*</span></label> <input
									id="name" type="text" name="rusername" class="form-control"
									onClick="check()">
							</div>
							<div class="row top-margin">
								<div class="col-sm-6">
									<label>Password <span class="text-danger">*</span></label> <input
										id="pwd" type="text" name="rpassword" class="form-control"
										onClick="check()">
								</div>
								<div class="col-sm-6">
									<label>Confirm Password <span class="text-danger">*</span></label>
									<input id="cfpwd" type="text" name="cfpassword"
										class="form-control">
								</div>
							</div>
							<div class="top-margin">
								<label>Email Address <span class="text-danger">*</span></label>
								<input id="email" type="text" name="email" class="form-control"
									onClick="check()">
							</div>
							<div class="top-margin">
								<label>Nick Name</label> <input type="text" name="nickname"
									class="form-control" onClick="check()">
							</div>
							<div class="top-margin">
								<label>First Name</label> <input type="text" name="firstName"
									class="form-control" onClick="check()">
							</div>

							<div class="top-margin">
								<label>Last Name</label> <input type="text" name="lastName"
									class="form-control" onClick="check()">
							</div>
							<div class="top-margin">
								<label>Address</label> <input type="text" name="address"
									class="form-control" onClick="check()">
							</div>

							<div class="top-margin">
								<label>Year of Birth</label> <input onKeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))"
									style="ime-mode: Disabled" type="text" name="birth"
									class="form-control" onClick="check()">
							</div>
							<div class="top-margin">
								<label>Credit Card Num</label> <input onKeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))"
									style="ime-mode: Disabled" type="text" name="cardNum"
									class="form-control" onClick="check()">
							</div>


							<hr>

							<div class="row">
								<div class="col-lg-8">
									<label><input id="term" type="checkbox" name="terms"
										value="value" onClick="check()"> I've read the <a
										href="terms.jsp">Terms and Conditions</a> </label>
								</div>
								<div class="col-lg-4 text-right">
									<input class = "button4" type='button' value='register' onClick="sub()" /> <input
										type="hidden" name="user" value="register" />
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