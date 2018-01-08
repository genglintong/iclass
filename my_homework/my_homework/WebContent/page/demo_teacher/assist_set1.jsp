<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>   

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>助教设置方式一</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/page/demo_teacher/plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/page/demo_teacher/css/global.css" media="all">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/page/demo_teacher/plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/page/demo_teacher/css/layui.css">
	</head>

	<body>
	
	<div class="admin-main" style="">	
	<blockquote class="layui-elem-quote">
		<p>你可以在这里为学生设置助教-方式一</p>
	</blockquote>
	<fieldset class="layui-elem-field" style="margin-top:1%;">
	<form class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/teacher_findAllGroup" method="post">
		<button class="layui-btn layui-btn-sm" type="submit">查询所有小组</button>
	</form>
	<legend style="text-align: center;">助教配置</legend>
	<div class="layui-tab layui-tab-brief" style="padding-right: 3%;padding-left: 3%;height:300px;">
			<table class="site-table table-hover">
					<thead>
						<tr>
							<th style="text-align: center;">小组ID</th>
							<th style="text-align: center;">组名</th>
							<th style="text-align: center;">助教</th>
							<th style="text-align: center;">操作</th>
						</tr>
					</thead>
					<tbody>
						
						 <s:iterator value="groupAssitList" var="groupAssit"> 
							<tr>
							
							<td><s:property value="#groupAssit.group.groupId"/></td>
							<td><s:property value="#groupAssit.group.groupName"/>
						
							<div class="layui-input-inline">
							 	<input hidden="true" id="groupsaccountId" value=<s:property value="#groupAssit.group.groupId"/>>
							    </input>
							    </div>
							 </td>
							
							
							<%-- <td><s:property value="#groupAssit.group.groupName"/></td> --%>
							<td>
								<div class="layui-input-inline">
							    <select id="assisitant_select" name="assisitant_select">
							        <option value="">请选择助教</option>
							        <s:iterator value="assitList" var="Assit">
							        	<option value=<s:property value="#Assit.assitId"/>><s:property value="#Assit.assitId"/></option>
							        </s:iterator> 
							    </select>
							    </div>
    						</td>
    						 <i class="layui-icon">&#xe615;</i>
    						 
    						 
    						 <!--此处需要处理  -->
    						 <td>
							<button  class="layui-btn layui-btn-sm" value="确认"> <a onclick="Redirect()" href="#" >
							        <font style="color:white">确认选择</font></a> </button>
							 </td> 
							
							
							</tr>
						</s:iterator> 
						
					</tbody>
			</table>
		
	</div>
	</fieldset>
	
	<script>
	
	
	 function Redirect(){
		 var sel = document.getElementById("assisitant_select");
		 var groupId = document.getElementById("groupsaccountId").value;
	     var index = sel.selectedIndex;
	     var text = sel.options[index].text;
	     alert(text);
		top.location='${pageContext.request.contextPath}/teacher_setAssistImpl1?id='+text+'&&groupId='+groupId; 
	}
	
	
	
		function checkboxs()
		{
	
		var str=document.getElementsByName("select");
	
		var objarray=str.length;
		var chestr;
		for (i=0;i<objarray;i++)
		{
		  if(str[i].checked == true)
		  {
		   chestr = str[i].value;
		  }
		}
		return chestr;
		 <%--  alert("您先择的是："+chestr);
		  $.launchPage('<%=path %>/testmail/sendMail.action?checkbox='+chestr) --%>
		}
	</script>
	

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