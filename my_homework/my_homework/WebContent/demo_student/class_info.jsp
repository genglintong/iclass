<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "/struts-tags" prefix = "s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>发布作业</title>
		<link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="css/global.css" media="all">
		<link rel="stylesheet" href="css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="css/layui.css">
	</head>

	<body>
	<div class="admin-main" style="">	
	<blockquote class="layui-elem-quote">
		<p>你好同学，你可以在这里查看该课程信息</p>
	</blockquote>

	<fieldset class="layui-elem-field" style="padding: 1%;">
  	<legend style="">查看课程信息</legend>
	<div class="layui-collapse" lay-filter="test">
	<s:iterator >
	  <div class="layui-colla-item">
	   <h2 class="layui-colla-title"><s:property value="course.courseName"/></h2>
	    <div class="layui-colla-content">
			<h3>授课教师：<s:property value="teacher.teacherName"/></h3>
			<h3>授课时长：<s:property value="course.shoukeshichang"/>课时</h3>
			<h3>考核方式：<s:property value="course.kaohefangshi"/></h3>
	    </div>
	  </div>
	  </s:iterator >

	</div>
	</fieldset>
<!-- 	<fieldset class="layui-elem-field" style="margin-top:1%;">
		<legend style="text-align: center;">发布作业</legend>
      	<form class="layui-form layui-form-pane" action="" style="padding: 2%">
		  
		<div class="layui-form-item" style="">
		    <label class="layui-form-label">作业名称</label>
		    <div class="layui-input-block">
		      <input type="text" name="title" autocomplete="off" placeholder="请输入作业名称" class="layui-input">
		    </div>
		</div>
		
		<div class="layui-form-item" style="">
		      <label class="layui-form-label">编号设置</label>
		      <div class="layui-input-block">
		        <input type="number" name="price_min" placeholder="请输入成绩" autocomplete="off" class="layui-input">
		      </div>
		</div>

		<div class="layui-form-item">
      	<label class="layui-form-label">提交日期</label>
			<div class="layui-input-inline">
        		<input type="text" name="date" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
	      	</div>
		</div>
		
		<div class="layui-form-item" style="width:300px;">
		    <label class="layui-form-label">成绩比例</label>
		    <div class="layui-input-block">
		      <select name="interest" lay-filter="">
		        <option value="" selected=""></option>
		        <option value="0">10%</option>
		        <option value="1">20%</option>
		        <option value="2">30%</option>
		        <option value="3">40%</option>
		        <option value="4">60%</option>
		      </select>
		    </div>
		</div>

		<div class="layui-form-item layui-form-text">
		    <label class="layui-form-label">作业描述</label>
		    <div class="layui-input-block">
		    <textarea placeholder="请描述作业的详细内容" class="layui-textarea"></textarea>
		    </div>
		</div>
		<div class="layui-form-item" style="text-align:center;">
		    <button class="layui-btn" lay-submit="" lay-filter="demo2">发布作业</button>
		</div>		
		</form> 
	</fieldset> -->

	<script src="${pageContext.request.contextPath}/demo_student/layui.all.js" charset="utf-8"></script>
<!-- 	<script>
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
	</script> -->

</body>

</html>