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
        <link rel="stylesheet" type="text/css" href="<%=path%>/css/input.css"/>
        <script type="text/javascript" src="<%=path %>/jquery-1.8.3.js"></script>
        <script language="javascript">
	       	var tel=/^1[3-9][0-9]{9}$/;
	       	var size=/^[0-9]{0,4}$/;
       		
        	function checkForm(){
	        	var cangku_name=document.getElementById("cangku_name");
	        	var cangku_master=document.getElementById("cangku_master");
	        	var cangku_tel=document.getElementById("cangku_tel");
	       		var cankgu_addr=document.getElementById("cangku_addr");
	       		var cangku_size=document.getElementById("cangku_size");
	        		
        		
        		if(cangku_name.value==""){
        			document.getElementById("name").innerHTML="名称不能为空";
        			return false;
        		}
        		if(cangku_master.value==""){
        			document.getElementById("master").innerHTML="负责人不能为空";
        			return false;
        		}
        		if(cangku_tel.value==""){
        			document.getElementById("tel").innerHTML="联系电话不能为空";
        			return false;
        		}
        		if(cangku_addr.value==""){
        			document.getElementById("addr").innerHTML="地址不能为空";
        			return false;
        		}
        		if(cangku_size.value==""){
        			document.getElementById("size").innerHTML="仓库容量不能为空";
        			return false;
        		}
        		if(!size.test(cangku_size.value)){
        			document.getElementById("size").innerHTML="仓库容量不合法，必须为数字且不得超过10000";
        			return false;
        		}
        		return true;	
        	}
        	function checkTel(){
        		var cangku_tel=document.getElementById("cangku_tel");
        		if(!tel.test(cangku_tel.value)){
        			document.getElementById("tel").innerHTML="联系电话不合法";
        		}else{
        			var t=document.getElementById("tel");
        			t.innerHTML="合法";
        			t.style.color='green';
        		}
        	}
        
	      //返回 
	        function back(){
	     	   var url="<%=path%>/cangku?type=cangkuMana";
	   	   		window.location.href=url;
	      	}
        </script>
        <style type="text/css">
        	table{border-radius: 10px;margin-top:50px;box-shadow:5px 5px 5px 5px;}
        	span{color:red;font-size:15px;}
        </style>
	</head>

	<body style="background:url('<%=path %>/img/5cbf1f2b7e13b.jpg');background-size:100%;">
			<form action="<%=path %>/cangku?type=cangkuAdd" name="formAdd" method="post">
				     <table width="50%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:20px">
						<tr bgcolor="#EEF4EA" align="center">
					        <td colspan="3" background="<%=path %>/images/wbg.gif" class='title'><span>新增仓库</span></td>
					    </tr>
						<tr align='center' bgcolor="#CBD8AC" onMouseMove="javascript:this.bgColor='#A2D7B2';" onMouseOut="javascript:this.bgColor='#CBD8AC';" >
						    <td width="25%" align="right">
						         仓库名称：
						    </td>
						    <td width="75%" align="left">
						        <input type="text" id="cangku_name" name="cangku_name" size="50" placeholder="请输入要添加的仓库名称" />
						        <span id="name" style="color:red;">*</span>
						    </td>
						</tr>
						<tr align='center' bgcolor="#CBD8AC" onMouseMove="javascript:this.bgColor='#A2D7B2';" onMouseOut="javascript:this.bgColor='#CBD8AC';" >
						    <td width="25%"  align="right">
						         仓库负责人：
						    </td>
						    <td width="75%"  align="left">
						        <input type="text" id="cangku_master" name="cangku_master" size="50" placeholder="请输入仓库的负责人" />
						         <span id="master" style="color:red;">*</span>
						    </td>
						</tr>
						<tr align='center' bgcolor="#CBD8AC" onMouseMove="javascript:this.bgColor='#A2D7B2';" onMouseOut="javascript:this.bgColor='#CBD8AC';" >
						    <td width="25%"  align="right">
						         联系电话：
						    </td>
						    <td width="75%"  align="left">
						        <input type="text" id="cangku_tel" name="cangku_tel" size="50" placeholder="请输入仓库负责人联系电话" onblur="checkTel();" />
						         <span id="tel" style="color:red;">*</span>
						    </td>
						</tr>
						<tr align='center' bgcolor="#CBD8AC" onMouseMove="javascript:this.bgColor='#A2D7B2';" onMouseOut="javascript:this.bgColor='#CBD8AC';" >
						    <td width="25%"  align="right">
						         仓库地址：
						    </td>
						    <td width="75%"  align="left">
						        <input type="text" id="cangku_addr" name="cangku_addr" size="50" placeholder="请输入仓库地址" />
						         <span id="addr" style="color:red;">*</span>
						    </td>
						</tr>
						<tr align='center' bgcolor="#CBD8AC" onMouseMove="javascript:this.bgColor='#A2D7B2';" onMouseOut="javascript:this.bgColor='#CBD8AC';" height="22">
						    <td width="25%"  align="right">
						        容量：
						    </td>
						    <td width="75%"  align="left">
						        <input type="text" id="cangku_size" name="cangku_size" size="50" placeholder="请输入新仓库容量" />
						         <span id="size" style="color:red;">*</span>
						    </td>
						</tr>
						
						<tr align='center' bgcolor="#CBD8AC" onMouseMove="javascript:this.bgColor='#A2D7B2';" onMouseOut="javascript:this.bgColor='#CBD8AC';" height="22">
						    <td width="25%"  align="right">
						        &nbsp;
						    </td>
						    <td width="75%"  align="left">
						       <input type="submit" class="btn" value="提交" onclick="return checkForm();" />&nbsp; 
						       <input type="reset" class="btn" value="重置"/>&nbsp;
						       <input type="button" class="btn" value="返回" onclick="back()" />
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
