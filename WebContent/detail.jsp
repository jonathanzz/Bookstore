<%@page import="com.factory.DAOFactory, com.vo.*,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>detail</title>
<style>
body {
	margin: 10px 0;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<header id="head" class="secondary"></header>

	<ol class="breadcrumb">
		<li><a href="index.jsp">Home</a></li>
		<li class="active">Detail</li>
	</ol>
	<%
		String bookkey = request.getParameter("key");
		Books book = DAOFactory.getIBooksDAOInstance().findByBookkey(
				bookkey);
	%>

	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<img src="<%=book.getImg()%>" class="img-responsive" alt="" />
			</div>
			<form action="cart" method="post">
				<div class="col-md-4">
					<ul class="list-group">
						<li style="border: 0px;" class="list-group-item"><span
							class="brand">Title:<%=book.getTitle()%>
						</span></li>
						<li style="border: 0px;" class="list-group-item"><span
							class="code">Author:<%=book.getAuthor()%></span></li>
						<li style="border: 0px;" class="list-group-item"><span
							class="text">Price: $</span> <span class="price-new"><%=book.getPrice()%></span></li>
						<li style="border: 0px;" class="list-group-item"><label>Qty:</label>
							<input type="text" name="count" size="2" value="1"
							onKeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))"
							style="ime-mode: Disabled"></li>
						<li style="border: 0px;" class="list-group-item">
							<div class="container">
								<div class="row">
									<div class="col-md-1">
										<input type="submit" value="Back" class="button4"
											onclick="javascript:history.back(-1);">
									</div>
									<div class="col-md-1">

										<input type="submit" name='cart' value="Add to Cart"
											class="button4"> <input type="hidden" name='bookkey'
											value='<%=book.getBookkey()%>'>
									</div>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</form>
		</div>
	</div>
	<br>
	<br>
	<div class="container">
		<h4 style="color: black">Recent Viewed</h4>
	</div>
	<div class="container">
		<div class="row">
			<%
				List<Books> list = new ArrayList<Books>();
				list = (List<Books>) request.getSession().getAttribute("recent");
				if (list != null) {
					for (Books b : list) {
			%>
			<div class="col-md-2">
				<div class="post-list">
					<div class="po-li">
						<a href='detail.jsp?key=<%=b.getBookkey()%>'
							title="Donec tempor libero"><img src="<%=b.getImg()%>"
							class="img-responsive" alt="tempor"></a>
					</div>
					<div class="post-text">
						<span class="time"><a
							href='detail.jsp?key=<%=b.getBookkey()%>'
							class="demo"><%=b.getTitle()%></a></span>
						<!-- <h5 class="head">Lorem ipsum</h5> -->
						<p class="text">
							<a  class="demo"><%=b.getAuthor()%></a>
						</p>
						<a href='detail.jsp?key=<%=b.getBookkey()%>'><span
							class="italic">Read More</span></a>
					</div>
				</div>
			</div>
			<%
				}
				}
			%>
		</div>
	</div>
	<%
		List<Books> recent = (List<Books>) request.getSession()
				.getAttribute("recent");
		if (recent != null) {
			int flag = 1;
			for (Books s : recent)
				if (s.getBookkey().equals(book.getBookkey())) {
					flag = 0;
					break;
				}
			if (recent.size() == 5 && flag == 1) {
				recent.remove(0);
				recent.add(book);
			} else if (flag == 1)
				recent.add(book);
			request.getSession().setAttribute("recent", recent);
		} else {
			List<Books> r = new ArrayList<Books>();
			r.add(book);
			request.getSession().setAttribute("recent", r);
		}
	%>
	<br>
	<jsp:include page="footer.jsp" />
</body>
</html>