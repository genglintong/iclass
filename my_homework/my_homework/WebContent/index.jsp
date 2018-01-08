<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "/struts-tags" prefix = "s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>登录</title>  
    <!-- <link rel="stylesheet" type="text/css" href="css/login.css"/>   -->
    <link rel="stylesheet" href="css/layui.css" media="all" />
</head>  

<body>  
  <div id="login" style="padding-right:2%;padding-left:2%; ">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
      <legend style="text-align: center;font-weight:bold;font-size:25px;">iClass课程管理平台登陆</legend>
    </fieldset>
     
    <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief" style="margin:0 auto;width:50%;margin-top:10%;">
      <ul class="layui-tab-title" style="text-align: center;">
        <li class="layui-this">教师登录</li>
        <li>学生登录</li>
      </ul>
      <div class="layui-tab-content" style="height: 100px;">

        <!-- 教师登录窗口 -->
        <div class="layui-tab-item layui-show" style="margin:0 auto;margin-top: 3%;">
          <form class="layui-form layui-form-pane" action="teacher_login" id="form_teacher" method="post">
            <div class="layui-form-item">
              <label class="layui-form-label">登录账号</label>
              <div class="layui-input-block" style="">
                <input type="text" name="account" id="t_acc" placeholder="请输入您的教师登录账号" class="layui-input">
              </div>
            </div>

            <div class="layui-form-item">
              <label class="layui-form-label">登录密码</label>
              <div class="layui-input-block" style="">
                <input type="password" name="password" id="t_pass" placeholder="请输入您的教师登录密码" class="layui-input">
              </div>
            </div>

            <div class="layui-form-item" style="margin:0 auto;text-align: center;" >
              <button class="layui-btn" type="submit" id="button1">教师登录</button>
            </div>
          </form>
        </div>
        <!-- 学生登录窗口 -->
        <div class="layui-tab-item" style="margin:0 auto;margin-top: 3%;">
          <s:form class="layui-form layui-form-pane" action="Student_stuLogin" method= "post" namespace="/" id="form_student">
            <div class="layui-form-item">
              <label class="layui-form-label">登录账号</label>
              <div class="layui-input-block" style="">
                <input type="text" id="s_acc" name = "account" placeholder="请输入您的学生登录账号" class="layui-input">
              </div>
            </div>

            <div class="layui-form-item">
              <label class="layui-form-label">登录密码</label>
              <div class="layui-input-block" style="">
                <input type="password" name = "password" id="s_pass" placeholder="请输入您的学生登录密码" class="layui-input">
              </div>
            </div>

            <div class="layui-form-item" style="margin:0 auto;text-align: center;" >
              <button class="layui-btn" type="submit" id="button2">学生登录</button>
            </div>
          </s:form>
        </div>

      </div>
    </div> 
  </div>

  <!-- 校验教师登录是否为空信息 -->
  <script type="text/javascript">  
    window.onload = function(){  
      var button1 = document.getElementById("button1");  
      button1.onclick = function(){
        var password = document.getElementById('t_pass').value;
        var account = document.getElementById('t_acc').value;

        if(account == ""){
          alert('教师登录账号不能为空'); 
          return false;
        }
        if(password == ""){
          alert('教师登录密码不能为空'); 
          return false;
        }
      }  
    }  
  </script>
  
  <!-- 校验学生登录是否为空信息 -->
  <script type="text/javascript">  
    window.onload = function(){  
      var button2 = document.getElementById("button2");  
      button2.onclick = function(){
        var password = document.getElementById('s_pass').value;
        var account = document.getElementById('s_acc').value;

        if(account == ""){
          alert('学生登录账号不能为空'); 
          return false;
        }
        if(password == ""){
          alert('学生登录密码不能为空'); 
          return false;
        }
      }  
    }  
  </script>

  <!-- 校验管理员登录是否为空信息 -->
  <script type="text/javascript">  
    window.onload = function(){  
      var button3 = document.getElementById("button3");  
      button3.onclick = function(){
        var password = document.getElementById('a_pass').value;
        var account = document.getElementById('a_acc').value;

        if(account == ""){
          alert('管理员登录账号不能为空'); 
          return false;
        }
        if(password == ""){
          alert('管理员登录密码不能为空'); 
          return false;
        }
      }  
    }  
  </script>

  <script type="text/javascript" src="js/layui.all.js"></script>
   <script>
  layui.use('element', function(){
      var $ = layui.jquery
      ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
      
      //触发事件
      var active = {
        tabAdd: function(){
          //新增一个Tab项
          element.tabAdd('demo', {
            title: '新选项'+ (Math.random()*1000|0) //用于演示
            ,content: '内容'+ (Math.random()*1000|0)
            ,id: new Date().getTime() //实际使用一般是规定好的id，这里以时间戳模拟下
          })
        }
        ,tabDelete: function(othis){
          //删除指定Tab项
          element.tabDelete('demo', '44'); //删除：“商品管理”
          
          
          othis.addClass('layui-btn-disabled');
        }
        ,tabChange: function(){
          //切换到指定Tab项
          element.tabChange('demo', '22'); //切换到：用户管理
        }
      };
      
      $('.site-demo-active').on('click', function(){
        var othis = $(this), type = othis.data('type');
        active[type] ? active[type].call(this, othis) : '';
      });
      
      //Hash地址的定位
      var layid = location.hash.replace(/^#test=/, '');
      element.tabChange('test', layid);
      
      element.on('tab(test)', function(elem){
        location.hash = 'test='+ $(this).attr('lay-id');
      });
  });
  </script>
</body>  

</html>