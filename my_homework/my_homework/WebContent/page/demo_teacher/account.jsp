<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "/struts-tags" prefix = "s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>账号信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/demo_teacher/plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/demo_teacher/css/global.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/demo_teacher/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/layui.css">
  </head>

  <body>
  <div class="admin-main" style=""> 
  <blockquote class="layui-elem-quote">
    <p>您好，您可以在这里查看&&修改你的个人信息</p>
  </blockquote>
  <fieldset class="layui-elem-field" style="margin-top:1%;">
    <legend style="text-align: center;">个人信息</legend>
    <form class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/teacher_updateUserInfo" style="padding: 1%" method="post">
      
    <div class="layui-form-item" style="">
        <label class="layui-form-label">登录账号</label>
        <div class="layui-input-block">
          <input type="text" name="account" value=<s:property value="#session.teacher.account"/> autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" style="">
          <label class="layui-form-label">个人姓名</label>
          <div class="layui-input-block">
            <input type="text" name="teacherName" value=<s:property value="#session.teacher.teacherName"/> placeholder="个人姓名" autocomplete="off" class="layui-input">
          </div>
    </div>
    
<!--     <div class="layui-form-item" style="">
          <label class="layui-form-label">教师工号</label>
          <div class="layui-input-block">
            <input type="text" name="gonghao" placeholder="教师工号" autocomplete="off" class="layui-input">
          </div>
    </div> -->

    <div class="layui-form-item" style="">
          <label class="layui-form-label">登录密码</label>
          <div class="layui-input-block">
            <input type="password" name="password" placeholder="密码必须6到12位" autocomplete="off" class="layui-input">
          </div>
    </div>

    <!-- <div class="layui-form-item">
        <label class="layui-form-label">提交日期</label>
      <div class="layui-input-inline">
            <input type="text" name="date" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
          </div>
    </div> -->
    
    <!-- <div class="layui-form-item" style="width:300px;">
        <label class="layui-form-label">当前课程</label>
        <div class="layui-input-block">
          <select name="interest" lay-filter="">
            <option value="" selected="">学科</option>
            <option value="1">计算机组成原理</option>
            <option value="2">程序设计</option>
          </select>
        </div> 
    </div>-->

    <!-- <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">作业描述</label>
        <div class="layui-input-block">
        <textarea placeholder="请描述作业的详细内容" class="layui-textarea"></textarea>
        </div>
    </div> -->

    <div class="layui-form-item" style="text-align:center;">
        <button class="layui-btn" type="submit">保存修改</button>
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