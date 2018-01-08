<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title>学生名单</title>
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
				<p><b>老师您好，您可以在这里查看学生名单</b></p>
			</blockquote>

			<fieldset class="layui-elem-field" style="padding:1%;">
			<legend style="text-align:center;">查找条件</legend>

			<form class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/teacher_findStudent" method="post">
				<!-- <div class="layui-form-item" style="width:292px;float:left;" >
					    <label class="layui-form-label">作业名称</label>
					    <div class="layui-input-block">
					    <input type="text" name="job_name" lay-verify="required" placeholder="请输入作业名称" autocomplete="off" class="layui-input">
					    </div>
				</div> -->
				
			    <div class="layui-form-item" style="width:292px;float: left;">
					    <label class="layui-form-label">小组编号</label>
					    <div class="layui-input-block">
					    <input type="text" name="groupAccount" lay-verify="required" placeholder="请输入小组编号" autocomplete="off" class="layui-input">
					    </div>
				</div>

				<div style="width:40%;float:left;">
					<div class="" style="margin-left:5%;line-height:37px;">
				      <button class="layui-btn" type="submit"><i class="layui-icon">&#xe615;</i>查找</button>
				      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
				    </div>
				</div>

			</form>
			</fieldset>
					
			<fieldset class="layui-elem-field">
				<legend style="text-align:center;">学生名单</legend>
				<div class="layui-field-box">
					<table class="site-table table-hover">
						<thead>
							<tr>
								<th style="text-align: center;">姓名</th>
								<th style="text-align: center;">学号</th>
								<th style="text-align: center;">作业总成绩(点击查看详细)</th>
								<th style="text-align: center;">签到总成绩(缺勤扣分)</th>
								<th style="text-align: center;">综合成绩</th>
							</tr>
						</thead>
						<tbody>
							<!-- <tr>
								<td>2014211302</td>
								<td>孙悟空</td>
								<td>2014211171</td>
								<td style="font-weight: bold;"><a href="student_list_homework_score.html">234</a></td>
								<td style="font-weight: bold;"><a href="student_list_call_score.html">35</a></td>
								<td>80</td>
							</tr> -->
							<s:iterator value="studentList" var="Student"> 
							<tr>
								<!-- <td><s:property value="#Student.studentId"/></td> -->
								<td><s:property value="#Student.student.studentName"/></td>
								<td><s:property value="#Student.student.account"/></td>
								<%-- <td><s:property value="#Student.homeWorkScore"/></td> --%>
								
								<td>
									<a href=
							  		<s:url value="teacher_getHKScoreInfo">
							            <s:param name="studentId" value="#Student.student.studentId"/>
							        </s:url>>
							       <s:property value="#Student.homeWorkScore"/> </a>
								</td>
								
								<td>
									<a href=
							  		<s:url value="teacher_getCallScoreInfo">
							            <s:param name="studentId" value="#Student.student.studentId"/>
							        </s:url>>
							       <s:property value="#Student.callScore"/> </a>
								</td>
								<td><s:property value="#Student.allScore"/></td>
							</tr>
						</s:iterator> 
						</tbody>
					</table>
				</div>
				
		
				<div class="layui-form-item">
					<div class="layui-input-block">
					<a href="${pageContext.request.contextPath}/teacher_downLoadExcel" class="layui-btn layui-btn-normal layui-btn-sm">生成excel</a>
				    <a href=<s:property value="#session.path"/> download="score.xls" class="layui-btn layui-btn-normal layui-btn-sm">下载成绩单（请先生成）</a>
				     <!--  <button class="layui-btn">导出excel</button> -->
				    </div>
				</div>
			</fieldset>	
		</div>

	<script type="text/javascript" src="${pageContext.request.contextPath}/page/demo_teacher/layui.all.js"></script>
	<script>
	layui.use(['form', 'layedit', 'laydate'], function(){
	  var form = layui.form
	  ,layer = layui.layer
	  ,layedit = layui.layedit
	  ,laydate = layui.laydate;
	  
	  //日期
	  laydate.render({
	    elem: '#date'
	  });
	  laydate.render({
	    elem: '#date1'
	  });
	  
	  //创建一个编辑器
	  var editIndex = layedit.build('LAY_demo_editor');
	 
	  //自定义验证规则
	  form.verify({
	    title: function(value){
	      if(value.length < 5){
	        return '标题至少得5个字符啊';
	      }
	    }
	    ,pass: [/(.+){6,12}$/, '密码必须6到12位']
	    ,content: function(value){
	      layedit.sync(editIndex);
	    }
	  });
	  
	  //监听指定开关
	  form.on('switch(switchTest)', function(data){
	    layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
	      offset: '6px'
	    });
	    layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
	  });
	  
	  //监听提交
	  form.on('submit(demo1)', function(data){
	    layer.alert(JSON.stringify(data.field), {
	      title: '最终的提交信息'
	    })
	    return false;
	  });
		});
	</script>

	</body>

</html>