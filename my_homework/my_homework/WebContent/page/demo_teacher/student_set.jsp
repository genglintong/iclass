<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "/struts-tags" prefix = "s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>导入学生</title>
		<link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="css/global.css" media="all">
		<link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="css/layui.css">
	</head>

	<body>
	<div class="admin-main">
		
		<blockquote class="layui-elem-quote">
			<p>老师您好，您可以在这里导入学生名单，注意导入文件格式需要是Excel格式</p>
		</blockquote>

		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
		<legend>导入学生</legend>
		</fieldset>
		 <s:form action="Teacher_importStudentList" method= "post" namespace="/" enctype="multipart/form-data" >		
			<s:file name = "studentList"/>		
			<input type = "submit" value="添加"/>
		</s:form>
	</div>

	<script src="layui.all.js" charset="utf-8"></script>

</body>

</html>