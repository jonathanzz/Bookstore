<%@page import="com.factory.DAOFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="com.factory.DAOFactory,com.vo.*,com.servlet.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Book</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<header id="head" class="secondary"></header>
	<%
		String bookkey = request.getParameter("key");
		Books book = DAOFactory.getIBooksDAOInstance().findByBookkey(
				bookkey);
	%>
	<div class="main">
		<ol class="breadcrumb">
			<li><a href="index.jsp">Home</a></li>
			<li class="active">Edit Book</li>
		</ol>

		<div class="main-top">
			<div class="container">
				<div class="section group">
					<div class="content span_1_of_2">
						<div class="content span_1_of_2">
							<form action="sell" method="post">
								<p>
									<label>Title</label> <input placeholder="<%=book.getTitle()%>" style="width: 50%" type="text"
												name="title" class="form-control"> <br>
								</p>
								<p>
									<label>Author</label> <input placeholder="<%=book.getAuthor()%>" style="width: 50%" type="text"
										name="author" class="form-control"> <br>
								</p>

								<p>
									<label>Publication Type</label> <input placeholder="<%=book.getPubtype()%>" style="width: 50%"
										type="text" name="pubtype" class="form-control"> <br>
								</p>
								<p>
									<label>Price</label> <input style="width: 50%"
										onKeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))"
										style="ime-mode: Disabled" 
										 placeholder="<%=book.getPrice()%>" style="width: 50%" type="text"
										name="price" class="form-control"> <br> 
								</p>
								<p>
									<label>Amount</label> <input style="width: 50%"
										onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"
										 placeholder="<%=book.getAmount()%>" style="width: 50%" type="text"
										name="amount" class="form-control"> <br> 
								</p>
								<p>
									<label>Venues</label> <input placeholder="<%=book.getVenues()%>" style="width: 50%" type="text"
										name="venues" class="form-control"> <br> 
								</p>
								<br>
								<p>
									<input name="Submit" type="button" class="button4"
										onclick="location.href='javascript:history.go(-1);'"
										value="Back" /> <input type="submit" name="sell" value="Save"
										class="button4"> <input type="hidden" name="key"
										value="<%=bookkey%>" />
								</p>
							</form>
						</div>
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
	<jsp:include page="footer.jsp" />
</body>
</html>