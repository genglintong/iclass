<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "/struts-tags" prefix = "s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
		<title>作业信息</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="css/global.css" media="all">
		<link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="css/layui.css" media="all" />
  <script language="javascript">
  // 在DOM中插入一个上传文件列表项（div元素)和一个<input type="file"/>元素
  function insertNextFile(obj) 
  { 
// 获取上传控制个数
      var childnum = document.getElementById("files").getElementsByTagName("input").length;       
      var id = childnum - 1;
      var fullName = obj.value;
      // 插入<div>元素及其子元素
      var fileHtml = '';
      fileHtml += '<a href="javascript:;" onclick="removeFile(' + id + ');">删除</a> &nbsp;&nbsp;';
      fileHtml += fullName.substr(fullName.lastIndexOf('\\')+1) +'  </div>';
  
      var fileElement = document.getElementById("files_preview");
      fileElement.innerHTML = fileElement.innerHTML + fileHtml;    
      obj.style.display = 'none';   // 隐藏当前的<input type=”file”/>元素
      addUploadFile(childnum);  // 插入新的<input type=”file”/>元素
  }
  //  插入新的<input type=”file”/>元素，适合于不同的浏览器（包括IE、FireFox等）
  function addUploadFile(index)
  {
      try  // 用于IE浏览器
      {   
          var uploadHTML = document.createElement( "<input type='file' id='file_" + index + 
                                  "' name='file[" + index + "]' onchange='insertNextFile(this)'/>");
          document.getElementById("files").appendChild(uploadHTML);
      }
      catch(e)  // 用于其他浏览器
      { 
          var uploadObj = document.createElement("input");
          uploadObj.setAttribute("name", "file1");
          uploadObj.setAttribute("onchange", "insertNextFile(this)");
          uploadObj.setAttribute("type", "file");
          uploadObj.setAttribute("id", "file_" + index);
          document.getElementById("files").appendChild(uploadObj);
      }
  }
  function removeFile(index)  // 删除当前文件的<div>和<input type=”file”/>元素
  {
      document.getElementById("files_preview").removeChild(document.getElementById("file_preview" + index)); 
      document.getElementById("files").removeChild(document.getElementById("file_" + index));    
  }
  function showStatus(obj)  // 显示“正在上传文件”提示信息
  {
    document.getElementById("status").style.visibility="visible";
  }
  </script>
	</head>

	<body>
<s:debug>dd</s:debug>
	<div class="admin-main">
		<blockquote class="layui-elem-quote">
		<p>你好同学，你可以在这里查看具体作业信息，并且提交</p>
		</blockquote>	
		<s:form  enctype="multipart/form-data" action="Student_submitHomework" method="post" namespace="/">
		<s:hidden name="subjectId" value="%{subjectId}" /> 
              <span id="files">   <%--  在此处插入用于上传文件的input元素 --%>
                  <input  type="file" id="file_0" name="file1" onchange="insertNextFile(this)" />
               </span>&nbsp;&nbsp;
               <input type = "submit" value="上传"/>
          </s:form>  <p>
          <div id ="status" style="visibility:hidden;color:Red">正在上传文件</div> <p>
          <%--  在此处用DOM技术插入上传文件列表项  --%>
          <div id="files_preview" style ="width:500px;height:500px; overflow :auto" ></div>  
	</div>

	<div class="admin-main">
		<fieldset class="layui-elem-field" style="padding:1%;">	
			<legend style="text-align:center;">具体作业信息</legend>
			<form class="layui-form layui-form-pane" action="" method="get">
				<div style="height:100%;">
					
					<div class="layui-form-item">
					    <label class="layui-form-label">作业名称</label>
					    <div class="layui-input-block">
					    <input type="text" name="subjectName" value=<s:property value ="subjectTitle" />  lay-verify="required" autocomplete="off" class="layui-input" disabled="1">
					    </div>
					</div>

					<div class="layui-form-item layui-form-text">
					    <label class="layui-form-label">作业要求</label>
					    <div class="layui-input-block">
					      <textarea value=<s:property value ="subjectDesc" /> class="layui-textarea" disabled="1"></textarea>
					    </div>
					</div>

					<div class="layui-form-item">
					    <label class="layui-form-label">发布时间</label>
					    <div class="layui-input-inline">
					    <input type="text" name="job_set_time" value=<s:property value="createDate" /> lay-verify="date"  autocomplete="off" class="layui-input" disabled="1">
					    </div>
					</div>

					<div class="layui-form-item">
					    <label class="layui-form-label">提交时间</label>
					    <div class="layui-input-inline">
					    <input type="text" name="job_submit_time" lay-verify="verify" autocomplete="off" class="layui-input" disabled="1" value=<s:property value="deadLine"/> >
					    </div>
					</div>

					<div class="layui-form-item" style="float:left;">
					    <label class="layui-form-label">作业权重</label>
					    <div class="layui-input-inline">
					    	<input type="text" name="job_rate" lay-verify="required" placeholder="本次作业分数比例" autocomplete="off" class="layui-input" disabled="1">
					    </div>
					    </div>
					</div>
				</div>

			</form>
		</fieldset>
	</div>

	<script type="text/javascript" src="layui.all.js"></script>

	</body>

</html>