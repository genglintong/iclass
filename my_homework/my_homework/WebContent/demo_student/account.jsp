<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "/struts-tags" prefix = "s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>账号信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/demo_student/plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/demo_student/css/global.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/demo_student/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/layui.css">
  </head>

  <body>
  <div class="admin-main" style=""> 
  <blockquote class="layui-elem-quo te">
  <s:if test="#session.existStudent.isFirstLogin!=1">
    <p>您好，您可以在这里查看&&修改你的个人信息</p>
  </s:if>
  <s:if test="#session.existStudent.isFirstLogin==1">
    <p>第一次登录，请修改密码！！否则无法使用其他功能</p>
  </s:if>
  </blockquote>
  <fieldset class="layui-elem-field" style="margin-top:1%;">
    <legend style="text-align: center;">个人信息</legend>
        <form class="layui-form layui-form-pane" action="Student_ChangePassword" style="padding: 1%" method="post">
      
    <div class="layui-form-item" style="">
        <label class="layui-form-label">个人学号</label>
        <div class="layui-input-block">
          <input type="text"  autocomplete="off" class="layui-input" value=<s:property value="account"/> />
        </div>
    </div>
    
    <div class="layui-form-item" style="">
          <label class="layui-form-label">个人姓名</label>
          <div class="layui-input-block">
            <input type="text" autocomplete="off" class="layui-input" value=<s:property value="studentName"/> >
          </div>
    </div>
    
    <div class="layui-form-item" style="">
          <label class="layui-form-label">班级编号</label>
          <div class="layui-input-block">
            <input type="text" name="banhao" placeholder="班级编号" autocomplete="off" class="layui-input">
          </div>
    </div>

    <div class="layui-form-item" style="">
          <label class="layui-form-label">修改登录密码</label>
          <div class="layui-input-block">
            <input type="password" name="newPassword" placeholder="密码必须6到12位" autocomplete="off" class="layui-input">
          </div>
    </div>

    <div class="layui-form-item" style="text-align:center;">
        <button class="layui-btn" lay-submit="" lay-filter="demo1">保存修改</button>
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