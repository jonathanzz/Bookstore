<%@page import="com.factory.DAOFactory,com.vo.*,com.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Acount Information</title>
<SCRIPT LANGUAGE="javascript">
	function check() {
		var email = document.getElementById("email").value;
		if (email.length > 0
				&& (email
						.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == -1)) {
			document.getElementById("error").innerHTML = "Please input a valid email address!";
			return false;
		} else
			document.getElementById("error").innerHTML = "";
		return true;
	}
	function sub() {
		var form = document.getElementById("edit");
		if (check()) {
			form.submit();
		}
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<header id="head" class="secondary"></header>

	<!-- ________________________________分割线________________________________ -->
	<div class="main">
		<div class="main-top">
			<div class="container">
				<div class="section group">
					<div class="content span_1_of_2">
						<form id="edit" action="user" method="post">
							<p>
								<label>Name</label> <span>*</span><input type="text"
									value="<%=request.getSession().getAttribute("username")%>"
									readonly="readonly" class="form-control"><label
									style="color: red">*username cant be changed</label>
							</p>
							<label id="error" style="color: red"></label>
							<p>
								<label>Nick Name</label> <input type="text" name="chnickname"
									class="form-control" onclick="check()">
							</p>
							<p>
								<label>First Name</label> <input type="text" name="chfirstName"
									class="form-control" onclick="check()">
							</p>
							<p>
								<label>Last Name</label> <input type="text" name="chlastName"
									class="form-control" onclick="check()">
							</p>
							<p>
								<label>Email</label> <input id="email" type="text"
									name="chemail" class="form-control" onclick="check()">
							</p>
							<p>
								<label>Address</label> <input type="text" name="chaddress"
									class="form-control" onclick="check()">
							</p>
							<p>
								<label>Year of Birth</label> <input type="text" name="chbirth"
									onKeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))"
									style="ime-mode: Disabled" class="form-control" onclick="check()">
							</p>
							<p>
								<label>Credit Card Num</label><input type="text"
									onKeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))"
									style="ime-mode: Disabled" name="chcardNum" class="form-control" onclick="check()">
							</p>
							<br>
							<p>
								<input name="Submit" type="button" class="button4"
									onclick="location.href='javascript:history.go(-1);'"
									value="Back" /> <input type="button" value="Save"
									onclick="sub()" class="button4"><input type="hidden"
									value="accountedit" name="user" />
							</p>
						</form>
					</div>

					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- ________________________________分割线________________________________ -->

	<jsp:include page="footer.jsp" />
</body>
</html>