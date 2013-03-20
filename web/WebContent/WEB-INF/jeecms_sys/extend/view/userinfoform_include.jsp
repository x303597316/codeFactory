<%@page import="com.jeecms.extend.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<html:hidden styleId="userId" property="userId" name="UserInfoForm"/>

	
	<tr>
		<td class="tdLabel">
			<%=UserInfo.ALIAS_USERNAME%>:
		</td>
		<td>
		<html:text  styleId="username" property="username" name="UserInfoForm"  maxlength="200" styleClass="" />
		</td>
	</tr>
	
	<tr>
		<td class="tdLabel">
			<%=UserInfo.ALIAS_PASSWORD%>:
		</td>
		<td>
		<html:text  styleId="password" property="password" name="UserInfoForm"  maxlength="200" styleClass="" />
		</td>
	</tr>
	
	<tr>
		<td class="tdLabel">
			<%=UserInfo.ALIAS_
_	_ _ _ BIRTH_DATE%>:
		</td>
		<td>
		<input value="${UserInfoForm.
	   birthDateString}" onclick="WdatePicker({dateFmt:'<%=UserInfo.FORMAT_
_	_ _ _ BIRTH_DATE%>'})"  id="
	   birthDateString" name="
	   birthDateString"  maxlength="0" class="" />
		</td>
	</tr>
	
	<tr>
		<td class="tdLabel">
			<%=UserInfo.ALIAS_SEX%>:
		</td>
		<td>
		<html:text  styleId="sex" property="sex" name="UserInfoForm"  maxlength="22" styleClass="validate-number " />
		</td>
	</tr>
	
	<tr>
		<td class="tdLabel">
			<%=UserInfo.ALIAS_AGE%>:
		</td>
		<td>
		<html:text  styleId="age" property="age" name="UserInfoForm"  maxlength="22" styleClass="validate-number " />
		</td>
	</tr>

