function check() {
	var name = document.getElementById("name").value;
	if (name.length > 20) {
		document.getElementById("error").innerHTML = "Username must less than 20 characters!";
		return false;
	} else
		document.getElementById("error").innerHTML = "";
	var pwd = document.getElementById("pwd").value;
	var cfpwd = document.getElementById("cfpwd").value;
	if (pwd != cfpwd) {
		document.getElementById("error").innerHTML = "The two passwords you typed do not match!";
		return false;
	} else
		document.getElementById("error").innerHTML = "";
	var email = document.getElementById("email").value;
	if (email.length > 0
			&& (email
					.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == -1)) {
		document.getElementById("error").innerHTML = "Please input a valid email address!";
		return false;
	} else
		document.getElementById("error").innerHTML = "";
	if (email.length > 0 && pwd.length > 0 && name.lenth == 0) {
		document.getElementById("error").innerHTML = "Username or password must not be empty";
		return false;
	} else
		document.getElementById("error").innerHTML = "";
	return true;
}