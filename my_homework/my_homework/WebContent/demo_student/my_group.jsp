<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "/struts-tags" prefix = "s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>我的小组</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="css/global.css" media="all">
		<link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="css/layui.css" media="all"/>

	</head>

	<body>
	
		<div class="admin-main">
			<blockquote class="layui-elem-quote">
				<p><b>同学你好，你可以在这里查看自己所在的小组信息</b></p>
			</blockquote>
					
			<fieldset class="layui-elem-field">
				<legend style="text-align:center;">我的小组</legend>
				<div class="layui-field-box">
					<table class="site-table table-hover">
						<thead>
							<tr>
								<th style="text-align:center;">小组编号</th>
								<th style="text-align:center;">小组人数</th>
								<th style="text-align:center;">小组成员</th>
								<th style="text-align:center;">组长</th>
								<th style="text-align:center;">联系方式</th>
								<!-- <th style="text-align:center;">操作</th> -->
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><s:property value="group.groupName"/></td>
								<td><s:property value="group.personNum"/></td>
								<td><s:property value="allname"/></td>
								<td><s:property value="leader.studentName"/></td>
								<td><s:property value="group.phoneNum"/></td>
								<!-- <td><a href="#" class="layui-btn layui-btn-sm">去交作业</a></td> -->
							</tr>

						</tbody>
					</table>
				</div>
			</fieldset>	
		</div>
	<script type="text/javascript" src="layui.all.js"></script>
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