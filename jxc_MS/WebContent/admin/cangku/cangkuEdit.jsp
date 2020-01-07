<%@ page language="java" pageEncoding="UTF-8" import="java.util.*,com.orm.Cangku"%>
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
	     	   var url="<%=path%>/cangku?type=cangkuMana";
	   	   		window.location.href=url;
	      	}
        </script>
	</head>

	<body style="background:url('<%=path %>/img/5cbf1f2b7e13b.jpg');background-size:100%;">
	<form action="<%=path %>/cangku?type=cangkuEdit&id=<%=((Cangku)request.getAttribute("cangku")).getCangku_id() %>" name="formEdit" method="post">
				     <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
						<tr bgcolor="#E7E7E7">
							<td height="14" colspan="100" background="<%=path %>/images/tbg.gif">&nbsp;仓库信息更改&nbsp;</td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='silver';" onMouseOut="javascript:this.bgColor='#FFFFFF';">
						    <td width="25%" align="right">
						         仓库名称：
						    </td>
						    <td width="75%" align="left">
						        <table border="0">
							           <tr> 
							               <td> 
							               <input type="text" name="cangku_name" value="${requestScope.cangku.cangku_name}" />
							               </td>
							               <td>
							                  <img id="indicator" src="<%=path %>/img/loading.gif" style="display:none"/>
							               </td>
							           </tr>
							    </table>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='silver';" onMouseOut="javascript:this.bgColor='#FFFFFF';" >
						    <td width="25%"  align="right">
						         负责人：
						    </td>
						    <td width="75%" align="left">
						        <input type="text" name="cangku_master" size="20" value="${requestScope.cangku.cangku_master}"/>
						    </td>
						</tr>
						<tr align='center' onMouseMove="javascript:this.bgColor='silver';" onMouseOut="javascript:this.bgColor='#FFFFFF';" >
						    <td width="25%" align="right">
						         联系电话：
						    </td>
						    <td width="75%" align="left">
						        <input type="text" name="cangku_tel" size="20" value="${requestScope.cangku.cangku_tel}"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='silver';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" align="right">
						         仓库地址：
						    </td>
						    <td width="75%" align="left">
						        <input type="text" name="cangku_addr" size="20" value="${requestScope.cangku.cangku_addr}"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='silver';" onMouseOut="javascript:this.bgColor='#FFFFFF';">
						    <td width="25%" align="right">
						        设置容量：
						    </td>
						    <td width="75%" align="left">
						        <input type="text" name="cangku_size" size="20" value="${requestScope.cangku.cangku_size}" readonly/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='silver';" onMouseOut="javascript:this.bgColor='#FFFFFF';" >
						    <td width="25%" align="right">
						        &nbsp;
						    </td>
						    <td width="75%" align="left">
						       <input type="submit" value="修改" onclick="return check()"/>&nbsp;
						       <input type="button" value="返回" onclick="back()" /> 
						    </td>
						</tr>
						
					 </table>
			</form>
</body>
</html>