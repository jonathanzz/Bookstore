<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload</title>
<SCRIPT LANGUAGE="javascript">
	function check() {
		var form = document.getElementById("upload");
		if (checkfile())
			form.submit();
	}
	function checkfile() {
		var obj = document.getElementById("fileField");
		photoExt = obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();
		if (photoExt != '.jpg') {
			document.getElementById("error").innerHTML = "Please upload a .jpg picture!";
			return false;
		}
		var fileSize = 0;
		var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
		if (isIE && !obj.files) {
			var filePath = obj.value;
			var fileSystem = new ActiveXObject("Scripting.FileSystemObject");
			var file = fileSystem.GetFile(filePath);
			fileSize = file.Size;
		} else {
			fileSize = obj.files[0].size;
		}
		fileSize = Math.round(fileSize / 1024 * 100) / 100;
		if (fileSize >= 11024) {
			document.getElementById("error").innerHTML = "The size of file must less than 1M";
			return false;
		}
		return true;
	}
	$('input[id=lefile]').change(function() {
		$('#photoCover').val($(this).val());
	});
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<header id="head" class="secondary"></header>
	<label id="error"></label>
	<center>
		<br>
		<div class="container">
			<h3>Please upload correct picture, we just accept format .jpg.</h3>
		</div>
	</center>
<br><br><br><br>
	<center>
		<div class="top-margin">
			<label>Select file to upload:</label>
			<div class="file-box">
				<form action="sell" method="post" enctype="multipart/form-data"
					id="upload">
					<input type='text' name='textfield' id='textfield' class='txt' />
					<input type="file" name="fileField" class="file" id="fileField"
						size="28"
						onchange="document.getElementById('textfield').value=this.value" />
					<input type="button" class="btn" value="Upload" onclick="check()" />
				</form>
			</div>
		</div>
	</center>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<jsp:include page="footer.jsp" />
</body>
</html>