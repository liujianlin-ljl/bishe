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
        
        <link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		
		<script type="text/javascript" src='<%=path%>/js/jquery-1.8.3.js'></script>
        <script language="javascript">
	        window.onload=function(){
	    		if((<%=session.getAttribute("userType")%>)==null){//没有登录
	    			window.location="<%=path%>/login.jsp";
	    		}
	    		
	    	}
        	function check(){
        		var realPw="${sessionScope.yuangong.loginPw}";
        		var userPw=document.getElementById("userPw");//原密码
        		var newPw=document.getElementById("userPw1");//新密码
        		var span1=document.getElementById("span1");
        		var span2=document.getElementById("span2");
        		if(userPw.value==""){
        			span1.innerHTML="原密码不能为空";
        			return false;
        		}
        		if(newPw.value==""){
        			span2.innerHTML="新密码不能为空";
        			return false;
        		}
        		if(newPw.value==realPw){
        			alert("新密码不能与原密码一致");
        			return false;
        		}
        		if(userPw.value != realPw ){
        			span1.innerHTML="原密码不正确";
        			return false;
        		}
        		$.ajax({
                    type: "post",//使用post方法访问后台
                    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                    url: "<%=path%>/yuangong",
                    data: {
                        'type': "editPw",
                        'newPw':newPw.value
                    },
                    dataType:"json",
                    success: function (data) {
                        //data = decodeURI(data);//防止中文乱码
                        if(data.msg=='y'){
	                        alert("密码修改成功，下次登录请使用新密码");
	                        back();
                        }else{
                        	alert("修改失败");
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("修改失败");
                    }
                });
        	}
          //返回 
	        function back(){
	     	   var url="<%=path%>/admin/index/sysPro.jsp";
	   	   		window.location.href=url;
	      	}
        </script>
        <link href="<%=path %>/css/input.css" rel="stylesheet" type="text/css" />
	</head>

	<body  style="background:url('<%=path %>/img/5cbf1f2b7e13b.jpg');background-size:100%;">
			<form method="post" action="<%=path %>/userPwEdit.action" name="formPw">
			<table width="40%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-top:100px;height:220px;">
				<tr bgcolor="#EEF4EA" align="center">
				    <td colspan="2" height="25" background="<%=path %>/img/wbg.gif" class='title'><span style="font-family: '楷体'">密码修改</span></td>
				</tr>
				<tr bgcolor="#FFFFFF">
				    <td width="25%" bgcolor="#FFFFFF" align="right">
				         登录名：
				    </td>
				    <td width="75%" bgcolor="#FFFFFF">
				        <input type="text" value="${sessionScope.yuangong.loginName }" name="userName" size="20" disabled="disabled"/>
				    </td>
				</tr>
				<tr bgcolor="#FFFFFF">
				    <td width="25%" bgcolor="#FFFFFF" align="right">
				        原密码：
				    </td>
				    <td width="75%" bgcolor="#FFFFFF">
				        <input type="password" value="${sessionScope.yuangong.loginPw }" name="userPw" id="userPw" size="22"/>
				        <span id="span1" style="color:red;">*</span>
				    </td>
				</tr>
				<tr bgcolor="#FFFFFF">
				    <td width="25%" bgcolor="#FFFFFF" align="right">
				         新密码：
				    </td>
				    <td width="75%" bgcolor="#FFFFFF">
				        <input type="password" id="userPw1" name="userPw1" size="22"/>
				        <span id="span2" style="color:red;">*</span>
				    </td>
				</tr>
				<tr bgcolor="#FFFFFF">
				    <td width="25%" bgcolor="#FFFFFF" align="right">
				        &nbsp;
				    </td>
			        <td width="75%" bgcolor="#FFFFFF">
			             <input type="button" class="btn" value="确定修改" onclick="return check()"/>
			             &nbsp;&nbsp;
			             <input type="reset" class="btn" value="重置"/>&nbsp;&nbsp;
			             <input type="button" class="btn" value="返回" onclick="back()" />
			             <img id="indicator" src="<%=path %>/img/loading.gif" alt="Loading..." style="display:none"/>
			        </td>
				</tr>
			</table>
			</form>
   </body>
</html>
