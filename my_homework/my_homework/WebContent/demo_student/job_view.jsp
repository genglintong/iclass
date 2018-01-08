<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "/struts-tags" prefix = "s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
		<html>
		<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>查看作业</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/demo_student/css/global.css" media="all">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/demo_student/plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/demo_student/css/layui.css" media="all" />

	</head>

	<body>
		<div class="admin-main">
			<blockquote class="layui-elem-quote">
				<p><b>同学你好，你可以在这里查看并提交作业</b></p>
			</blockquote>

			<fieldset class="layui-elem-field" style="padding:1%;">
			<div class="layui-inline">
				      <label class="layui-form-label">当前学科：<s:property value="#session.currentCourse.courseName"/></label>
			</div>
			<legend style="text-align:center;">查找条件</legend>

			<form class="layui-form layui-form-pane" action="Student_SearchConditionSubject.action" method="post">
				<div class="layui-form-item">
					<div class="layui-inline">
				      <label class="layui-form-label">是否提交</label>
				      <div class="layui-input-inline">
				        <select name="is_submit">
				        	<option value="">请选择是否提交</option>
				        	<option value="0">是</option>
				        	<option value="1">否</option>
				        	<option value="1" selected="selected" >全部</option>
				        </select>
				      </div>
				    </div>

				    <div class="layui-inline">
				    	<div class="layui-input-inline">
							<button type="submit" class="layui-btn" >查找</button>
						</div>
				    </div>
				</div>
			</form>
			</fieldset>
					
			<fieldset class="layui-elem-field">
				<legend style="text-align:center;">查看作业</legend>
				<div class="layui-field-box">
					<table class="site-table table-hover">
						<thead>
							<tr>
								<th style="text-align:center;">作业编号</th>
								<th style="text-align:center;">学科</th>
								<th style="text-align:center;">作业名称</th>
								<th style="text-align:center;">作业简述</th>
								<th style="text-align:center;">作业发布时间</th>
								<th style="text-align:center;">最迟提交时间</th>
								<th style="text-align:center;">作业权重</th>
								<th style="text-align:center;">是否提交</th>
								<th style="text-align:center;">操作</th>
							</tr>
						</thead>
						<tbody>
						<s:iterator value="courseSubjects">
							<tr>
								<td> <s:property value="subject.subjectId" /> </td>  
								<td><s:property value="course.courseName" /></td>
								<td><s:property value="subject.subjectTitle" /></td>
								<td><s:property value="subject.subjectDesc" /></td>
								<td><s:property value="subject.createDate" /></td>
								<td><s:property value="subject.deadLine" /></td>
								<td><s:property value="subject.quanzhong" /></td>
								<td><s:property value="state" /></td>
								
								<td><a href="Student_commitHomework.action?subjectId=${subject.subjectId}" class="layui-btn layui-btn-sm">去交作业</a></td>
							</tr>
						</s:iterator>
						</tbody>
					</table>
				</div>
			</fieldset>	
		</div>

	<script type="text/javascript" src="${pageContext.request.contextPath}/demo_student/layui.all.js"></script>
	<script>
	layui.use(['form', 'layedit', 'laydate', 'layer'], function(){
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