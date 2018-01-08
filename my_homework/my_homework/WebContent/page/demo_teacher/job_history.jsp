<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>   

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title>已发布作业</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/page/demo_teacher/plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/page/demo_teacher/css/global.css" media="all">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/page/demo_teacher/plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/page/demo_teacher/css/layui.css">
	</head>

	<body>
	<div class="admin-main" style="">	
	<blockquote class="layui-elem-quote">
		<p>老师您好，您可以在这里查看已经发布过的课堂作业</p>
	</blockquote>
	<fieldset class="layui-elem-field layui-field-title" style="margin-top:1%;">
	<legend style="text-align: center;">历史发布作业</legend>

	<ul class="layui-timeline" style="margin-left: 2%;margin-top: 1%;">
	 <s:iterator value="subjectList" var="subject"> 
		<li class="layui-timeline-item">
	    <i class="layui-icon layui-timeline-axis"></i>
	    <div class="layui-timeline-content layui-text">
	      <h3 class="layui-timeline-title"><s:property value="#subject.createDate"/></h3>
	     
				<p>作业名称：<s:property value="#subject.subjectTitle"/> </p> 
				<p>最终日期：<s:property value="#subject.deadLine"/> </p> 
				<p>作业描述： <s:property value="#subject.subjectDesc"/> </p>
			
	    </div>
		</li>
	</s:iterator> 
	</ul> 



	</fieldset>

	<script src="${pageContext.request.contextPath}/page/demo_teacher/layui.all.js" charset="utf-8"></script>
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