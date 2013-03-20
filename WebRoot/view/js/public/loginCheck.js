

function login() {
	if(submitInfo()){
		var mark = $("mark").value;
		useraction.check(mark,checkmark);
	}
}
function checkmark(data){
	
	if(data==1){
		var um = $("msg");
		um.style.display = "block";
		um.innerHTML = "<label style='color:red;font-size:12px;'>*验证码错误!</label>";
	}
	else{
		//document.loginfrm.submit();
	}
}
function checkName() {
	var npattter = /^[A-Za-z]{1}[A-Za-z0-9]{4,19}$/;
	var un = $("uname").value;
	var um = $("msg");
	if (!npattter.test(un)) {
		um.style.display = "block";
		um.innerHTML = "<label style='color:red;font-size:12px;'>*用户名必须以字母开头的数字和字母组成,且长度大于5小于20!</label>";
		return false;
	}
	um.style.display = "none";
	return true;
}

function checkPwd() {
	var np = $("pwd").value;
	var up = $("msg");
	var ppattter = /^[A-Za-z]{1}[A-Za-z0-9]{5,19}$/;
	if (!ppattter.test(np)) {
		up.style.display = "block";
		up.innerHTML = "<label style='color:red;font-size:12px;'>*密码必须以字母开头的数字和字母组成,且长度大于6小于20!</label>";
		return false;
	}
	up.style.display = "none";
	return true;
}

function submitInfo() {
	if (checkName() == true && checkPwd() == true) {
		return true;
	}
	return false;
}
