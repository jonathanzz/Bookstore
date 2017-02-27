<%@page
	import="com.factory.DAOFactory,com.vo.*,com.servlet.*,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Results</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<header id="head" class="secondary"></header>
	<!-- ____________________________________我是分割线———————————————————————————————————————————————————— -->
	<ol class="breadcrumb">
		<li><a href="index.jsp">Home</a></li>
		<li class="active">Search Results</li>
	</ol>
	<div class="products">
		<div class="content_top">
			<div class="heading">
				<h3>Products Results</h3>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="products-1">
			<div class="container">

				<%
					List<Books> results = (List<Books>) request.getSession()
							.getAttribute("results");
					if (results.size() != 0) {
						int pagesize = 8;
						int pagenow = 1;
						int rowcount = results.size();
						int pagecount = 0;

						String now = request.getParameter("now");
						if (now != null) {
							pagenow = Integer.parseInt(now);
						}

						if (rowcount % pagesize == 0) {
							pagecount = rowcount / pagesize;
						} else {
							pagecount = rowcount / pagesize + 1;
						}

						Books book;
						for (int i = pagenow * pagesize - pagesize; i < pagenow
								* pagesize
								- pagesize
								+ Math.min(pagesize, rowcount
										- (pagenow * pagesize - pagesize)); i++) {
							if (i % 8 != 4) {
				%>


				<div class="section group">
					<div class="col_1_of_4 span_1_of_4">
						<div class="view effect">
							<center>
								<a href= 'detail.jsp?key=<%=results.get(i).getBookkey()%>'> <img src=<%=results.get(i).getImg()%>></a>
							</center>
						</div>
						<div class="cart">
							<p class="title">
								<a href= 'detail.jsp?key=<%=results.get(i).getBookkey()%>' class="demo">Title:<%=results.get(i).getTitle()%></a>
							</p>

							<div class="price">
								<span class="actual">$<%=results.get(i).getPrice()%></span>
							</div>
							<form action="cart" method="post">
								<input type="submit" name='cart' value="Add to Cart" class="button4">
								<input type="hidden" name='bookkey' value='<%=results.get(i).getBookkey()%>'>
							</form>
						</div>
					</div>
				</div>


				<%
					} else {
				%>
				<div class="clearfix"></div>
				<div class="section group">
					<div class="col_1_of_4 span_1_of_4">
						<div class="view effect">
							<center>
								<a href= 'detail.jsp?key=<%=results.get(i).getBookkey()%>'> <img src=<%=results.get(i).getImg()%>></a>
							</center>
						</div>
						<div class="cart">
							<p class="title">
								<a href= 'detail.jsp?key=<%=results.get(i).getBookkey()%>' class="demo">Title:<%=results.get(i).getTitle()%></a>
							</p>

							<div class="price">
								<span class="actual">$<%=results.get(i).getPrice()%></span>
							</div>
							<form action="cart" method="post">
								<input type="submit" name='cart' value="Add to Cart" class="button4">
								<input type="hidden" name='bookkey' value='<%=results.get(i).getBookkey()%>'>
							</form>
							
						</div>
					</div>
				</div>



				<%
					}
						}
				%>
			</div>


			<nav>
			<center>
				<ul class="pagination">
					<%
						if (pagenow != 1) {
					%>
					<li><a href="#">&laquo;</a></li>
					<%-- <a
								href='<%=request.getContextPath()%>/results.jsp?now=<%=pagenow - 1%>'>Pre</a> --%>
					<%
						}
					%>
					<%
						for (int i = Math.max(pagenow - 3, 1); i <= Math.min(
									pagenow + 5, pagecount); i++) {
					%>
					<li><a
						href="<%=request.getContextPath()%>/results.jsp?now=<%=i%>"><%=i%></a></li>
					<%-- <a href='<%=request.getContextPath()%>/results.jsp?now=<%=i%>'><%=i%></a> --%>
					<%
						}
					%>

					<%
						if (pagenow != pagecount) {
					%>
					<li><a
						href="<%=request.getContextPath()%>/results.jsp?now=<%=pagenow + 1%>">&raquo;</a></li>
					<%-- <a
								href='<%=request.getContextPath()%>/results.jsp?now=<%=pagenow + 1%>'>Next</a> --%>
					<%
						}
					%>
				</ul>
			</center>
			</nav>


			<%
				} else {
			%>
			<a>No results matched!</a>
			<%
				}
			%>



			<!-- ____________________________________我也是分割线———————————————————————————————————————————————————— -->
			<jsp:include page="footer.jsp" />
</body>
</html>