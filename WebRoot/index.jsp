<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'login.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>

	<body>

		<%
			//  response.sendRedirect(basePath + "/jeeadmin/jeecms/index.do");
			// response.sendRedirect(basePath + "/system/index.action");
		%>
		<form id="myform" action="<%=basePath%>jeeadmin/jeecms/index.do">
			<center>
				以下链接只有一个实现了，接下来的都会慢慢的实现
			</center>
			<p>
				<b> 后台登陆地址:<a
					href="http://127.0.0.1:8088/codeFactory/jeeadmin/jeecms/index.do"
					target="_blank">http://127.0.0.1:8088/codeFactory/jeeadmin/jeecms/index.do</a>
				</b>
			</p>

			<table align="center">
				<tr>
					<td  >
						<pre>
系统要求：
运行环境：
申明：
说明 
	                    </pre>
					</td>
				</tr>
				<tr>
					<td align="left">
						<a href="<%=basePath%>jeeadmin/jeecms/index.do" target="_blank">进入到jeecms登陆界面后台</a>
					</td>
				</tr>

				<tr align="center">
					<td align="left">
						<a href="<%=basePath%>system/login.action" target="_blank">struts2+spring3+hibernate3后台登陆</a>

					</td>
				</tr>
				<tr align="center">
					<td align="left">
						<a href="<%=basePath%>jeeadmin/jeecms/index.do" target="_blank">struts2+spring3+ibaits后台登陆</a>

					</td>
				</tr>


				<tr align="center">
					<td align="left">
						<a href="<%=basePath%>jeeadmin/jeecms/index.do" target="_blank">spring对象操作</a>

					</td>
				</tr>


				<tr align="center">
					<td align="left">
						<a href="<%=basePath%>jeeadmin/jeecms/index.do" target="_blank">自动生成代码</a>

					</td>
				</tr>

				<tr align="center">
					<td align="left">
						<a href="<%=basePath%>jeeadmin/jeecms/index.do" target="_blank">jeecms前台界面查看</a>

					</td>
				</tr>

				<tr align="center">
					<td align="left">
						<a href="<%=basePath%>jeeadmin/jeecms/index.do" target="_blank">freemarker</a>

					</td>
				</tr>


				<tr align="center">
					<td align="left">
						<a href="<%=basePath%>jeeadmin/jeecms/index.do" target="_blank">jquery</a>

					</td>
				</tr>


				<tr align="center">
					<td align="left">
						<a href="<%=basePath%>jeeadmin/jeecms/index.do" target="_blank">ext表格编辑</a>

					</td>
				</tr>


				<tr align="center">
					<td align="left">
						<a href="<%=basePath%>jeeadmin/jeecms/index.do" target="_blank">json</a>

					</td>
				</tr>


				<tr align="center">
					<td align="left">
						<a href="<%=basePath%>jeeadmin/jeecms/index.do" target="_blank">分页</a>

					</td>
				</tr>


				<tr align="center">
					<td align="left">
						<a href="<%=basePath%>jeeadmin/jeecms/index.do" target="_blank">ext表格编辑</a>

					</td>
				</tr>

				<tr align="center">
					<td align="left">
						<a href="<%=basePath%>jeeadmin/jeecms/index.do" target="_blank">dwr操作</a>

					</td>
				</tr>

				<tr align="center">
					<td align="left">
						<a href="<%=basePath%>jeeadmin/jeecms/index.do" target="_blank">审批流程</a>

					</td>
				</tr>

				<tr align="center">
					<td align="left">
						<a href="<%=basePath%>jeeadmin/jeecms/index.do" target="_blank">hibernate缓存</a>

					</td>
				</tr>

				<tr align="center">
					<td align="left">
						<a href="<%=basePath%>jeeadmin/jeecms/index.do" target="_blank">struts2详细说明</a>

					</td>
				</tr>
			</table>


		</form>
	</body>
</html>
