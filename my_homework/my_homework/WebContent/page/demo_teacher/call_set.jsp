<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
		<meta charset="UTF-8">
		<title>点名配置</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/page/demo_teacher/plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/page/demo_teacher/css/global.css" media="all">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/page/demo_teacher/plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/page/demo_teacher/css/layui.css">
	</head>

	<body>
	<div class="admin-main" style="">	
	<blockquote class="layui-elem-quote">
		<p>老师您好，您可以在这里设置点名配置信息</p>
	</blockquote>
	<fieldset class="layui-elem-field" style="margin-top:1%;">
		<legend style="text-align: center;">点名配置</legend>
      	<form class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/teacher_setCallParmater" style="padding: 2%">

		<div class="layui-form-item" style="width:300px;">
		    <label class="layui-form-label">点名次数</label>
		    <div class="layui-input-block">
		      <select name="allCallNumber" lay-filter="">
		      	<option value="" selected="1">设置点名次数</option>
		        <option value="1">1次</option>
		        <option value="2">2次</option>
		        <option value="3">3次</option>
		        <option value="4">4次</option>
		        <option value="5">5次</option>
		        <option value="6">6次</option>
		        <option value="7">7次</option>
		        <option value="8">8次</option>
		      </select>
		    </div>
		</div>

		<div class="layui-form-item" style="width:300px;">
		    <label class="layui-form-label">缺勤扣分</label>
		    <div class="layui-input-block">
		      <select name="onCallScore" lay-filter="">
		      	<option value="" selected="1">设置缺勤扣分</option>
		        <option value="1">1分</option>
		        <option value="2">2分</option>
		        <option value="3">3分</option>
		        <option value="4">4分</option>
		        <option value="5">5分</option>
		      </select>
		    </div>
		</div>

		<div class="layui-form-item" style="text-align:center;">
		    <button class="layui-btn" type="submit">保存设置</button>
		</div>		
		</form> 
	</fieldset>

	<script src="${pageContext.request.contextPath}/page/demo_teacher/layui.all.js" charset="utf-8"></script>
	<script>
	layui.use(['form', 'layedit', 'laydate'], function(){
	  var form = layui.form
	  ,layer = layui.layer
	  
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