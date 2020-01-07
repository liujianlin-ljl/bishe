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
	        function check(){
	     	   var catelogName=document.getElementById("catelogName");
	     	   var cName=document.getElementById("cName");
	     	   if(catelogName.value==""){
	     		   cName.innerHTML="名称不能为空";
	     		   return false;
	     	   }
	     	   return true;
	      	}
        </script>
	</head>

	<body background='<%=path %>/img/allbg.gif'>
	<form action="<%=path %>/catelog?type=catelogEdit&id=<%=request.getParameter("id") %>" name="formEdit" method="post">
				     <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
						<tr bgcolor="#E7E7E7">
							<td height="14" colspan="2" background="<%=path %>/images/tbg.gif">&nbsp;修改分类信息&nbsp;</td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='silver';" onMouseOut="javascript:this.bgColor='#FFFFFF';">
						    <td width="25%" align="right">
						         分类名称：
						    </td>
						    <td width="75%" align="left">
							    <input type="text" id="catelogName" name="catelogName" value="<%=request.getParameter("catelogName") %>" />
							    <span id="cname" style="color:red;">*</span>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='silver';" onMouseOut="javascript:this.bgColor='#FFFFFF';" >
						    <td width="25%" align="right">
						        &nbsp;
						    </td>
						    <td width="75%" align="left">
<%-- 						    	<input type="hidden" name="catelogId" value="<%=request.getParameter("id") %>" /> --%>
						       <input type="submit" value="确认修改" onclick="return check()"/>&nbsp;
						    </td>
						</tr>
					 </table>
			</form>
</body>
</html>