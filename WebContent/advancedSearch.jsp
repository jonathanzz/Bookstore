<%@page
	import="com.factory.DAOFactory,com.vo.*,com.servlet.*,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Advanced Search</title>
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
			<li class="active">Advanced Search</li>
		</ol>

		<div class="main-top">
			<div class="container">
				<div class="section group">
					<form action="search" method="post">
						<div class="content span_1_of_2">
							<div class="container">
								<div class="row">
									<div class="col-md-2">
										<span class="asLabel">Title</span>
									</div>
									<div class="col-md-6">
										<input name="title" type="text" size="22" style="width: 50%"
											class="asField" />
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-2">
										<span class="asLabel"><span class="asLabel">Author</span></span>
									</div>
									<div class="col-md-6">
										<input name="author" type="text" size="22" style="width: 50%"
											class="asField" />
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-2">
										<span class="asLabel">Publication Type</span>
									</div>
									<div class="col-md-6">
										<input name="pubtype" type="text" size="22" style="width: 50%"
											class="asField" />
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-2">
										<span class="asLabel">Venues</span>
									</div>
									<div class="col-md-6">
										<input name="venues" type="text" size="22" style="width: 50%"
											class="asField" />
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-2">
										<span class="asLabel">Seller</span>
									</div>
									<div class="col-md-6">
										<input name="seller" type="text" size="22" style="width: 50%"
											class="asField" />
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-2">
										<span class="asLabel">Years:</span>
									</div>
									<div class="col-md-6">
										<select name="year">
											<option>please select</option>
											<%
												for (int i = 1960; i < 2016; i++) {
											%>
											<option><%=i%></option>
											<%
												}
											%>
										</select>
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-2">
										<span class="asLabel">Price:</span>
									</div>
									<div class="col-md-6">
									<input type="text" name="fromprice" size="7px" onKeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))"
									style="ime-mode: Disabled" placeholder="from"/>~
									<input type="text" name="toprice" size="7px" onKeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))"
									style="ime-mode: Disabled" placeholder="to"/>
									</div>
								</div>
								<br>
							</div>

							<!-- _______________ -->


							<br>
							<div class="container">
								<div class="row">
									<div class="col-md-1"><input type='submit' class="button4" value='Search' /> <input
									type="hidden" name="search" value="adsearch" /></div>
									<!-- <div class="col-md-1"></div> -->
									<div class="col-md-1"><input class="button4" type="reset" value=Resets></div>
								</div>
							</div>
					
						</div>
					</form>
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