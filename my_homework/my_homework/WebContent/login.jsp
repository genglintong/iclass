<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "/struts-tags" prefix = "s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>登录你的账号</h1>
<s:form action="Student_stuLogin" method= "post" namespace="/" theme="simple">
	<h3><s:actionerror/></h3>
	<table border = "1" width = "400">
		<tr>
			<td>用户名</td>
			<td><s:textfield name = "account"/></td>			
		</tr>
		<tr>
			<td>密码</td>
			<td><s:textfield name = "password"/></td>			
		</tr>
		<tr>
			<td colspan ="2"><input type = "submit" value="登录"/></td>			
		</tr>
	</table>


</s:form>

<s:form action="Student_SearchScore" method= "post" namespace="/" theme="simple">
	<h3><s:actionerror/></h3>
	<table border = "1" width = "400">
		<tr>
			<td>课程号</td>
			<td><s:textfield name = "courseId"/></td>			
		</tr>
		<tr>
			<td>学生号</td>
			<td><s:textfield name = "studentId"/></td>			
		</tr>
		<tr>
			<td colspan ="2"><input type = "submit" value="登录"/></td>			
		</tr>
		<tr>
			<td colspan ="2"><input value="${score}"/></td>			
		</tr>
	</table>


</s:form>

</body>
</html>