<%@ page language="java" pageEncoding="UTF-8" import="java.util.*,com.orm.Customer"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<script type='text/javascript' src='<%=path %>/js/jquery-1.8.3.js'></script>
		<script language="javascript">
	      //返回 
	        function back(){
	     	   var url="<%=path%>/customer?type=customerMana";
	   	   		window.location.href=url;
	      	}
        </script>
	</head>

	<body style="background:url('<%=path %>/img/5cbf1f2b7e13b.jpg');background-size:100%;">
	<form action="<%=path %>/customer?type=customerEdit&id=<%=((Customer)(request.getAttribute("customer"))).getId() %>" name="formEdit" method="post">
				     <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
						<tr bgcolor="#E7E7E7">
							<td height="14" colspan="100" background="<%=path %>/images/tbg.gif">&nbsp;更新客户信息&nbsp;</td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='silver';" onMouseOut="javascript:this.bgColor='#FFFFFF';">
						    <td width="25%" align="right">
						         客户编号：
						    </td>
						    <td width="75%" align="left">
						        <table border="0">
							           <tr> 
							               <td> 
							               <input type="text" name="c_id" value="${requestScope.customer.id}" readonly />
							               </td>
							           </tr>
							    </table>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='silver';" onMouseOut="javascript:this.bgColor='#FFFFFF';" >
						    <td width="25%"  align="right">
						         客户姓名：
						    </td>
						    <td width="75%" align="left">
						        <input type="text" name="c_name" size="20" value="${requestScope.customer.cname}"/>
						    </td>
						</tr>
						<tr align='center' onMouseMove="javascript:this.bgColor='silver';" onMouseOut="javascript:this.bgColor='#FFFFFF';" >
						    <td width="25%" align="right">
						         客户性别：
						    </td>
						    <td width="75%" align="left">
						        <input type="text" name="c_sex" size="20" value="${requestScope.customer.csex}" readonly/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='silver';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" align="right">
						         联系方式：
						    </td>
						    <td width="75%" align="left">
						        <input type="text" name="c_tel" size="20" value="${requestScope.customer.ctel}"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='silver';" onMouseOut="javascript:this.bgColor='#FFFFFF';">
						    <td width="25%" align="right">
						        客户类型：
						    </td>
						    <td width="75%" align="left">
						        <input type="radio" id="c_type" name="c_type" value="普通客户" checked />普通客户&nbsp;
						        <input type="radio" id="c_type" name="c_type" value="重要客户"   />重要客户&nbsp;
						        <input type="radio" id="c_type" name="c_type" value="VIP客户"   />VIP客户&nbsp;
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='silver';" onMouseOut="javascript:this.bgColor='#FFFFFF';" >
						    <td width="25%" align="right">
						        &nbsp;
						    </td>
						    <td width="75%" align="left">
						       <input type="submit" value="确认修改" onclick="return check()"/>&nbsp;
						       <input type="button" value="返回" onclick="back()" /> 
						    </td>
						</tr>
						
					 </table>
			</form>
</body>
</html>