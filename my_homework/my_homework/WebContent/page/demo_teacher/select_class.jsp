<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title>学生设置</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/page/demo_teacher/plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/page/demo_teacher/css/global.css" media="all">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/page/demo_teacher/plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" type="${pageContext.request.contextPath}/page/demo_teacher/text/css" href="css/layui.css">
	</head>

	<body>
	<div class="admin-main" style="">	
	<blockquote class="layui-elem-quote">
		<p>您可以在这里更换您的课程</p>
	</blockquote>
	<fieldset class="layui-elem-field" style="margin-top:1%;">
		<legend style="text-align: center;">学生小组配置</legend>
		<div class="layui-tab layui-tab-brief" style="padding-right: 3%;padding-left: 3%;">
		<form class="layui-form layui-form-pane" action="" method="">
			<table class="site-table table-hover">
					<thead>
						<tr>
							<th style="text-align: center;">我的课程列表</th>
							<th style="text-align: center;width:150px;">操作</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
						      <input type="radio" name="class_code" value="男" title="机器学习">
						      <input type="radio" name="class_code" value="女" title="组成原理">
						      <input type="radio" name="class_code" value="女" title="编译原理">
    						</td>
							<td><a class="layui-btn layui-btn-sm" type="submit" href="main.html">确认操作</a>
							</td>
						</tr>
					</tbody>
			</table>
		</form>
		</div>

	</fieldset>

	<script src="${pageContext.request.contextPath}/page/demo_teacher/layui.all.js" charset="utf-8"></script>

</body>

</html>
