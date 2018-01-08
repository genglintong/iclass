<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
		<html>
		<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>课程管理系统</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="format-detection" content="telephone=no">
		<link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="css/global.css" media="all">
		<link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.min.css">

	</head>

	<body>
		<div class="layui-layout layui-layout-admin">
			<div class="layui-header header header-demo">

				<div class="layui-main">
					<div class="admin-login-box">
						<a class="logo" style="left: 0;" href="index.html">
							<span style="font-size: 22px;"><b>课程管理系统</b></span>
						</a>
						<div class="admin-side-toggle">
							<i class="fa fa-bars" aria-hidden="true"></i>
						</div>
					</div>

					<ul class="layui-nav admin-header-item">
						<li class="layui-nav-item">
							<a href="javascript:;" class="admin-header-user">
								<img src="images/people.jpg" />
								<span>{$teature.name}</span>
							</a>
							<dl class="layui-nav-child">
							<dd>
								<a id="logout" href="../login.html"><i class="fa fa-sign-out" aria-hidden="true"></i> 退出系统</a>
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
							<iframe src="Student_ChooseCourse.action"></iframe>
						</div>
					</div>
				</div>
			</div>
		</div>
	<script type="text/javascript" src="plugins/layui/layui.js"></script>
	<script >
	var navs = [{
		"title": "我的课程",
		"icon": "fa-cubes",
		"spread": false,
		"children": [{
			"title": "查看课程信息",
			"icon": "&#xe63c;",
			"href": "Student_SearchCourse.action"
		}]
	}, {
		"title": "我的小组",
		"icon": "fa-cogs",
		"spread": false,
		"children": [{
			"title": "我的小组",
			"icon": "&#xe628;",
			"href": "${pageContext.request.contextPath}/demo_student/my_group.jsp"
		},{
			"title": "创建小组",
			"icon": "&#xe628;",
			"href": "Course_CreateGroup.action"
		}]
	}, {
		"title": "小组作业",
		"icon": "&#x1002;",
		"spread": false,
		"children": [{
			"title": "查看提交作业",
			"icon": "fa-check-square-o",
			"href": "Student_SearchAllSubject.action"
		}
		]
	// }, {
//	 	"title": "我的成绩",
//	 	"icon": "fa-address-book",
//	 	"href": "",
//	 	"spread": false,
//	 	"children": [{
//	 		"title": "查看成绩",
//	 		"icon": "fa-github",
//	 		"href": "grade_view.html"
//	 	}]
	},  {
		"title": "个人中心",
		"icon": "fa-github",
		"href": "",
		"spread": false,
		"children": [{
			"title": "个人信息",
			"icon": "fa-qq",
			"href": "Student_showInfo.action"
		}]
	},
	];
	
	
	</script>
	<script src="js/index.js"></script>
</body>
</html>