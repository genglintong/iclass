<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
		<meta charset="UTF-8">
		<title>创建课程</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/page/demo_teacher/plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/page/demo_teacher/css/global.css" media="all">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/page/demo_teacher/plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" type="${pageContext.request.contextPath}/page/demo_teacher/text/css" href="css/layui.css">
	</head>

	<body>
	<div class="admin-main" style="">	
	<blockquote class="layui-elem-quote">
		<p>老师您好，您可以在这里添加新的课程</p>
	</blockquote>
	<fieldset class="layui-elem-field" style="margin-top:1%;">
		<legend style="text-align: center;">创建新的课程</legend>
      	<form class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/course_createCourse" style="padding: 2%">
		  
		<div class="layui-form-item" style="">
		    <label class="layui-form-label">课程名称</label>
		    <div class="layui-input-block">
		      <input type="text" name="courseName" autocomplete="off" placeholder="请输入课程名" class="layui-input" value="">
		    </div>
		</div>
		<div class="layui-form-item" style="">
		    <label class="layui-form-label">授课时长</label>
		    <div class="layui-input-block">
		      <input type="text" name="shoukeshichang" autocomplete="off" placeholder="请输授课时长" class="layui-input" value="">课时
		    </div>
		</div>
		<div class="layui-form-item" style="">
		    <label class="layui-form-label">考核方式</label>
		    <div class="layui-input-block">
		      <input type="text" name="kaohefangshi" autocomplete="off" placeholder="请输入考核方式" class="layui-input" value="">
		    </div>
		</div>
		<!--<div class="layui-form-item" style="">
		      <label class="layui-form-label">教师名称</label>
		      <div class="layui-input-block">
		        <input type="text" name="create_teacher" placeholder="输入教师名称" autocomplete="off" class="layui-input" value="">
		      </div>
		</div> -->

		<div class="layui-form-item">
      	<label class="layui-form-label">创建日期</label>
			<div class="layui-input-inline">
        		<input type="text" name="createdate" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input" value="">
	      	</div>
		</div>

		<div class="layui-form-item layui-form-text">
		    <label class="layui-form-label">课程简要描述</label>
		    <div class="layui-input-block">
		    <textarea placeholder="请描述作业的详细内容" class="layui-textarea" name="course_discription"></textarea>
		    </div>
		</div>

		<div class="layui-form-item" style="text-align:center;">
		    <button class="layui-btn" type="submit" >创建课程</button>
		</div>		
		</form> 
	</fieldset>

	<script src="layui.all.js" charset="utf-8"></script>
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