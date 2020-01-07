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
        <script language="javascript">
	      //返回 
	        function back(){
	   	   		window.location.href="<%=path%>/admin/index/sysPro.jsp";
	      	}
        </script>
        <style type="text/css">
        	table{border-radius: 10px;margin-top:50px;box-shadow:5px 5px 5px 5px;}
        </style>
	</head>

	<body style="background:url('<%=path %>/img/5cbf1f2b7e13b.jpg');background-size:100%;">
			<form action="<%=path %>/pancun?type=pancunMingxi" name="formAdd" method="post">
				     <table width="48%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#D1DDAA" style="background-color:#D1DDAA;margin-top:100px;height:220px;">
						<tr bgcolor="#EEF4EA">
					        <td colspan="3" background="<%=path %>/images/wbg.gif" class='title'><span class="title">盘存信息查询</span></td>
					    </tr>
						<tr align='center'>
						    <td width="20%" align="right" style="border-right:none; ">
						         商品名称：
						    </td>
						    <td width="75%" align="left" style="border-left:none; ">
						        <input type="text" id="goodsName" name="goodsName" size="50" placeholder="请输入商品名称" />
						        <span id="id" style="color:red;">*</span>
						    </td>
						</tr>
						<tr align='center'>
						    <td width="20%" align="right">
						         仓库名称：
						    </td>
						    <td width="75%" align="left">
						        <input type="text" id="cangkuName" name="cangkuName" size="50" placeholder="请输入仓库名称" />
						        <span id="name" style="color:red;">*</span>
						    </td>
						</tr>
						<tr align='center' >
						    <td width="25%"  align="right">
						        &nbsp;
						    </td>
						    <td width="75%"  align="left">
						       <input type="submit" class="btn" style="width:100px;" value="查询盘存信息" />&nbsp; 
						       <input type="reset" class="btn" value="重置"/>&nbsp;
						       <input type="button" class="back" value="" onclick="back()" />
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
