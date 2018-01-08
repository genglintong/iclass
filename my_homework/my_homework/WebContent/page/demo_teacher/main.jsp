<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "/struts-tags" prefix = "s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>学生首页</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/demo_student/plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/demo_student/css/global.css" media="all">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/demo_student/plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/demo_student/css/layui.css">
	</head>

	<body>
		<div class="admin-main">
			<blockquote class="layui-elem-quote">
				<p><s:property value="#session.existStudent.studentName"/>&nbsp;&nbsp;老师你好，欢迎使用iclass管理平台，你可以在下方选择你的课程。</p>
			</blockquote>
			<fieldset class="layui-elem-field" style="margin-top:1%;">
				<legend>选择课程</legend>
				<div class="layui-tab layui-tab-brief" style="padding-right: 3%;padding-left: 3%;">
				<form class="layui-form layui-form-pane" action="Teacher_setCurrentCourse.action" >
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
									<s:iterator>
									<s:if test="#session.course.courseId == courseId">
								     <input type="radio" checked="checked" name="chooseCourse" value=<s:property value="courseId"/> title=<s:property value="courseName"/> >
								     </s:if>
								     <s:if test="#session.course.courseId != courseId">
								     <input type="radio" name="chooseCourse" value=<s:property value="courseId"/> title=<s:property value="courseName"/> >
								     </s:if>
								     </s:iterator>
		    						</td>
									<td><button class="layui-btn layui-btn-sm" type="submit">确认操作</button>
									</td>
								</tr>
							</tbody>
					</table>
				</form>
				</div>

			</fieldset>
			
		</div>
	</body>

	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/demo_student/layui.all.js"></script>

</html>