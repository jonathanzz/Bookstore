<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="com.factory.DAOFactory,com.vo.*,com.servlet.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="assets/js/bookcheck.js"></script>
<SCRIPT LANGUAGE="javascript">
	function sub() {
		var form = document.getElementById("add");
		if (undersub()) {
			form.submit();
		}
	}
	function undersub() {
		var title = document.getElementById("title").value;
		var author = document.getElementById("author").value;
		var key = document.getElementById("bookkey").value;
		var price = document.getElementById("price").value;
		var amount = document.getElementById("amount").value;
		if (title.length == 0 || author.length == 0) {
			document.getElementById("error").innerHTML = "Title or Author can not be empty!";
			return false;
		} else if (key.length == 0) {
			document.getElementById("error").innerHTML = "Book key can not be empty!";
			return false;
		} else if (price.length == 0) {
			document.getElementById("error").innerHTML = "Price can not be empty!";
			return false;
		} else if(amount.length == 0){
			document.getElementById("error").innerHTML = "Amount can not be empty!";
			return false;
		}else
			document.getElementById("error").innerHTML = "";
		return true;
	}
</script>
</head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sell Items</title>
<style type="text/css">
body {
	font-size: 14px;
}

input {
	vertical-align: middle;
	margin: 0;
	padding: 0
}

.file-box {
	position: relative;
	width: 340px
}

.txt {
	height: 22px;
	border: 1px solid #cdcdcd;
	width: 180px;
}

.btn {
	background-color: #FFF;
	border: 1px solid #CDCDCD;
	height: 24px;
	width: 70px;
}

.file {
	position: absolute;
	top: 0;
	right: 80px;
	height: 24px;
	filter: alpha(opacity : 0);
	opacity: 0;
	width: 260px
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<header id="head" class="secondary"></header>
	<!-- ________________________________________我是分割线________________________________________ -->
	<div class="main">
		<ol class="breadcrumb">
			<li><a href="index.jsp">Home</a></li>
			<li class="active">Add Book</li>
		</ol>

		<div class="main-top">
			<div class="container">
				<div class="section group">
					<div class="content span_1_of_2">
						<h4>Add Book need Two steps:</h4>
						<br>
						<p>1: Fill in all information of book and Click next button</p>
						<br>
						<p>2: Upload correct picture of book</p>
						<br>
						<div id="error"
							style="padding: 4px 10px; color: rgb(255, 0, 0); font-size: 13px; font-weight: bold;">
							<%
								String status = (String) request.getAttribute("status");
								if (status != null) {
							%><%=status%>
							<%
								}
							%>
						</div>
						<form id="add" action="sell" method="post">
							<div class="top-margin">
								<label>Title <span class="text-danger">*</span></label> <input
									id="title" type="text" name="title" class="form-control">
							</div>
							<div class="top-margin">
								<label>Author <span class="text-danger">*</span></label> <input
									id="author" type="text" name="author" class="form-control">
							</div>
							<div class="top-margin">
								<label>Book Key <span class="text-danger">*</span></label> <input
									id="bookkey" type="text" name="bookkey" class="form-control">
							</div>
							
							<div class="top-margin">
								<label>Price <span class="text-danger">*</span></label> <input
									id="price"
									onKeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))"
									style="ime-mode: Disabled" type="text" name="price"
									class="form-control">
							</div>
							<div class="top-margin">
								<label>Amount<span class="text-danger">*</span></label> <input
								onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"
									id="amount" type="text" name="amount" class="form-control">
							</div>
							<div class="top-margin">
								<label>Publication Type</label> <input type="text"
									name="pubtype" class="form-control">
							</div>
							<div class="top-margin">
								<label>Venues</label> <input type="text" name="venues"
									class="form-control">
							</div>
							<div class="top-margin">
								<label>Year</label> <input type="text" name="year"
									class="form-control">
							</div>
							<hr>
							<div class="row" style="margin-left: 550px;">
								<div class="col-lg-4 text-right">
									<input class="button4" type='button' value='Next Step'
										onClick="sub()" /><input type="hidden" name='sell'
										value='add' />
								</div>
							</div>
						</form>
					</div>



					<!-- __________________________________________ -->
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
	<!-- ________________________________________我也是分割线________________________________________ -->
	<!-- <script src="assets/js/upload.js"></script> -->
	<jsp:include page="footer.jsp" />
</body>
</html>