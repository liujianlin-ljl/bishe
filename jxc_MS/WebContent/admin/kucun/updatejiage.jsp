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
        <style type="text/css">
        	table{border-radius: 10px;margin-top:50px;box-shadow:2px 5px 2px 5px;}
        </style>
	</head>

	<body style="background:url('<%=path %>/img/5cbf1f2b7e13b.jpg');background-size:100%;">
			<form action="<%=path %>/kucun" name="formAdd">
				     <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#D1DDAA" style="background-color:#D1DDAA;margin-top:8px;height:240px;">
						<tr bgcolor="#EEF4EA">
					        <td colspan="3" background="<%=path %>/images/wbg.gif" class='title'><span class="title">销售价格调整</span></td>
					    </tr>
						<tr align='center'>
						    <td width="30%" align="right" style="border-right:none; ">
						         商品名称：
						    </td>
						    <td width="70%" align="left" style="border-left:none; ">
						        <input type="text" id="goodsName" name="goodsName" size="50" value="<%=request.getParameter("goodsName") %>" readonly />
						    </td>
						</tr>
						<tr align='center'>
						    <td width="20%" align="right">
						         出库价格：
						    </td>
						    <td width="75%" align="left">
						        <input type="text" id="chuku_price" name="chuku_price" size="50" value="<%=request.getParameter("chuku_price") %>" />
						        <span id="name" style="color:red;">*</span>
						    </td>
						</tr>
						<tr align='center' >
						    <td width="75%"  align="center" colspan="2">
						    	<input type="hidden" name="type" value="updatejiage" />
						    	<input type="hidden" name="kucun_id" value="<%=request.getParameter("kucun_id") %>" />
						        <input type="submit" class="btn" style="width:120px;height:30px;" value="确定调整" />&nbsp; 
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
