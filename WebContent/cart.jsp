<%@page
	import="com.factory.DAOFactory,com.vo.*,com.servlet.*,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>shopping cart</title>
<link href="assets/css/style.css" rel="stylesheet" />
<script type="text/javascript">
var to=0;
	function total_price(obj,i) {
		var id = "price"+i;
		var b = document.getElementById(id).innerText;
		a=b.substring(1);
		if(obj.checked){
			to = to+parseInt(a);
		}else{
			to =to-parseInt(a);
		}
		document.getElementById("totalPrice").value="$"+to;
	}
	function single(i,price) {
		var flag=0;
		if(parseInt(i)>0)
			flag=1;
		else
			i=-parseInt(i);
		var num=parseInt(document.getElementById("num"+i).value);
		if(flag==0)
			num=num-1;
		else
			num=num+1;
		if(num<0)
			num=0;	
		document.getElementById("num"+i).value=num;
		document.getElementById("price"+i).innerHTML=
			"$"+num*parseInt(price);
		var obj = document.getElementById("check"+i);
		if(obj.checked){
			if(flag==0)
				to=to-parseInt(price);
			else
				to=to+parseInt(price);
			document.getElementById("totalPrice").value="$"+to;
		}
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<header id="head" class="secondary"></header>
	<!-- _________________________________ -->
	<br>
	<br>
	<ol class="breadcrumb">
		<li><a href="index.jsp">Home</a></li>
		<li class="active">Shopping Cart</li>
	</ol>
	<div class="container">
							<center>
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
						</center>
		<div class="gwc" style="margin: auto;">
			<table cellpadding="0" cellspacing="0" class="gwc_tb1">
				<tr>
					<td class="tb1_td3">Products</td>
					<td class="tb1_td3"></td>
					<td class="tb1_td3">Count</td>
					<td class="tb1_td3">Price</td>
					<td class="tb1_td3">Operation</td>
				</tr>
			</table>
			<form action="cart" method="post">
				<%
					String username = (String) request.getSession().getAttribute(
							"username");
					List<ShoppingCart> cart = DAOFactory.getIShpcDAOInstance()
							.findAllByUserName(username);
					if (cart.size() != 0) {
						int i = 0;
						for (ShoppingCart sc : cart) {
							i++;
							Books book = DAOFactory.getIBooksDAOInstance()
									.findByBookkey(sc.getBook());
				%>
				<table cellpadding="0" cellspacing="0" class="gwc_tb2">
					<tr>
						<td class="tb1_td3"><a
							href='detail.jsp?key=<%=book.getBookkey()%>'><img
								src=<%=book.getImg()%> width="120" height="120" /></a></td>
						<td class="tb1_td3"><a
							href='detail.jsp?key=<%=book.getBookkey()%>'>Title:<%=book.getTitle()%></a></td>
						<td class="tb1_td3"><input id="cut" type="button"
							onclick="single(<%=-i%>,<%=book.getPrice()%>)"
							style="width: 20px; height: 24px; border: 1px solid #ccc;"
							value="-" /> <input id='<%="num" + i%>'
							style="width: 20px; height: 24px; border: 1px solid #ccc;"
							name='<%="num" + i%>' value='<%=sc.getCount()%>' type="text"
							readonly="readonly" /> <input id="add" name="cart" type="button"
							onclick="single(<%=i%>,<%=book.getPrice()%>)"
							style="width: 20px; height: 24px; border: 1px solid #ccc;"
							value="+" /></td>
						<td class="tb1_td3"><label id='<%="price" + i%>'
							style="color: #ff5500; font-size: 14px; font-weight: bold;">
								$<%=book.getPrice() * sc.getCount()%></label></td>
						<td class="tb1_td3"><input type="checkbox" id=<%="check" + i%>
							value='<%=i+"      "+book.getBookkey()%>' onclick="total_price(this,<%=i%>)"
							name='items' /></td>
					</tr>
				</table>


				<%
					}
				%>
				<table cellpadding="0" cellspacing="0" class="gwc_tb3">
					<tr>
						<td class="tb1_td1"><button type="button"
								class="btn btn-link" aria-label="Left Align"
								onclick="location.href='javascript:history.go(-1);'">
								<span class="glyphicon glyphicon-arrow-left" aria-hidden="true">Back</span>
							</button></td>
						<td class="tb1_td1"><input type="submit" name="cart"
							value="delete" class="btn btn-link" aria-label="Left Align">
						</td>
						<td class="tb1_td3"><input type="submit" name="cart"
							value="deleteall" class="btn btn-link" aria-label="Left Align"></td>
						<td class="tb1_td3">Total:<input type="button" name="total"
							id="totalPrice" value="$0" class="btn btn-link"
							aria-label="Left Align"></td>
						<td class="tb3_td4"><input type="submit" name="cart"
							value="save"></td>
						<td class="tb3_td4"><input type="submit" name="cart"
							value="buy"></td>
					</tr>
				</table>
			</form>
			<%
				} else {
			%>
			<div align="center">
				<br> <br> <img src="assets/images/cart.jpg" width="140"
					height="140" /> <br> <br>
				<div style="FONT-FAMILY: Bradley Hand">Please add to cart
					firstly!</div>
				<br> <a href="index.jsp" class="button4">Back</a> <br>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br>
			</div>
			<%
				}
			%>
			<!---All---->
		</div>
	</div>
	<br><br><br>
	<jsp:include page="footer.jsp" />
</body>
</html>