<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %> 

<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
        
		
		<script type="text/javascript" src='<%=path%>/js/jquery-1.8.3.js'></script>
        <script language="javascript">
    		var tel1=/^1[3-9][0-9]{9}$/;
    		var age1=/[1-6][0-9]$/;
        	function check(){
        		var name=document.getElementById("name");
        		var age=document.getElementById("age");
	        	var tel2=document.getElementById("tel");
        		var addr=document.getElementById("address");
        		if(name.value==""){
        			document.getElementById("namespan").innerHTML="姓名不能为空";
        			return false;
        		}
        		if(age.value==""){
        			document.getElementById("agespan").innerHTML="年龄不能为空";
        			return false;
        		}
        		if(tel2.value==""){
        			document.getElementById("telspan").innerHTML="联系电话不能为空";
        			return false;
        		}
        		if(addr.value==""){
        			document.getElementById("addrspan").innerHTML="住址不能为空";
        			return false;
        		}
        		return true;
        	}
        	
        	function checkTel(){
	        	var tel2=document.getElementById("tel");
        		if(!tel1.test(tel2.value)){
        			document.getElementById("telspan").innerHTML="联系电话不合法";
        			document.getElementById("agespan").style.color="red";
        		}else{
        			var t=document.getElementById("telspan");
        			t.innerHTML="合法";
        			t.style.color='green';
        		}
        	}
        	function checkAge(age){
        		if(!age1.test(age)){
        			document.getElementById("agespan").innerHTML="年龄不合法，年龄必须在10-70之间";
        			document.getElementById("agespan").style.color="red";
        		}else{
        			var t=document.getElementById("agespan");
        			t.innerHTML="合法";
        			t.style.color='green';
        		}
        	}
	        function returnLogin(){
	   	   		window.location.href="<%=path%>/login.jsp";
	      	}
	        function myshenhe(){
	        	var name=document.getElementById("name");
	        	if(name.value==""){
        			document.getElementById("namespan").innerHTML="请先输入你的姓名";
        			return false;
        		}
	        	window.location.href="<%=path%>/yuangong?type=myshenhe&name="+name.value;
	        }
        </script>
        <style>
			#myInfo{
				width: 400px;
				height:500px;
				margin: 0 auto;
				margin-top: 50px;
				border: 1px solid #A2D7B2;
				border-radius: 10px;
				background: linear-gradient(to right,#A2D7B2,#FFFFFF);
				box-shadow: 2px 5px 2px 5px;
			}
			p{
				margin-top:30px;
				padding-left:50px;
			}
			h2,label{
				text-align:center;
				font-family: "楷体" ;
			}
			input[type="text"]{
				border-width: 0px;
				border-radius: 5px;
				height: 18px;
				background: linear-gradient(to bottom,#A2D7B2,#FFFFFF);
			}
			input[type="submit"],input[type="button"]{
				font:bold 16px "楷体";
				background: linear-gradient(to right,#A2D7B2,yellow);
				width: 60px;
				height: 25px;
				border-radius: 10px;
			}
		</style>
		<title>员工注册页面</title>
	</head>

	<body style="background:url('<%=path %>/img/bg05.jpg');background-size:100%;">
			<div id="myInfo">
			<h2>员工注册</h2><hr />
			<form action="<%=path %>/yuangong?type=yuangongAdd" method="post">
				<p><label for="name">姓名：</label><input type="text" id="name" class="input" name="name"  /><span id="namespan" style="color:red;">*</span></p>
				<p><label for="sex">性别：</label>
					<input type="radio" id="sex" class="input" value="男" name="sex" checked="checked" />男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" id="sex" class="input" value="女" name="sex" />女&nbsp;&nbsp;
				</p>
				<p><label for="age">年龄：</label><input type="text" id="age" class="input" name="age" onblur="checkAge(this.value)" /><span id="agespan" style="color:red;">*</span></p>
				<p><label for="tel">电话：</label><input type="text" id="tel" class="input" name="tel" onblur="checkTel()" /><span id="telspan" style="color:red;">*</span></p>
				<p><label for="addr">住址：</label><input type="text" id="address" class="input" name="address" /><span id="addrspan" style="color:red;">*</span></p>
				<p><label for="zhiwei">职位：</label><input type="text" name="zhiwei" value="员工" id="zhiwei" class="input" readonly style="text-align: center;"  /></p>
				<p>
					<input type="hidden" value="0" name="quanxian"  />
					<input type="hidden" value="yes" name="del"  />
					<input type="hidden" value="reg" name="caozuo"  />
					<input type="submit" id="sub" value="提 交" onclick="return check();"  />
					<input type="button" id="back" value="返回" onclick="returnLogin()"  />
					<input type="button" id="back" value="查看我的审核" onclick="myshenhe()" style="width:120px;" />
					
				</p>
			</form>
		</div>
   </body>
</html>
