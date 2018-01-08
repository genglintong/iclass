<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title>检查作业</title>
		<!-- <meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"> -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/page/demo_teacher/css/global.css" media="all">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/page/demo_teacher/plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/page/demo_teacher/css/layui.css" media="all" />

	</head>

	<body>
		<div class="admin-main">
			<blockquote class="layui-elem-quote">
				<p><b>您可以在这里检查学生作业</b></p>
			</blockquote>

			<fieldset class="layui-elem-field" style="padding:1%;">
			<legend style="text-align:center;">查找条件</legend>

			<form class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/teacher_findHomework" method="post">
				<div style="height:100%;width:25%;float:left;">
					<div class="layui-form-item" style="width:292px;" >
					    <label class="layui-form-label">作业名称</label>
					    <div class="layui-input-block">
					    <input type="text" name="subjectTitle" lay-verify="required" placeholder="请输入作业名称" autocomplete="off" class="layui-input">
					    </div>
					</div>

					<div class="layui-form-item" style="width:310px;">
					    <div class="layui-inline">
					      <label class="layui-form-label">发布时间</label>
					      <div class="layui-input-block">
					        <input type="text" name="commitDate" id="date1" placeholder="请输入作业时间" autocomplete="off" class="layui-input">
					      </div>
					    </div>
				    </div>

				    <div class="layui-form-item" style="width:292px;">
					    <label class="layui-form-label">作业编号</label>
					    <div class="layui-input-block">
					    <input type="text" name="groupAccount" lay-verify="required" placeholder="请输入小组编号" autocomplete="off" class="layui-input">
					    </div>
					</div>
				</div>

				<div style="width:40%;float:left;">
					<div class="" style="margin-left:10%;line-height: 140px;">
				      <button class="layui-btn" type="submit"><i class="layui-icon">&#xe615;</i>查找</button>
				      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
				    </div>
				</div>

			</form>
			</fieldset>
					
			<fieldset class="layui-elem-field">
				<legend style="text-align:center;">作业列表</legend>
				<div class="layui-field-box">
					<table class="layui-table" lay-data="{id:'test'" lay-filter="demoEvent">>
						<thead>
							<tr>
				      			<th lay-data="{field:'homeworkId',width:100}">作业编号</th>
				      			<th lay-data="{field:'submit_time',width:140}">作业提交时间</th>
				      			<th lay-data="{field:'id',width:140}">小组编号</th>
				      			<th lay-data="{field:'job_name',width:300}"><a href="#">作业名称</a></th>
				      			<th lay-data="{field:'submit_name',width:100}">提交人姓名</th>
				      			<th lay-data="{field:'score',edit: 'text', event: 'setScore', style:'cursor: pointer;'}">作业分数(可编辑)</th>
				      			<th lay-data="{field:'edit' , event: 'submit'}">操作</th>
				    		</tr>
						</thead>
						<tbody>
							<s:iterator value="homeworkList" var="hk"> 
								<tr>
									<td id = "homeworkId"><s:property value="#hk.homework.homeworkId"/></td>
									<td><s:property value="#hk.homework.commitDate"/></td>
									<td><s:property value="#hk.homework.groupId"/></td>
									<td><a href="${hk.address}" download="${hk.fileName}"><s:property value="#hk.subject"/></a></td>
									<td><s:property value="#hk.authorName"/></td>
									<td id = "score" style="font-weight: bold;"><s:property value="#hk.homework.score"/></td>
									
								<!-- 	<button class="layui-btn layui-btn-sm"> <a href=
							  		<s:url value="teacher_SetHomeworkScore">
							            <s:param name="currentHomeworkId" value="%{#hk.homework.homeworkId}"/>
							            <s:param name="currentScore" value="%{#hk.homework.score}"/>
							        </s:url>></a></button> -->
									
								<td><button  class="layui-btn layui-btn-sm" value="确认"> <font style="color:white">提交成绩</font></button></td>								</tr> 
							</s:iterator> 
							
		
<%-- 						<tr>
								<td>null</td>
								<td>null</td>
								<td>2016-11-16</td>
								<td>哈哈哈</td>
								<td>null</td>
								<td>2016-11-16</td>
								<td>哈哈哈</td>
								<td><a href="" class="layui-btn layui-btn-normal layui-btn-sm">编辑</a></td>
							</tr>
 --%>						</tbody>
					</table>
				</div>
			</fieldset>	
		</div>

	<script type="text/javascript" src="${pageContext.request.contextPath}/page/demo_teacher/layui.all.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/demo_teacher/js/jquery-1.8.0.min.js"></script>
	<script>
	
	function Redirect(){
		 var sel = document.getElementById("homeworkId").innerHTML;
		 var groupId = document.getElementById("score").innerHTML;
	    // alert(groupId,sel);
	     console.log('${pageContext.request.contextPath}/teacher_SetHomeworkScore?homeworkId='+sel+'&&score='+groupId);
		top.location='${pageContext.request.contextPath}/teacher_SetHomeworkScore?homeworkId='+sel+'&&score='+groupId; 
	}
	
	layui.use('table', function(){
		  var table = layui.table; 
		
		  //监听单元格事件
		  table.on('tool(demoEvent)', function(obj){
		    var data = obj.data;
		    
		    
		    if(obj.event === 'submit'){
		    	var score = data.score;
		    	//var homeworkId = document.getElementById("homeworkId").innerHTML;
		    	var homeworkId = data.homeworkId;
		    	
		    	var jumpUrl ='${pageContext.request.contextPath}/teacher_SetHomeworkScore?homeworkId='+homeworkId+'&&score='+score;
		    	$.ajax({ 
		            url: jumpUrl,
		    		type: 'POST',  
		            data: data,  
		            dataType: 'JSON',  
		            cache: false,  
		            processData: false,  
		            contentType: false
		    		}).done(function(ret){
		    			alert("成绩已提交，score=" + score);
		    		});
		    	//alert(score+" "+homeworkId);
		    	//console.log("sgdsfgds"+homeworkId);
		    }
		    
		    if(obj.event === 'setScore'){
		      layer.prompt({
		        formType: 2
		        ,title: '设置 小组编号 为 ['+ data.id +'] 的作业分数 '+data.score+''
		        ,value: data.score
		      }, function(value, index){
		        layer.close(index);

		        obj.update({
		          score: value
		          
		        });
		        var score = data.score;
		        //alert(obj.value);
		        //top.location='${pageContext.request.contextPath}/teacher_SetHomeworkScore?homeworkId='+homeworkId+'&&score='+score; 
		      });
		      
		    }
		  });
		});
	</script>

	</body>

</html>