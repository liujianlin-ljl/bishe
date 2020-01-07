<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>

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
        
        <script language="javascript">
            function c()
		    {
		         if(document.formAdd.name.value=="")
		         {
		             alert("请输入品牌名称");
		             return false;
		         }
		         document.formAdd.submit();
		     }
//           //返回 
// 	        function back(){
<%-- 	   	   		window.location.href="<%=path%>/catelog?type=catelogMana"; --%>
// 	      	}
        </script>
        <style type="text/css">
        	table{border-radius: 10px;margin-top:50px;box-shadow:2px 2px 2px 2px;}
        	span{color:red;font-size:15px;}
        </style>
	</head>

	<body style="background:url('<%=path %>/img/5cbf1f2b7e13b.jpg');background-size:100%;">
			<form action="<%=path %>/catelog?type=catelogAdd" name="formAdd" method="post">
				     <table width="98%" height="160" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
						<tr bgcolor="#E7E7E7">
							<td height="14" colspan="100" background="<%=path %>/images/tbg.gif">&nbsp;品牌分类录入&nbsp;</td>
						</tr>
						<tr align='center' bgcolor="#D1DDAA" onMouseMove="javascript:this.bgColor='#A2D7B2';" onMouseOut="javascript:this.bgColor='#D1DDAA';" height="22">
						    <td width="30%"  align="right">
						         品牌名称：
						    </td>
						    <td width="65%"  align="left">
						        <input type="text" name="name" size="50" placeholder="请输入品牌分类名称"/><span>*</span>
						    </td>
						</tr>
						<tr align='center' bgcolor="#D1DDAA" onMouseMove="javascript:this.bgColor='';" onMouseOut="javascript:this.bgColor='#D1DDAA';" height="22">
						    <td width="25%"  align="right">
						        &nbsp;
						    </td>
						    <td width="75%" align="left">
						       <input type="button" class="btn" value="提交" onclick="c()"/>&nbsp; 
						       <input type="reset" class="btn" value="重置"/>&nbsp;
<!-- 						       <input type="button" class="btn" value="返回" onclick="back();"/>&nbsp; -->
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
