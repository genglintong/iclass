<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> --%>
    
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>   
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<meta charset="UTF-8">
		<title>我要点名</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/page/demo_teacher/plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/page/demo_teacher/css/global.css" media="all">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/page/demo_teacher/plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/page/demo_teacher/css/layui.css">
	</head>

	<body>
	<div class="admin-main" style="">	
	<blockquote class="layui-elem-quote">
		<p>老师您好，您可以在这里进行课程点名。您可以选中学生，然后在右边操作区点击是否出勤。</p>
	</blockquote>

<%-- <a href="${pageContext.request.contextPath}/teacher_findStudent">
											<font color="blue">查看详情</font> </a> --%>

	<fieldset class="layui-elem-field" style="margin-top:1%;">
		<legend style="text-align: center;">学生小组配置</legend>
		<div class="layui-tab layui-tab-brief" style="padding-right: 3%;padding-left: 3%;">
		<form class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/teacher_setCallNumber" method="post" style="margin-top: 1%;">
			<div class="layui-form-item">
			    <div class="layui-inline" style="float:left">
			      <label class="layui-form-label">选择次数</label>
			     	 <div class="layui-input-block">
					    <input type="text" name="callNumber" lay-verify="required" placeholder="点名次数" autocomplete="off" class="layui-input">
				  	</div>
			     </div>
			    <div class="layui-inline" style="float:left">
			    	<div class="layui-input-inline">
						<button type="submit" class="layui-btn" >确认选择</button>
					</div>
			    </div>
			</div>
		</form>
		
		
			<!-- <table id="demo" lay-filter="test"></table> -->

			<table class="site-table table-hover" id="demo" lay-filter="test">
					<thead>
						<tr>
							<th style="text-align: center;" lay-data="{field:'username', width:80}" rowspan="2">序号</th>
						<!-- 	<th style="text-align: center;" lay-data="{field:'username', width:80}" rowspan="2">班级编号</th> -->
							<th style="text-align: center;" lay-data="{field:'username', width:80}" rowspan="2">学号</th>
							<th style="text-align: center;" lay-data="{field:'username', width:80}" rowspan="2">学生姓名</th>
							<th style="text-align: center;" lay-data="{field:'username', width:80}" rowspan="2">性别</th>
							<th style="text-align: center;width: 200px;" lay-data="{field:'username', width:80}" rowspan="2">出勤情况</th>
							<!-- <th style="text-align: center;" lay-data="{field:'username', width:80}" rowspan="2">操作</th> -->
						</tr>
					</thead>
					
					<tbody>
						 <s:iterator value="studentList" var="Student"> 
							<tr>
								<td><s:property value="#Student.studentId"/></td>
								<td><s:property value="#Student.account"/></td>
								<td><s:property value="#Student.studentName"/></td>
								<td>不详</td>
								<td>
							     
							  	<button class="layui-btn layui-btn-sm"> <a href=
							  		<s:url value="teacher_callStudent">
							            <s:param name="account" value="%{#Student.studentId}"/>
							            <s:param name="isComing" value="'yes'"/>
							        </s:url>>
							        <font style="color:white">出勤</font></a> </button>
							        
							  	<button class="layui-btn layui-btn-sm"> <a href=
							  		<s:url value="teacher_callStudent">
							            <s:param name="account" value="%{#Student.studentId}"/>
							            <s:param name="isComing" value="'no'"/>
							        </s:url>>
							        <font style="color:white">缺勤</font></a> </button>
								</td>
							</tr>
						</s:iterator> 
						
					</tbody>
			</table>
		</div>

	</fieldset>

	<script src="${pageContext.request.contextPath}/page/demo_teacher/layui.all.js" charset="utf-8"></script>
<!-- 	<script>
	layui.use('table', function(){
	  var table = layui.table;
	  
	  //第一个实例
	  table.render({
	    elem: '#demo'
	    ,height: 315
	    ,url: 'http://www.layui.com/demo/table/user/' //数据接口
	    ,page: true //开启分页
	    ,cols: [[ //表头
	      {field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'}
	      ,{field: 'username', title: '用户名', width:80}
	      ,{field: 'sex', title: '性别', width:80, sort: true}
	      ,{field: 'city', title: '城市', width:80} 
	      ,{field: 'sign', title: '签名', width: 177}
	      ,{field: 'experience', title: '积分', width: 80, sort: true}
	      ,{field: 'score', title: '评分', width: 80, sort: true}
	      ,{field: 'classify', title: '职业', width: 80}
	      ,{field: 'wealth', title: '财富', width: 135, sort: true}
	    ]]
	  });
	  
	});
	</script>
	 -->
	<script>
	layui.use(['form', 'layedit', 'laydate','table'], function(){
	  var form = layui.form
	  var table = layui.table
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