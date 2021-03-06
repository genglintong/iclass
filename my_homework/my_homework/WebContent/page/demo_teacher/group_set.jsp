<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "/struts-tags" prefix = "s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>小组配置</title>
		<link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="css/global.css" media="all">
		<link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="css/layui.css">
	</head>

	<body>
	<div class="admin-main" style="">	
	<blockquote class="layui-elem-quote">
		<p>老师您好，您可以在这儿设置小组配置</p>
	</blockquote>
	<fieldset class="layui-elem-field" style="margin-top:1%;">
		<legend style="text-align: center;">学生小组配置</legend>

      	<s:form class="layui-form layui-form-pane" namespace="/" action="Teacher_groupConfig" style="padding: 2%" method="post">
		<div class="layui-form-item">  
			<div class="layui-inline">
			    <label class="layui-form-label">人数设置</label>
			    <div class="layui-input-inline"  style="width:100px;">
		          <input class="layui-input-inline" name="min" type="text">
		          </div>
		          <div class="layui-form-mid">-</div>
		          <div class="layui-input-inline" style="width:100px">
		          <input calss="layui-input-inline" name="max">人
		        </div>
	       	</div>
		</div>
		

		<div class="layui-form-item" style="">
		    <div class="layui-inline">
		      <label class="layui-form-label">编号前缀</label>

		      <div class="layui-input-inline">
		        <input type="text" class="layui-input" id="test2" placeholder="2018"  disabled="1" name="year">
		      </div>

		      <div class="layui-form-mid">+</div>

		      <div class="layui-input-inline" style="width: 200px;">
		        <input type="text" name="class_code" placeholder="班级编号" autocomplete="off" class="layui-input" value="">
		      </div>
			</div>
		</div>

		<div class="layui-form-item">
		    <div class="layui-input-block">
		      <button class="layui-btn" lay-submit="" lay-filter="demo1">保存设置</button>
		      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
		</div>
		</s:form> 
	</fieldset>

	<script src="${pageContext.request.contextPath}/page/demo_teacher/layui.all.js" charset="utf-8"></script>
	<%-- <script>
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
 --%>
	<script>
	layui.use('laydate', function(){
	  var laydate = layui.laydate;
	  
	//常规用法
	  laydate.render({
	    elem: '#test1'
	  });
	  
	  //国际版
	  laydate.render({
	    elem: '#test1-1'
	    ,lang: 'en'
	  });
	  
	  //年选择器
	  laydate.render({
	    elem: '#test2'
	    ,type: 'year'
	  });
	  
	  //年月选择器
	  laydate.render({
	    elem: '#test3'
	    ,type: 'month'
	  });
	  
	  //时间选择器
	  laydate.render({
	    elem: '#test4'
	    ,type: 'time'
	  });
	  
	  //时间选择器
	  laydate.render({
	    elem: '#test5'
	    ,type: 'datetime'
	  });
	  
	  //日期范围
	  laydate.render({
	    elem: '#test6'
	    ,range: true
	  });
	  
	  //年范围
	  laydate.render({
	    elem: '#test7'
	    ,type: 'year'
	    ,range: true
	  });
	  
	  //年月范围
	  laydate.render({
	    elem: '#test8'
	    ,type: 'month'
	    ,range: true
	  });
	  
	  //时间范围
	  laydate.render({
	    elem: '#test9'
	    ,type: 'time'
	    ,range: true
	  });
	  
	  //日期时间范围
	  laydate.render({
	    elem: '#test10'
	    ,type: 'datetime'
	    ,range: true
	  });
	  
	  //自定义格式
	  laydate.render({
	    elem: '#test11'
	    ,format: 'yyyy年MM月dd日'
	  });
	  laydate.render({
	    elem: '#test12'
	    ,format: 'dd/MM/yyyy'
	  });
	  laydate.render({
	    elem: '#test13'
	    ,format: 'yyyyMMdd'
	  });
	  laydate.render({
	    elem: '#test14'
	    ,type: 'time'
	    ,format: 'H点m分'
	  });
	  laydate.render({
	    elem: '#test15'
	    ,type: 'month'
	    ,range: '~'
	    ,format: 'yyyy-MM'
	  });
	  laydate.render({
	    elem: '#test16'
	    ,type: 'datetime'
	    ,range: '到'
	    ,format: 'yyyy年M月d日H时m分s秒'
	  });
	  
	  //开启公历节日
	  laydate.render({
	    elem: '#test17'
	    ,calendar: true
	  });
	  
	  //自定义重要日
	  laydate.render({
	    elem: '#test18'
	    ,mark: {
	      '0-10-14': '生日'
	      ,'0-12-31': '跨年' //每年的日期
	      ,'0-0-10': '工资' //每月某天
	      ,'0-0-15': '月中'
	      ,'2017-8-15': '' //如果为空字符，则默认显示数字+徽章
	      ,'2099-10-14': '呵呵'
	    }
	    ,done: function(value, date){
	      if(date.year === 2017 && date.month === 8 && date.date === 15){ //点击2017年8月15日，弹出提示语
	        layer.msg('这一天是：中国人民抗日战争胜利72周年');
	      }
	    }
	  });
	  
	  //限定可选日期
	  var ins22 = laydate.render({
	    elem: '#test-limit1'
	    ,min: '2016-10-14'
	    ,max: '2080-10-14'
	    ,ready: function(){
	      ins22.hint('日期可选值设定在 <br> 2016-10-14 到 2080-10-14');
	    }
	  });
	  
	  //前后若干天可选，这里以7天为例
	  laydate.render({
	    elem: '#test-limit2'
	    ,min: -7
	    ,max: 7
	  });
	  
	  //限定可选时间
	  laydate.render({
	    elem: '#test-limit3'
	    ,type: 'time'
	    ,min: '09:30:00'
	    ,max: '17:30:00'
	    ,btns: ['clear', 'confirm']
	  });
	  
	  //同时绑定多个
	  lay('.test-item').each(function(){
	    laydate.render({
	      elem: this
	      ,trigger: 'click'
	    });
	  });
	  
	  //初始赋值
	  laydate.render({
	    elem: '#test19'
	    ,value: '1989-10-14'
	  });
	  
	  //选中后的回调
	  laydate.render({
	    elem: '#test20'
	    ,done: function(value, date){
	      layer.alert('你选择的日期是：' + value + '<br>获得的对象是' + JSON.stringify(date));
	    }
	  });
	  
	  //日期切换的回调
	  laydate.render({
	    elem: '#test21'
	    ,change: function(value, date){
	      layer.msg('你选择的日期是：' + value + '<br><br>获得的对象是' + JSON.stringify(date));
	    }
	  });
	  //不出现底部栏
	  laydate.render({
	    elem: '#test22'
	    ,showBottom: false
	  });
	  
	  //只出现确定按钮
	  laydate.render({
	    elem: '#test23'
	    ,btns: ['confirm']
	  });
	  
	  //自定义事件
	  laydate.render({
	    elem: '#test24'
	    ,trigger: 'mousedown'
	  });
	  
	  //点我触发
	  laydate.render({
	    elem: '#test25'
	    ,eventElem: '#test25-1'
	    ,trigger: 'click'
	  });
	  
	  //双击我触发
	  lay('#test26-1').on('dblclick', function(){
	    laydate.render({
	      elem: '#test26'
	      ,show: true
	      ,closeStop: '#test26-1'
	    });
	  });
	  
	  //日期只读
	  laydate.render({
	    elem: '#test27'
	    ,trigger: 'click'
	  });
	  
	  //非input元素
	  laydate.render({
	    elem: '#test28'
	  });
	  
	  //墨绿主题
	  laydate.render({
	    elem: '#test29'
	    ,theme: 'molv'
	  });
	  
	  //自定义颜色
	  laydate.render({
	    elem: '#test30'
	    ,theme: '#393D49'
	  });
	  
	  //格子主题
	  laydate.render({
	    elem: '#test31'
	    ,theme: 'grid'
	  });
	  
	  
	  //直接嵌套显示
	  laydate.render({
	    elem: '#test-n1'
	    ,position: 'static'
	  });
	  laydate.render({
	    elem: '#test-n2'
	    ,position: 'static'
	    ,lang: 'en'
	  });
	  laydate.render({
	    elem: '#test-n3'
	    ,type: 'month'
	    ,position: 'static'
	  });
	  laydate.render({
	    elem: '#test-n4'
	    ,type: 'time'
	    ,position: 'static'
	  });
	});
	</script>

</body>

</html>