<%@page import="com.factory.DAOFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="com.factory.DAOFactory,com.vo.*,com.servlet.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Show All Sellers</title>
<!-- Bootstrap -->
<link href="assets/admin/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<link href="assets/admin/bootstrap/css/bootstrap-responsive.min.css"
	rel="stylesheet" media="screen">
<link href="assets/admin/vendors/easypiechart/jquery.easy-pie-chart.css"
	rel="stylesheet" media="screen">
<link href="assets/admin/assets/styles.css" rel="stylesheet"
	media="screen">
<script src="assets/admin/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
</head>
<body>
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a class="brand" href="#">DuangDuang BookStore</a>

				<div class="nav-collapse collapse">
					<ul class="nav pull-right">
						<li class="dropdown"><a href="#" role="button"
							class="dropdown-toggle" data-toggle="dropdown"> <i
								class="icon-user"></i> Administrator <i class="caret"></i>

						</a>
							<ul class="dropdown-menu">
								<li><a tabindex="-1" href="index.jsp">View Web</a></li>
								<li class="divider"></li>
								<%
									if (request.getSession().getAttribute("admin") == null) {
								%>
								<li><a tabindex="-1" href="adminlogin.jsp">Login</a></li>
								<%
									} else {
								%>
								<li><a tabindex="-1" href="adminchanged.jsp">Change
										password</a></li>
								<%
									}
								%>
							</ul></li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
	</div>
	<!-- __________________________________nav end____________________________________ -->
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span3" id="sidebar">
				<ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
					<li><a href="showAllSellers.jsp"><i
							class="icon-chevron-right"></i> Show Seller Activities</a></li>
					<li><a href="showAllCustomers.jsp"><i
							class="icon-chevron-right"></i> Show Customer Activities</a></li>
				</ul>
			</div>

			<!--/span-->
			<div class="span9" id="content">
				<div class="row-fluid">
					<div class="navbar">
						<div class="navbar-inner">
							<ul class="breadcrumb">
								<li class="icon-chevron-left hide-sidebar"><a href='#'
									title="Hide Sidebar" rel='tooltip'> &nbsp;</a></li>
								<li class="icon-chevron-right show-sidebar"
									style="display: none;"><a href='#' title="Show Sidebar"
									rel='tooltip'>&nbsp;</a></li>
								<li><a href="adminindex.jsp">Home</a> <span class="divider">/</span></li>
								<li class="active">Show All Sellers<span class="divider">/</span>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<%
					List<String> AllSellers = new ArrayList<String>();
					AllSellers = DAOFactory.getIBooksDAOInstance().getSellers();
					if (AllSellers.size() != 0) {
				%>
				<div class="row-fluid">
					<div class="span12">
						<!-- block -->
						<div class="block">
							<div class="navbar navbar-inner block-header">
								<div class="muted pull-left">Sellers</div>
								<div class="pull-right">
									<span class="badge badge-info"><%=AllSellers.size()%></span>

								</div>
							</div>
							<div class="block-content collapse in">
								<table class="table table-striped">
									<thead>
										<tr>
											<th>#</th>
											<th>Username</th>
											<th>OnSale Books</th>

										</tr>
									</thead>
									<tbody>
										<%
											int current_page = 1;
												int num_items = AllSellers.size();
												int num_pages = 0;

												String pagenow = request.getParameter("avr");
												if (pagenow != null) {
													current_page = Integer.parseInt(pagenow);
												}

												if (num_items % 15 == 0) {
													num_pages = num_items / 15;
												} else {
													num_pages = num_items / 15 + 1;
												}

												String seller_name;
												for (int i = current_page * 15 - 15; i < current_page * 15 - 15
														+ Math.min(15, num_items - (current_page * 15 - 15)); i++) {
													seller_name = AllSellers.get(i);
										%>
										<tr>
											<td><%=i + 1%></td>
											<td><%=seller_name%></td>
											<td><a
												href='<%=request.getContextPath()%>/sellerBooks.jsp?sellername=<%=seller_name%>'><%="All Books"%></a></td>

										</tr>
										<%
											}
										%>
									</tbody>
								</table>
							</div>
						</div>
						<!-- /block -->
					</div>
				</div>
			</div>
		</div>

		<center>
			<%
				if (current_page != 1) {
			%>
			<a
				href='<%=request.getContextPath()%>/showAllSellers.jsp?avr=<%=current_page - 1%>'>Pre</a>
			<%
				}
			%>
			<%
				for (int i = Math.max(current_page - 3, 1); i <= Math.min(
							current_page + 5, num_pages); i++) {
			%>
			<a href='<%=request.getContextPath()%>/showAllSellers.jsp?avr=<%=i%>'><%=i%></a>

			<%
				}
			%>

			<%
				if (current_page != num_pages) {
			%>
			<a
				href='<%=request.getContextPath()%>/showAllSellers.jsp?avr=<%=current_page + 1%>'>Next</a>
			<%
				}
			%>
		</center>

		<%
			} else {
		%>
		<div class="row-fluid">
			<div class="span12">
				<!-- block -->
				<div class="block">
					<div class="navbar navbar-inner block-header">
						<div class="muted pull-left">Sellers</div>
						<div class="pull-right">
							<span class="badge badge-info"><%=AllSellers.size()%></span>

						</div>
					</div>
					<div class="block-content collapse in">
						<div>
							<h3>No seller</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
		}
	%>
	<nav class="navbar navbar-default navbar-fixed-bottom"
		role="navigation">
	<hr>
	<div class="navbar-header">
		<p>&copy; DuangDuang 2015</p>
	</div>
	</nav>

	<!--/.fluid-container-->
	<script src="assets/admin/vendors/jquery-1.9.1.min.js"></script>
	<script src="assets/admin/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="assets/admin/vendors/easypiechart/jquery.easy-pie-chart.js"></script>
	<script src="assets/admin/assets/scripts.js"></script>
	<script>
		$(function() {
			// Easy pie charts
			$('.chart').easyPieChart({
				animate : 1000
			});
		});
	</script>
</body>
</html>