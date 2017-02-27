<%@page
	import="com.factory.DAOFactory,com.vo.*,com.servlet.*,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Order</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<header id="head" class="secondary"></header>
	<%
		String username = (String) request.getSession().getAttribute(
				"username");
		List<BoughtTable> bt = DAOFactory.getIBgtDAOInstance().findAll(
				username);
	%>

	<div class="main">
		<ol class="breadcrumb">
			<li><a href="index.jsp">Home</a></li>
			<li class="active">My Order</li>
		</ol>

		<div class="main-top">
			<div class="container">
				<div class="section group">
					<%
						if (bt.size() != 0) {
					%>
					<form action="search" method="post">
						<div class="content span_1_of_2">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>#</th>
										<th>Book Title</th>
										<th>Book Author</th>
										<th>Bought Count</th>
									</tr>
									<%
										int i = 0;
											for (BoughtTable b : bt) {
												i++;
												Books book = DAOFactory.getIBooksDAOInstance()
														.findByBookkey(b.getBook());
									%>
									<tr>
										<td><%=i%></td>
										<td><a href='detail.jsp?key=<%=book.getBookkey()%>'
											class="demo"><%=book.getTitle()%></a></td>
										<td><%=book.getAuthor()%></td>
										<td><%=b.getCount()%></td>
									</tr>
									<%
										}
									%>
								</thead>
							</table>
						</div>
					</form>
					<%
						} else {
					%>
					<div class="content span_1_of_2">
						<div align="center">
							<img src="assets/images/noOrder.gif" width="140" height="140" />
							<br>
							<div style="FONT-FAMILY: Bradley Hand">There is no order
								for you.</div>
							<br> <br> <input type="submit" value="Back"
								class="button4"
								onclick="location.href='javascript:history.go(-1);'">
						</div>
					</div>
					<%
						}
					%>
					<!-- ____________________right side content____________________________________ -->


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
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	</div>

	<!-- -------------------------------------------------------------------- -->

	<jsp:include page="footer.jsp" />
</body>
</html>