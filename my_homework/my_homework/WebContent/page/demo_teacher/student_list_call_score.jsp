<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title>学生签到成绩</title>
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
				<p><b>老师您好，下面是&nbsp;&nbsp;&nbsp;&nbsp;签到成绩</b></p>
			</blockquote>
					
			<fieldset class="layui-elem-field">
				<legend style="text-align:center;">作业成绩</legend>
				<div class="layui-field-box">
					<table class="site-table table-hover">
						<thead>
							<tr>
								<th style="text-align:center;">签到次数</th>
								<th style="text-align:center;">是否出勤</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="studentLogsList" var="logs"> 
							<tr>
								<td><s:property value="#logs.callNumber"/></td>
								<td><s:property value="#logs.isComing"/></td>
							</tr>
						</s:iterator> 
						</tbody>
					</table>
				</div>
			</fieldset>	

		</div>

	</body>

</html>