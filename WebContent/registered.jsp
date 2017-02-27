<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.dao.*,com.vo.*,com.factory.*,com.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="assets/css/buttons.css">
<title>registered</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<header id="head" class="secondary"></header>
	<%
		boolean isSuccess = false;
		String username = (String) request.getParameter("user");
		String md5 = (String) request.getParameter("md5");
		if (username.equals(request.getSession().getAttribute("newuser"))
				&& md5.equals(request.getSession().getAttribute("md5"))) {
			isSuccess = true;
		}
		if (isSuccess == true) {
		User user = DAOFactory.getIUsrDAOInstance()
				.findByUserName(username);
		user.setConfirm(true);
		DAOFactory.getIUsrDAOInstance().updateInf(user);
		request.getSession().setAttribute("username", user.getUsername());
	%>
	<br>
	<br>
	<br>
	<div class="container"
		style="padding: 4px 10px; color: rgb(204, 102, 0); font-size: 20px; font-weight: bold;">
		<span class="glyphicon glyphicon-ok"></span>Congratulations dear
		<%=user.getUsername()%>!<br> You've successfully become a member
		of DuangDuang Bookstore.<br>
		<br>
		<br>
		<br>
	</div>

	<div class="container">
		<a class="button4" href="accountinfo.jsp">Go to my account</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
			class="button4" href="index.jsp">Back to homepage</a>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<%
		}
	%>
	<jsp:include page="footer.jsp" />
</body>
</html>