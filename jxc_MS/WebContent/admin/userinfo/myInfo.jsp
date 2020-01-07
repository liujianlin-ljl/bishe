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
	        window.onload=function(){
	    		if((<%=session.getAttribute("userType")%>)==null){//没有登录
	    			window.location="<%=path%>/login.jsp";
	    		}
	    		
	    	}
        	function check(){
        		var name=document.getElementById("name");
        		var sex=document.getElementById("sex");
        		var age=document.getElementById("age");
        		var tel=document.getElementById("tel");
        		var addr=document.getElementById("addr");
        		
        		if(name.value=="${sessionScope.yuangong.name}" 
        				&& sex.value=="${sessionScope.yuangong.sex}" 
        				&& age.value=="${sessionScope.yuangong.age}"
        				&& tel.value=="${sessionScope.yuangong.tel}"
        				&& addr.value=="${sessionScope.yuangong.address}"){
        			alert("您的信息未发生变化");
        			return false;
        		}
        		return true;
        	}
          //返回 
	        function back(){
	     	   var url="<%=path%>/admin/index/sysPro.jsp";
	   	   		window.location.href=url;
	      	}
        </script>
        <style>
			#myInfo{
				width: 400px;
				margin: 0 auto;
				margin-top: 50px;
				text-align: center;
				border: 1px solid #A2D7B2;
				border-radius: 10px;
				background: linear-gradient(to right,#A2D7B2,#FFFFFF);
				box-shadow: 2px 5px 2px 5px;
			}
			h2,label{
				font-family: "楷体" ;
			}
			input[type="text"]{
				border-width: 0px;
				border-radius: 5px;
				height: 18px;
				background: linear-gradient(to bottom,#A2D7B2,#FFFFFF);
			}
			input[type="submit"]{
				font:bold 16px "楷体";
				background: linear-gradient(to right,#A2D7B2,yellow);
				width: 200px;
				height: 25px;
				border-radius: 10px;
			}
		</style>
		<title>我的个人信息</title>
	</head>

	<body  style="background:url('<%=path %>/img/5cbf1f2b7e13b.jpg');background-size:100%;">
			<div id="myInfo">
			<h2>我的个人信息</h2><hr />
			<form action="<%=path %>/yuangong?type=editInfo" method="post">
				<p><label for="loginName">账号：</label><input type="text" value="${sessionScope.yuangong.loginName }" id="loginName" class="input" name="loginName" disabled style="text-align: center;" /></p>
				<p><label for="name">姓名：</label><input type="text" value="${sessionScope.yuangong.name }" id="name" class="input" name="name"  /></p>
				<p><label for="sex">性别：</label><input type="text" value="${sessionScope.yuangong.sex }" id="sex" class="input" name="sex" /></p>
				<p><label for="age">年龄：</label><input type="text" value="${sessionScope.yuangong.age }" id="age" class="input" name="age" /></p>
				<p><label for="tel">电话：</label><input type="text" value="${sessionScope.yuangong.tel }" id="tel" class="input" name="tel" /></p>
				<p><label for="addr">住址：</label><input type="text" value="${sessionScope.yuangong.address }" id="addr" class="input" name="addr" /></p>
				<p><label for="zhiwei">职位：</label><input type="text" value="${sessionScope.yuangong.zhiwei }" id="zhiwei" class="input" name="zhiwei" disabled style="text-align: center;" /></p>
				<p><label>身份：</label><input type="text" value="操作员" disabled style="text-align: center;" /></p>
				<p>
					<input type="submit" id="sub" value="修改我的信息" onclick="return check();"  />
				</p>
			</form>
		</div>
   </body>
</html>
