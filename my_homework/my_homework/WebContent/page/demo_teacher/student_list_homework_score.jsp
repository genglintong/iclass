<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title>学生作业成绩</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/page/demo_teacher/css/global.css" media="all">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/page/demo_teacher/plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/page/demo_teacher/css/layui.css" media="all" />

	</head>

	<body>
		<div class="admin-main">
			<blockquote class="layui-elem-quote">
				<p><b>老师您好，下面是&nbsp;&nbsp;孙悟空&nbsp;&nbsp;同学的作业成绩</b></p>
			</blockquote>

					
			<fieldset class="layui-elem-field">
				<legend style="text-align:center;">作业成绩</legend>
				<div class="layui-field-box">
					<table class="site-table table-hover">
						<thead>
							<tr>
								<th style="text-align: center;">作业次数</th>
								<th style="text-align: center;">作业分数</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="studentHKsList" var="homework"> 
							<tr>
								<td><s:property value="#homework.homeworkId"/></td>
								<td><s:property value="10"/></td>
							</tr>
						</s:iterator> 
						</tbody>
					</table>
				</div>
			</fieldset>	
		</div>

	</body>

</html>