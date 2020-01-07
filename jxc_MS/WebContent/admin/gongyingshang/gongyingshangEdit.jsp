<%@ page language="java" pageEncoding="UTF-8" import="java.util.*,com.orm.Gongyingshang"%>
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
	</head>

	<body style="background:url('<%=path %>/img/5cbf1f2b7e13b.jpg');background-size:100%;">
	<form action="<%=path %>/gongyingshang?type=gongyingshangEdit&id=<%=request.getParameter("id") %>" name="formEdit" method="post">
				     <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
						<tr bgcolor="#E7E7E7">
							<td height="14" colspan="100" background="<%=path %>/images/tbg.gif">&nbsp;供应商信息修改&nbsp;</td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#A2D7B2';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" align="right">
						         名称：
						    </td>
						    <td width="75%" align="left">
						        <table border="0">
							           <tr> 
							               <td> 
							               <input type="text" name="mingcheng" value="<%=request.getParameter("mingcheng")%>" />
							               </td>
							               <td>
							                  <img id="indicator" src="<%=path %>/img/loading.gif" style="display:none"/>
							               </td>
							           </tr>
							    </table>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#A2D7B2';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" align="right">
						         地址：
						    </td>
						    <td width="75%" align="left">
						        <input type="text" name="dizhi" size="20" value="<%=request.getParameter("dizhi")%>"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#A2D7B2';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" align="right">
						         联系人：
						    </td>
						    <td width="75%" align="left">
						        <input type="text" name="lianxiren" size="20" value="<%=request.getParameter("lianxiren")%>"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#A2D7B2';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" align="right">
						         电话：
						    </td>
						    <td width="75%" align="left">
						        <input type="text" name="dianhua" size="20" value="<%=request.getParameter("dianhua")%>"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#A2D7B2';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" align="right">
						         邮编：
						    </td>
						    <td width="75%" align="left">
						        <input type="text" name="youbian" size="20" value="<%=request.getParameter("youbian")%>"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#A2D7B2';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" align="right">
						         传真：
						    </td>
						    <td width="75%" align="left">
						        <input type="text" name="chuanzhen" size="20" value="<%=request.getParameter("chuanzhen")%>"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#A2D7B2';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" align="right">
						         邮箱：
						    </td>
						    <td width="75%" align="left">
						        <input type="text" name="youxiang" size="50" value="<%=request.getParameter("youxiang")%>"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#A2D7B2';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" align="right">
						        &nbsp;
						    </td>
						    <td width="75%" align="left">
						       <input type="submit" value="确定修改" onclick="return check()"/>&nbsp; 
						    </td>
						</tr>
						
					 </table>
			</form>
	</body>
</html>
