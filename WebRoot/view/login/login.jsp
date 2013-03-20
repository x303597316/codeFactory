<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=utf-8"%>
<%@taglib prefix="logic" uri="http://struts.apache.org/tags-logic"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="bean" uri="http://struts.apache.org/tags-bean"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">


<title>SSH整合</title>
<script type="text/javascript"
	src='<%=request.getContextPath()%>/dwr/engine.js'></script>
<script type="text/javascript"
	src='<%=request.getContextPath()%>/dwr/util.js'></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/view/js/dwr/system/loginDwr.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/view/js/public/loginCheck.js"></script>
<script type="text/javascript">
  
 
	function opens() {
		alert("----");
		var str = loginDwr_userLogin("");
		alert(str);
		return str;
	}

	var req;
	function validate() {
		// 获取表单提交的内容
		var idField = document.getElementById("username");
		// 访问validate.do这个servlet，同时把获取的表单内容idField加入url字符串，以便传递给validate.do

		var url = "system/toIndex.action?id=" + escape(idField.value);
		// 创建一个XMLHttpRequest对象req
		if (window.XMLHttpRequest) {
			// IE7, Firefox, Opera支持
			req = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			// IE5,IE6支持
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}
		/*
		 * 16. open(String method,String url, boolean )函数有3个参数 17.
		 * method参数指定向servlet发送请求所使用的方法，有GET,POST等 18.
		 * boolean值指定是否异步，true为使用，false为不使用。 19. 我们使用异步才能体会到Ajax强大的异步功能。 20.
		 */
		req.open("GET", url, true);
		// onreadystatechange属性存有处理服务器响应的函数,有5个取值分别代表不同状态
		req.onreadystatechange = callback;
		// send函数发送请求
		req.send(null);
	}

	function callback() {
		if (req.readyState == 4 && req.status == 200) {
			var check = req.responseText;
			show(check);
		}
	}

	function show(str) {
		if (str == "OK") {
			var show = "<font color='green'>恭喜！！用户名可用！</font>";
			//alert(show);
			document.getElementById("info").innerHTML = show;
		} else if (str == "NO") {
			var show = "<font color='red'>对不起，用户名不可用！！请重新输入！</font>";
			//alert(show);
			document.getElementById("info").innerHTML = show;
		}
	}
	 
</script>
</head>

<body>
	<center>
		<h2>用户登录</h2>
	</center>

	<form id="myform" action="<%=basePath%>system/validatorLogin.action" method="post">
		<table>

			<tr>
				<td>用户名：</td>
				<td><input type="text" name="username" id="username" />
				</td>
			</tr>
			<tr>
				<td>密码：</td>
				<td><input type="password" name="password" />
				</td>
			</tr>
			<!-- tr>
				<td>验证码：</td>
				<td><img align="middle" src="view/commons/random.jsp" id="pic">
					<a href="javascript:void(0);" onclick="changeImg();">换一张</a>
				</td>
				<td></td>
				<td></td>
			</tr >
			<tr>
				<td>输入验证码：</td>
				<td><input type="text" name="chkmsg" id="chkmsg" /></td>
			</tr-->
			<tr>
				<td><input type="submit" name="sub"   value="登录" /></td>
				<td><input type="button" name="b2" value="注册"
					onClick="window.open('register.jsp','new','height=250,width=400,top=100,left=400')" />
				</td>

			</tr>
			<!-- tr>
				<td><input type="text" id="checkCode" value="<%=session.getAttribute("rand")%>" />
				</td>
				<td></td>

			</tr -->
		</table>

		<div id="info"></div>
	</form>

</body>
</html>
