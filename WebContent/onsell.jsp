<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="com.factory.DAOFactory,com.vo.*,com.servlet.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>On Sell</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<header id="head" class="secondary"></header>
	<div class="main">
		<ol class="breadcrumb">
			<li><a href="index.jsp">Home</a></li>
			<li class="active">On Sell</li>
		</ol>

		<div class="main-top">
			<div class="container">
				<div class="section group">
					<div class="content span_1_of_2">

						<%
							String sellerName = (String) request.getSession().getAttribute(
									"username");
							List<Books> books = DAOFactory.getIBooksDAOInstance()
									.findByOneArgs("seller", sellerName);
							if (books.size() != 0) {
						%>
						<table class="table table-striped">
							<thead>
								<tr>
									<th>#</th>
									<th>Title</th>
									<th>Status</th>
									<th>Edit</th>
									<th>Delete</th>
								</tr>
							</thead>
							<%
								for (int i = 0; i < books.size(); i++) {
							%>
							<tbody>

								<tr>
									<td><%=i + 1%></td>
									<td><a
										href='detail.jsp?key=<%=books.get(i).getBookkey()%>'
										class="demo"><%=books.get(i).getTitle()%></a></td>
									<td>
										<%
											if (books.get(i).getIsPause()) {
										%>
										<form action="sell" method="post">
											<input class="button4" type="submit" name="sell"
												value="OnSale" /> <input type="hidden" name="key"
												value="<%=books.get(i).getBookkey()%>" />
										</form> <%
 	} else {
 %>
										<form action="sell" method="post">
											<input class="button4" type="submit" name="sell"
												value="Pause" /> <input type="hidden" name="key"
												value="<%=books.get(i).getBookkey()%>" />
										</form> <%
 	}
 %>
									</td>
									<td><input type="button" value="Edit" class="button4"
										onclick="location.href='sellBokEdit.jsp?key=<%=books.get(i).getBookkey()%>'" />
									</td>
									<td><form action="sell" method="post">
											<input class="button4" type="submit" name="sell"
												value="Remove" /> <input type="hidden" name="key"
												value="<%=books.get(i).getBookkey()%>" />
										</form></td>
								</tr>
							</tbody>
							<%
								}
							%>
						</table>
						<%
							} else {
						%>
						<br> <br> <br> <br> <br>
						<div align="center">
							<img src="assets/images/result.gif" width="140" height="140" />
							<br>
							<div style="FONT-FAMILY: Bradley Hand">Sorry, no books on
								sell! Please add some books..</div>
						</div>
						<br> <br> <br> <br>
						<%
							}
						%>
					</div>



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
										<a class="demo"><%=b.getAuthor()%></a>
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
			<input style="margin-left: 650px;" name="Submit" type="button"
				class="button4" onclick="location.href='addBook.jsp'"
				value="Add Book" />
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>

	<jsp:include page="footer.jsp" />
</body>
</html>