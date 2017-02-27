<%@page
	import="com.factory.DAOFactory,com.vo.*,com.servlet.*,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Account Information</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<header id="head" class="secondary"></header>
	<%
		String username = (String) request.getSession().getAttribute(
				"username");
		User user = DAOFactory.getIUsrDAOInstance()
				.findByUserName(username);
	%>

	<%
		String bookkey = request.getParameter("key");
		Books book = DAOFactory.getIBooksDAOInstance().findByBookkey(
				bookkey);
	%>
	<!-- ________________________________分割线________________________________ -->
	<div class="main">
		<div class="main-top">
			<div class="container">
				<div class="section group">
					<div class="content span_1_of_2">
						<form>
							<p>
								<label>Name</label> <span>*</span><input style="width: 50%"
									type="text" value="<%=user.getUsername()%>" readonly="readonly"
									class="form-control">
							</p>
							<p>
								<label>Nick Name</label> <input style="width: 50%" type="text"
									value="<%=user.getNickname()%>" readonly="readonly"
									class="form-control">
							</p>
							<p>
								<label>First Name</label> <input style="width: 50%" type="text"
									value="<%=user.getFirstName()%>" readonly="readonly"
									class="form-control">
							</p>
							<p>
								<label>Last Name</label> <input style="width: 50%" type="text"
									value="<%=user.getLastName()%>" readonly="readonly"
									class="form-control">
							</p>
							<p>
								<label>Email</label> <input style="width: 50%" type="text"
									value="<%=user.getEmail()%>" readonly="readonly"
									class="form-control">
							</p>
							<p>
								<label>Address</label> <input style="width: 50%" type="text"
									value="<%=user.getAddress()%>" readonly="readonly"
									class="form-control">
							</p>
							<p>
								<label>Year of Birth</label> <input style="width: 50%"
									type="text" value="<%=user.getBirth()%>" readonly="readonly"
									class="form-control">
							</p>
							<p>
								<label>Credit Card Num</label><input style="width: 50%"
									type="text" value="<%=user.getCardNum()%>" readonly="readonly"
									class="form-control">
							</p>
							<br>
							<p>
								<a href="index.jsp" class="button4">Back</a>&nbsp;&nbsp;<a
									href="accountedit.jsp" class="button4">Edit</a>
							</p>
						</form>
					</div>
					<!-- ______________________________________ -->

					<div class="rightsidebar span_3_of_1">
						<div class="blog-bottom">
							<h4 style="color: black">Recent Viewed</h4>
							<%
								List<Books> list = (List<Books>) request.getSession().getAttribute(
										"recent");
								if (list != null) {
									for (Books b : list) {
							%>
							<div class="post-list">
								<div class="po-li">
									<a href='detail.jsp?key=<%=b.getBookkey()%>'
										title="Donec tempor libero"><img src="<%=b.getImg()%>"
										class="img-responsive" alt="tempor"></a>
								</div>
								<div class="post-text">
									<span class="time"><a
										href='detail.jsp?key=<%=b.getBookkey()%>' target="_blank"
										class="demo"><%=b.getTitle()%></a></span>
									<!-- <h5 class="head">Lorem ipsum</h5> -->
									<p class="text">
										<a target="_blank" class="demo"><%=b.getAuthor()%></a>
									</p>
									<a href='detail.jsp?key=<%=b.getBookkey()%>'><span
										class="italic">Read More</span></a>
								</div>
								<div class="clearfix"></div>
							</div>
							<%
								}
								}
							%>
						</div>
					</div>



					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- ________________________________分割线________________________________ -->
	<jsp:include page="footer.jsp" />
</body>
</html>