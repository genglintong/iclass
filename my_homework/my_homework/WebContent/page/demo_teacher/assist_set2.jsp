<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title>助教设置方式二</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/page/demo_teacher/plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/page/demo_teacher/css/global.css" media="all">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/page/demo_teacher/plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/page/demo_teacher/css/layui.css">
	</head>

	<body>
	<div class="admin-main" style="">	
	<blockquote class="layui-elem-quote">
		<p>你可以在这里为学生设置助教-方式二</p>
	</blockquote>
	<fieldset class="layui-elem-field" style="margin-top:1%;">
	<legend style="text-align: center;">助教配置</legend>
	<div class="layui-tab layui-tab-brief" style="padding-right: 3%;padding-left: 3%;">
		<form class="layui-form layui-form-pane" action="" method="">
			<table class="site-table table-hover">
					<thead>
						<tr>
							<th style="text-align: center;width:100px;">助教列表</th>
							<th style="text-align: center;">列表</th>
							<th style="text-align: center;width:100px;">操作</th>
						</tr>
					</thead>
					<tbody>
					
					<s:iterator value="assitGroupList" var="assitGroup"> 
							<tr>
							<!-- <td><font id="groupsaccountId" value=></font></td> -->
							<%-- <td><s:property value="#assitGroup.assit.assitId"/></td> --%>
							<td>
							 <select id="groupsaccountId">
							        <s:iterator value="groupList" var="Group">
							        	<option value=<s:property value="#assitGroup.assit.assitId"/>><s:property value="#assitGroup.assit.assitId"/></option>
							        </s:iterator> 
							    </select>
							 </td>
							<td>
								<div class="layui-input-inline">
							    <select id="assisitant_select" name="assisitant_select">
							        <option value="">请选择小组序号</option>
							        <s:iterator value="groupList" var="Group">
							        	<option value=<s:property value="#Group.groupId"/>><s:property value="#Group.groupId"/></option>
							        </s:iterator> 
							    </select>
							    </div>
    						</td>
    						 <!--此处需要处理  -->
							<!-- <td><button class="layui-btn layui-btn-sm" ><a onclick="change()" href="#">确认</a></button></td>  -->
							<td>
							<button  class="layui-btn layui-btn-sm" value="确认"> <a onclick="Redirect()" href="#" >
							        <font style="color:white">确认选择</font></a> </button>
							 </td> 
<%-- 							<td><button class="layui-btn layui-btn-sm" ><a href="${pageContext.request.contextPath}/teacher_setAssistImpl2">确认</a></button></td>  --%>
							<!-- <td>
								<input type="submit" value="确认" />
							</td> -->
							<!-- </form> -->
							
							</tr>
						</s:iterator> 
					
						<!-- <tr>
							<td>孙悟空</td>
							<td>
							    <input type="checkbox" lay-skin="primary" title="2017-12-A" value="1">
							    <input type="checkbox" lay-skin="primary" title="2017-12-A" value="2">
    						</td>
							<td><a class="layui-btn layui-btn-sm" type="submit" href="">确认</a></td>
						</tr> -->
					</tbody>
			</table>
		</form>
	</div>
	</fieldset>
	
	

	<script src="${pageContext.request.contextPath}/page/demo_teacher/layui.all.js" charset="utf-8"></script>
	<script>
	
	 function Redirect(){
		 var sel = document.getElementById("assisitant_select");
		 var groupId = document.getElementById("groupsaccountId").value;
	     var index = sel.selectedIndex;
	    
	      
	     var text = sel.options[index].text;
	     alert(groupId);
		top.location='${pageContext.request.contextPath}/teacher_setAssistImpl2?id='+text+'&&groupId='+groupId; 
	}
	
    function RCheck(){
    //var select = document.getElementByName('assisitant_select').value;
    
    // var jsParamValue='aaaa';      
    // document.form1.jsParam.value=jsParamValue;
    // request.getPrameter("jsPrama");

    //if (select != "") {
    	//alert('select的值是：' + select);
    	//alert('select的值是：');
    	//return select;
    //}
  }

    
    function change()
    {
      var sel = document.getElementById("assisitant_select");
      var index = sel.selectedIndex;
      
      alert(sel.options[index].text);
      var text = sel.options[index].text;
      var isComing = document.getElementById("isComing");
      isComing.value= text;
      //alert(isComing.value); 
     //return sel.options[index].text;
    }
    
	
	function show(){
		var x = document.getElementsById("assisitant_select").value;
		//alert("dddd");
		//var index = x.val();
		alert(x);
		var d = x.options[index].value; //+ "--" +  x.options[index].text;

		document.getElementById("test").innerText = d;
		alert(d);
	}
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