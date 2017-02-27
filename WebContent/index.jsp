<%@page import="com.factory.DAOFactory, com.vo.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>index</title>
<style type="text/css">

/* SELECT W/IMAGE */
select#selectTravelCity {
	width: 14em;
	height: 3.2em;
	padding: 0.2em 0.4em 0.2em 0.4em;
	vertical-align: middle;
	border: 1px solid #e9e9e9;
	-moz-border-radius: 0.2em;
	-webkit-border-radius: 0.2em;
	border-radius: 0.2em;
	box-shadow: inset 0 0 3px #a0a0a0;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	/* sample image from the webinfocentral.com */
	background: url() 95%/10% no-repeat #fdfdfd;
	font-family: Arial, Calibri, Tahoma, Verdana;
	font-size: 1.1em;
	color: #ff9900;
	cursor: pointer;
}

select#selectTravelCity  option {
	font-size: 1em;
	padding: 0.2em 0.4em 0.2em 0.4em;
}

select#selectTravelCity  option[selected] {
	font-weight: bold
}

select#selectTravelCity  option:nth-child(even) {
	background-color: #f5f5f5;
}

select#selectTravelCity:hover {
	color: #101010;
	border: 1px solid #cdcdcd;
}

select#selectTravelCity:focus {
	box-shadow: 0 0 2px 1px #404040;
}

/*SELECT W/DOWN-ARROW*/
select#selectPointOfInterest {
	width: 100pt; /* select宽 */
	height: 22pt;
	line-height: 15pt;
	padding-right: 20pt;
	text-indent: 2pt;
	text-align: left;
	vertical-align: middle;
	box-shadow: inset 0 0 3px #606060;
	border: 0px;
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	border-radius: 6px;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	font-family: Arial, Calibri, Tahoma, Verdana;
	font-size: 10pt;
	font-weight: 500;
	color: #ff9900;
	cursor: pointer;
	outline: none;
}

select#selectPointOfInterest option {
	padding: 4px 10px 4px 10px;
	font-size: 11px;
	font-weight: normal;
}

select#selectPointOfInterest option[selected] {
	font-weight: bold
}

select#selectPointOfInterest option:nth-child(even) {
	background-color: #f5f5f5;
}

select#selectPointOfInterest:hover {
	font-weight: 100;
}

select#selectPointOfInterest:focus {
	box-shadow: inset 0 0 5px #000099;
	font-weight: 600;
}

/*LABEL FOR SELECT*/
label#lblSelect {
	position: relative;
	display: inline-block;
}
/*DOWNWARD ARROW (25bc)*/
label#lblSelect::after {
	content: "\25bc";
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	width: 20pt; /* 三角宽度 */
	height: 22pt;
	line-height: 25pt; /* 三角箭头 */
	vertical-align: middle;
	text-align: center;
	background: #ff9900;
	color: #fefefe;
	-moz-border-radius: 0 6px 6px 0;
	-webkit-border-radius: 0 6px 6px 0;
	border-radius: 0 6px 6px 0;
	pointer-events: none;
}
</style>
<style>
.row {
	margin-bottom: 20px;
}

.row .row {
	margin-top: 10px;
	margin-bottom: 0;
}

[class*="col-"] {
	padding-top: 15px;
	padding-bottom: 15px;
	background-color: #eee;
	background-color: rgba(0, 0, 10, .0);
	border: 0px solid #ddd;
	border: 0px solid rgba(86, 61, 124, .2);
}
</style>
<SCRIPT LANGUAGE="javascript">
	function check() {
		var form = document.getElementById("search");
		var select = document.getElementById("selectPointOfInterest").value;
		var text = document.getElementById("text").value;
		if (select != "Please Select" && text.length != 0)
			form.submit();
	}
</SCRIPT>
</head>
<body>
	<jsp:include page="header.jsp" />
	<!-- Header -->
	<header id="head">
	<div class="container">
		<div class="row">
			<h1 class="lead">WELCOME TO DUANGDUANG BOOKSTORE</h1>
			<p class="tagline">
				Learn more? please <a href="register.jsp"> Register </a>first.
			</p>
			<p></p>

		</div>
	</div>
	</header>

	<br>
	<br>
	<center>
		<form action="search" method="post" id="search">
			<label id="lblSelect"> <select id="selectPointOfInterest"
				name="keyword">
					<option selected>Please Select</option>
					<option>Title</option>
					<option>Authors</option>
					<option>Publication type</option>
					<option>Publication date</option>
					<option>Venues</option>
			</select></label> <input id="text" style="height: 30px" type="text" name="text"
				size=65 placeholder="Please input here..." /> <input
				class="button4" type='button' value='Search' onclick="check()" /> <input
				type="hidden" name="search" value='search' />
		</form>
	</center>
	<br>
	<br>

	<!-- ____________________________________我是分割线____________________________________ -->

	<div class="products">
		<div class="container">
			<div class="content_top">
				<div class="heading">
					<h3>BOOKS AT DUANGDUANG</h3>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<%
			for (int j = 0; j < 3; j++) {
		%>
		<div class="products-1">
			<div class="container">
				<div class="section group">
					<%
						List<Books> list = DAOFactory.getIBooksDAOInstance()
									.getTenRandomBooks();
							for (int i = 0; i < 4; i++) {
					%>
					<div class="col_1_of_4 span_1_of_4">
						<div class="view effect">
							<center>
								<a href='detail.jsp?key=<%=list.get(j * 4 + i).getBookkey()%>'>
									<img src="<%=list.get(j * 4 + i).getImg()%>"
									class="img-responsive" alt="">
								</a>
							</center>
						</div>
						<div class="cart">
							<p class="title">
								<a href='detail.jsp?key=<%=list.get(j * 4 + i).getBookkey()%>'
									class="demo"><%=list.get(j * 4 + i).getTitle()%></a>
							</p>

							<div class="price">
								<span class="actual">$<%=list.get(j * 4 + i).getPrice()%></span>
							</div>
							<form action="cart" method="post">
								<input type="submit" name='cart' value="Add to Cart"
									class="button4"> <input type="hidden" name='bookkey'
									value='<%=list.get(j * 4 + i).getBookkey()%>'>
							</form>
						</div>
					</div>
					<%
						}
					%>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
		<%
			}
		%>
	</div>


	<script src="assets/js/bootstrap.min.js"></script>
	<!-- ____________________________________我也是分割线____________________________________-->
	<jsp:include page="footer.jsp" />
</body>
</html>