<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">  
<head>  
    <meta charset="UTF-8">  
    <title>登录</title>  
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/page/css/login.css"/>  
</head>  

<body>  
    <div id="login">  
         <h1>i-class课程管理平台</h1>  
	<form action="${pageContext.request.contextPath}/teacher_login" method="post">
        <input type="text" required="required" placeholder="请输入账号" name="account" id="account"></input>  
        <input type="password" required="required" placeholder="请输入密码" name="password" id="password"></input>  
    		
        <select id="select" name="select">
    		    <option value="1">教师</option>
    		    <option value="2">学生</option>
    		    <option value="3">管理员</option>
    		</select>
        
        <button class="but" type="submit" style="height: 40px;">提交</button>
	</form>
    </div>

  <script>
      function doSubmit(){
      var password = document.getElementById('password').value;
      var account = document.getElementById('account').value;
      var select = document.getElementById('select').value;

      if(account == ""){
        alert('账号不能为空'); 
        return false;
      }
      if(password == ""){
        alert('密码不能为空'); 
        return false;
      }

      alert('select的值是：' + select);

      var url;

      switch (select){
        case '1':
          url = 'demo_teacher/index.html';      break;
        case '2':
          url = 'demo_student/index.html';      break;
        case '3':
          url = 'demo_admin/index.html';      break;
        default:      break;
      }

      window.location= url;
    }
    </script>

</body>  

</html>