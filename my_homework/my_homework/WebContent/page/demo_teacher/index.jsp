<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>课程管理系统</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="format-detection" content="telephone=no">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/page/demo_teacher/plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/page/demo_teacher/css/global.css" media="all">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/page/demo_teacher/plugins/font-awesome/css/font-awesome.min.css">

	</head>

	<body>
		<div class="layui-layout layui-layout-admin">
			<div class="layui-header header header-demo">

				<div class="layui-main">
					<div class="admin-login-box">
						<a class="logo" style="left: 0;" href="demo_teacher/index.jsp">
							<span style="font-size: 20px;"><b>课程管理系统-教师</b></span>
						</a>
						<div class="admin-side-toggle">
							<i class="fa fa-bars" aria-hidden="true"></i>
						</div>
					</div>

					<ul class="layui-nav admin-header-item">
						<li class="layui-nav-item">
							<a href="javascript:;" class="admin-header-user">
								<img src="images/people.jpg" />
								<span><s:property value="#session.teacher.teacherName"/></span>
							</a>
							<dl class="layui-nav-child">
							<dd>
								<a id="logout" href="Teacher_teacherlogout.action"><i class="fa fa-sign-out" aria-hidden="true"></i> 退出系统</a>
							</dd>
							</dl>
						</li>
					</ul>
				</div>
			</div>
			
			<div class="layui-side layui-bg-black" id="admin-side">
				<div class="layui-side-scroll" id="admin-navbar-side" lay-filter="side"></div>
			</div>

			<div class="layui-body" style="bottom: 0;border-left: solid 2px #1AA094;" id="admin-body">
				<div class="layui-tab admin-nav-card layui-tab-brief" lay-filter="admin-tab">
					<ul class="layui-tab-title">
						<li class="layui-this">
							<i class="fa fa-dashboard" aria-hidden="true"></i>
							<cite>项目纪要</cite>
						</li>
					</ul>
					<div class="layui-tab-content" style="min-height: 150px; padding: 5px 0 0 0;">
						<div class="layui-tab-item layui-show">
							<iframe src="${pageContext.request.contextPath}/teacher_getAllCourse.action"></iframe>
						</div>
					</div>
				</div>
			</div>
		</div>
	<script type="text/javascript" src="/my_homework/page/demo_teacher/plugins/layui/layui.js"></script>
	 <script>
	var navs = [{
		"title": "学生管理",
		"icon": "fa-cubes",
		"spread": false,
		"children": [{
			"title": "导入学生名单",
			"icon": "&#xe63c;",
			"href": "${pageContext.request.contextPath}/page/demo_teacher/student_set.jsp"
		},{
			"title": "设置小组配置",
			"icon": "&#xe63c;",
			"href": "${pageContext.request.contextPath}/page/demo_teacher/group_set.jsp"
		}]
	}, {
		"title": "助教设置",
		"icon": "fa-cogs",
		"spread": false,
		"children": [{
			"title": "设置方式一",
			"icon": "&#xe628;",
			"href": "${pageContext.request.contextPath}/teacher_setAssit1.action"
		},{
			"title": "设置方式二",
			"icon": "&#xe628;",
			"href": "${pageContext.request.contextPath}/teacher_setAssit2.action"
		}]
	}, {
		"title": "作业模块",
		"icon": "&#x1002;",
		"spread": false,
		"children": [{
			"title": "发布作业",
			"icon": "fa-check-square-o",
			"href": "${pageContext.request.contextPath}/page/demo_teacher/job_set.jsp"
		},{
			"title": "已发布作业",
			"icon": "fa-check-square-o",
			"href": "${pageContext.request.contextPath}/teacher_findAllSubject.action"
		}]
	}, {
		"title": "作业检查",
		"icon": "fa-address-book",
		"href": "",
		"spread": false,
		"children": [{
			"title": "检查学生作业",
			"icon": "fa-github",
			"href": "${pageContext.request.contextPath}/page/demo_teacher/job_check.jsp"
		}]
	},{
		"title": "课程签到",
		"icon": "fa-github",
		"href": "",
		"spread": false,
		"children": [{
			"title": "我要点名",
			"icon": "fa-github",
			"href": "${pageContext.request.contextPath}/teacher_findAllStudent.action"
		},{
			"title": "点名配置",
			"icon": "fa-github",
			"href": "${pageContext.request.contextPath}/page/demo_teacher/call_set.jsp"
		}]
	},  {
		"title": "学生信息",
		"icon": "fa-github",
		"href": "",
		"spread": false,
		"children": [{
			"title": "学生名单",
			"icon": "fa-qq",
			"href": "${pageContext.request.contextPath}/page/demo_teacher/student_list.jsp"
		}]
	}, {
		"title": "教师中心",
		"icon": "fa-github",
		"href": "",
		"spread": false,
		"children": [{
			"title": "创建课程",
			"icon": "fa-github",
			"href": "${pageContext.request.contextPath}/page/demo_teacher/add_course.jsp"
		},{
			"title": "个人信息",
			"icon": "fa-qq",
			"href": "${pageContext.request.contextPath}/page/demo_teacher/account.jsp"
		}]
	},
	];
	</script> 
	<!-- <script type="text/javascript" src="/my_homework/page/demo_teacher/datas/nav.js"></script> -->
	<script src="/my_homework/page/demo_teacher/js/index.js"></script>
</body>
</html>