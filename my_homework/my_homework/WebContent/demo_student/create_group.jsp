<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "/struts-tags" prefix = "s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>创建小组</title>
		<link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="css/global.css" media="all">
		<link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="css/layui.css">
	</head>

	<body>
	<div class="admin-main" style="">	
	<blockquote class="layui-elem-quote">
		<p>你好同学，你可以在这里创建你的学习小组，大家一起学习，效率才会更高</p>
	</blockquote>
	<fieldset class="layui-elem-field" style="margin-top:1%;">
		<legend style="text-align: center;">创建学习小组</legend>
      	<s:form name="test" action="Course_getCheckBox?groupId=%{group.groupId}" type="post" namespace="/" style="padding: 2%">
		  <s:hidden name="num"></s:hidden>
		<div class="layui-form-item">
		    <label class="layui-form-label">小组编号</label>
		    <div class="layui-input-inline">
		      <input type="text" name="username" value="<s:property value="%{group.groupId}"/>" lay-verify="required"  autocomplete="off" class="layui-input">
		    </div>
		</div>
		
		<div class="layui-form-item" style="">
		      <label class="layui-form-label">小组人数</label>
		      <div class="layui-input-inline">
		        最大<input   name="max" disabled="true" value=<s:property value="#session.currentCourse.groupMaxNum"/> class="layui-input">
		        最小<input   name="min" disabled="true" value="<s:property value="#session.currentCourse.groupMinNum"/>" class="layui-input">
		      </div>
		</div>

		<div class="layui-form-item" pane="">
		    <label class="layui-form-label">选择组员</label>
		    <div class="layui-input-block">
		    <s:iterator value="AllStudents">
		        <input type="checkbox" lay-skin="primary" name="checkName" value=<s:property value="studentId"/> ><s:property value="studentName"/>
		    </s:iterator>
		    </div>
		</div>
		<script type="text/javascript">  
            window.onload = function(){  
                var button1=document.getElementById("button1");  
                button1.onclick = function(){  
                    var checkboxs = document.getElementsByName("checkName");  
                    var num=0;
                    test.num.value = 0;
                    for(var i = 0; i < checkboxs.length; i ++)
                    {  
                        if(checkboxs[i].checked)
                        {  
                            num ++;  
                        }
                        
                    }
                    if (num > test.max.value-1 || num < test.min.value-1 ) 
                    {
                    	alert('抱歉，你当前选择的学生人数为' + num + '人，请选择小组人数范围内的组员！');
                    	// location.replace(location.href);
                    	return false;
                    }  
                    return true;   
                }  
                return true;
            }  
        </script> 
		<div class="layui-form-item">
	        <label class="layui-form-label">联系手机</label>
	        <div class="layui-input-inline">
	        <input type="tel" name="phone" lay-verify="required|phone" autocomplete="off" class="layui-input">
	        </div>
	    </div>
		
		<div class="layui-form-item" style="text-align:center;">
		    <button type="submit" class="layui-btn" id="button1">立即创建</button>
		</div>		
		</s:form> 
	</fieldset>

	<script src="layui.all.js" charset="utf-8"></script>
	<script>
	layui.use(['form'], function(){
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