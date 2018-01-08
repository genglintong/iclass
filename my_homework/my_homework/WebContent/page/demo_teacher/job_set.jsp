<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title>发布作业</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/page/demo_teacher/plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/page/demo_teacher/css/global.css" media="all">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/page/demo_teacher/plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" type="${pageContext.request.contextPath}/page/demo_teacher/text/css" href="css/layui.css">
	</head>

	<body>
	<div class="admin-main" style="">	
	<blockquote class="layui-elem-quote">
		<p>老师您好，您可以在这里发布您的课堂作业</p>
	</blockquote>
	<fieldset class="layui-elem-field" style="margin-top:1%;">
		<legend style="text-align: center;">发布作业</legend>
      	<form class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/teacher_setSubject" method="post" style="padding: 2%">
		  
			<div class="layui-form-item" style="">
			    <label class="layui-form-label">作业名称</label>
			    <div class="layui-input-block">
			      <input type="text" name="subject.subjectTitle" autocomplete="off" placeholder="请输入作业名称" class="layui-input">
			    </div>
			</div>
	
			<div class="layui-form-item">
	      	<label class="layui-form-label">发布日期</label>
				<div class="layui-input-inline">
	        		<input type="text" name="subject.createDate" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
		      	</div>
			</div>
			
			<div class="layui-form-item">
	      	<label class="layui-form-label">提交日期</label>
				<div class="layui-input-inline">
	        		<input type="text" name="subject.deadLine" id="date1" lay-verify="date1" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
		      	</div>
			</div>
	
			<div class="layui-form-item" style="width:300px;">
			    <label class="layui-form-label">成绩比例</label>
			    <div class="layui-input-block">
			      <select name="rate_grade" lay-filter="">
			        <option value="10">10%</option>
			        <option value="20">20%</option>
			        <option value="30">30%</option>
			        <option value="40">40%</option>
			        <option value="60">60%</option>
			      </select>
			    </div>
			</div>
	
			<div class="layui-form-item layui-form-text">
			    <label class="layui-form-label">作业描述</label>
			    <div class="layui-input-block">
			    <textarea placeholder="请描述作业的详细内容" class="layui-textarea" name="subject.subjectDesc"></textarea>
			    </div>
			</div>
			 <div class="layui-form-item" style="text-align:center;">
			    <button class="layui-btn" type="submit">发布作业</button>
			</div>	 
		</form> 
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