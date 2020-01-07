<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link href="<%=path%>/css/login.css" rel="stylesheet" type="text/css">
<script type='text/javascript'
	src='<%=path%>/dwr/interface/loginService.js'></script>
<script type='text/javascript' src='<%=path%>/dwr/engine.js'></script>
<script type='text/javascript' src='<%=path%>/dwr/util.js'></script>
<%-- <link href="<%=path%>/css/input.css" rel="stylesheet" type="text/css" /> --%>
<script language="javascript">
			window.onload=function(){//背景图片轮播
				var imgs =["bg05.jpg","3.jpg","1.jpg","bg04.png"]; //（设定想要显示的图片）
				var i = 0;
				var body=document.getElementById("login");
				body.style.background="url(img/"+imgs[0]+")";
				body.style.backgroundSize="100%";
				function time(){
				          i++;   
				          i=i%4; // 超过4则取余数，保证循环在0、1、2,3之间
				          body.style.background="url(img/"+imgs[i]+")";
				          body.style.backgroundSize="100%";
				   }
				  setInterval(time,2000);//循环调用time1()函数，时间间隔为2000ms
				}
			function check1(){                                                                                         
			     if(document.ThisForm.userName.value=="")
				 {
				 	//alert("请输入用户名");
				 	document.getElementById("uname").innerHTML="请输入您的账号";
					document.ThisForm.userName.focus();
					return false;
				 }
				 if(document.ThisForm.userPw.value=="")
				 {
				 	//alert("请输入密码");
				 	document.getElementById("psd").innerHTML="请输入密码";
					document.ThisForm.userPw.focus();
					return false;
				 }
				 if(document.ThisForm.userType.value=="-1")
				 {
				 	//alert("请选择登陆身份");
				 	document.getElementById("status").innerHTML="请选择您的登陆身份";
					document.ThisForm.userType.focus();
					return false;
				 }
				 document.getElementById("indicator").style.display="block";
				 loginService.login(document.ThisForm.userName.value,document.ThisForm.userPw.value,document.ThisForm.userType.value,callback);
			}
			
		function callback(data){
			   document.getElementById("indicator").style.display="none";
			   if(data=="no"){
			       alert("用户名或密码错误");
			   }
			   if(data=="yes"){
			       alert("通过验证,系统登录成功");
			       window.location.href="<%=path%>/loginSuccess.jsp";
			   }
			}
		function reg(){
			var strUrl = "<%=path%>/userReg.jsp";
			var ret = window.showModalDialog(strUrl,"","dialogWidth:800px; dialogHeight:500px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
		}
</script>
<title>系统后台登录窗口</title>
</head>

<body id="login">
	<div id="login_div">
		<form action="" method="post" id="ThisForm" name="ThisForm">
			<div id="box">
				<p>
					<label for="username">账&nbsp;&nbsp;号：</label> 
					<input class="login_input" type="text" id="username" name="userName" placeholder="请输入您的账号" /><span id="uname">*</span>
				</p>
				<p>
					<label for="pwd">密&nbsp;&nbsp;码：</label> 
					<input class="login_input" type="password" id="pwd" name="userPw" placeholder="请输入密码" /><span id="psd">*</span>
				</p>
				<p>
					<label for="type">类&nbsp;&nbsp;型：</label> 
					<select name="userType" id="type">
						<option value="-1">请选择登录类型</option>
						<option value="0">管理员</option>
						<option value="1">操作员</option>
					</select><span id="status">*</span>
				</p>
				<p>
					<input class="login_btn" type="button" value="" onclick="check1()" />&nbsp;&nbsp;
					<input type="reset" value="重置" class="reset_btn" /> 
<!-- 					<input type="checkbox" value="记住密码">记住密码 -->&nbsp;&nbsp;
					<a href="<%=path%>/admin/yuangong/yuangongReg.jsp">员工注册</a>
					<img id="indicator" src="img/loading.gif" style="display: none" />
				</p>
			</div>
		</form>
	</div>
</body>
</html>
