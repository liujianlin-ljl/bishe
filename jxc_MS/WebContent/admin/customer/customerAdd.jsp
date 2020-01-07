<%@ page language="java" import="java.util.*,com.util.GetID" pageEncoding="UTF-8"%>
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
         <link rel="stylesheet" type="text/css" href="<%=path%>/css/input.css"/>
        <script type="text/javascript" src="<%=path %>/jquery-1.8.3.js"></script>
        <script language="javascript">
	       	var tel=/^1[3-9][0-9]{9}$/;
	       	var size=/^[0-9]{0,4}$/;
       		
        	function checkForm(){
	        	var c_name=document.getElementById("c_name");
	        	var c_tel=document.getElementById("c_tel");
	       		var c_type=document.getElementById("c_type");
	        		
        		
        		if(c_name.value==""){
        			document.getElementById("name").innerHTML="名称不能为空";
        			return false;
        		}
        		if(c_tel.value==""){
        			document.getElementById("tel").innerHTML="联系电话不能为空";
        			return false;
        		}
        		if(c_type.value==""){
        			document.getElementById("type").innerHTML="类型不能为空";
        			return false;
        		}
        		if(!tel.test(c_tel.value)){
        			document.getElementById("tel").innerHTML="联系电话不合法";
        			return false;
        		}else{
        			var t=document.getElementById("tel");
        			t.innerHTML="合法";
        			t.style.color='green';
        			return true;
        		}
        		return true;	
        	}
        
	      //返回 
	        function back(){
	     	   var url="<%=path%>/customer?type=customerMana";
	   	   		window.location.href=url;
	      	}
        </script>
        <style type="text/css">
       	table{border-radius: 10px;margin-top:50px;box-shadow:5px 5px 5px 5px;}
        span{color:red;font-size:15px;}
        </style>
	</head>

	<body style="background:url('<%=path %>/img/5cbf1f2b7e13b.jpg');background-size:100%;">
			<form action="<%=path %>/customer?type=customerAdd" name="formAdd" method="post">
				     <table width="50%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#EEF4EA">
					        <td colspan="3" background="<%=path %>/images/wbg.gif" class='title'><span>新增客户</span></td>
					    </tr>
						<tr align='center' bgcolor="#FFFFFF"  >
						    <td width="25%" align="right">
						         客户编号：
						    </td>
						    <td width="75%" align="left">
						        <input type="text" id="id" name="id" value=<%=GetID.getCustomerId() %> size="50" readonly />
						        <span id="id" style="color:red;">*</span>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF"  >
						    <td width="25%" align="right">
						         客户姓名：
						    </td>
						    <td width="75%" align="left">
						        <input type="text" id="c_name" name="c_name" size="50" placeholder="请输入客户姓名" />
						        <span id="name" style="color:red;">*</span>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF"  >
						    <td width="25%" align="right">
						         客户性别：
						    </td>
						    <td width="75%" align="left">
						        <input type="radio" id="c_sex" name="c_sex" value="男" checked />男&nbsp;
						        <input type="radio" id="c_sex" name="c_sex" value="女" />女&nbsp;
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF"  >
						    <td width="25%"  align="right">
						         联系方式：
						    </td>
						    <td width="75%"  align="left">
						        <input type="text" id="c_tel" name="c_tel" size="50" placeholder="请输入客户联系方式" onblur="checkForm();" />
						         <span id="tel" style="color:red;">*</span>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF"  >
						    <td width="25%"  align="right">
						        客户类型：
						    </td>
						    <td width="75%"  align="left">
						    	<input type="radio" id="c_type" name="c_type" value="普通客户" checked />普通客户&nbsp;
						        <input type="radio" id="c_type" name="c_type" value="重要客户"   />重要客户&nbsp;
						        <input type="radio" id="c_type" name="c_type" value="VIP客户"   />VIP客户&nbsp;
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" >
						    <td width="25%"  align="right">
						        &nbsp;
						    </td>
						    <td width="75%"  align="left">
						       <input type="submit" class="btn" value="确认提交" onclick="return checkForm();" />&nbsp; 
						       <input type="reset" class="btn" value="重置"/>&nbsp;
						       <input type="button" class="btn" value="返回" onclick="back()" />
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
