<%@ page language="java" pageEncoding="UTF-8" import="java.util.*,com.orm.Tgoods,com.orm.Tcatelog"%>
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
	<form action="<%=path %>/goods?type=goodsEdit&id=<%=((List<Tgoods>)request.getAttribute("goodsList")).get(0).getId() %>" name="formEdit" method="post">
				     <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
						<tr bgcolor="#E7E7E7">
							<td height="14" colspan="100" background="<%=path %>/images/tbg.gif">&nbsp;商品信息更改&nbsp;</td>
						</tr>
						<c:forEach items="${requestScope.goodsList}" var="goods">
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#A2D7B2';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" align="right">
						         类别：
						    </td>
						    <td width="75%" align="left">
						        <table border="0">
							           <tr> 
							               <td> 
							               <input type="text" value="${goods.catelog_name}" disabled="disabled"/>
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
						         名称：
						    </td>
						    <td width="75%" align="left">
						        <input type="text" name="name" size="20" value="${goods.name}"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#A2D7B2';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" align="right">
						         价格：
						    </td>
						    <td width="75%" align="left">
						        <input type="text" name="danjia" size="20" value="${goods.danjia}"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#A2D7B2';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" align="right">
						         产地：
						    </td>
						    <td width="75%" align="left">
						        <input type="text" name="chandi" size="20" value="${goods.chandi}"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#A2D7B2';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" align="right">
						         单位：
						    </td>
						    <td width="75%" align="left">
						        <input type="text" name="danwei" size="20" value="${goods.danwei}"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#A2D7B2';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" align="right">
						         规格：
						    </td>
						    <td width="75%" align="left">
						        <input type="text" name="guige" size="20" value="${goods.guige}"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#A2D7B2';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" align="right">
						         备注：
						    </td>
						    <td width="75%" align="left">
						        <input type="text" name="beizhu" size="50" value="${goods.beizhu}"/>
						    </td>
						</tr>
						</c:forEach>
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
			<%-- <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="100" background="<%=path %>/images/tbg.gif">&nbsp;货品信息管理&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="15%">类别</td>
					<td width="15%">名称</td>
					<td width="15%">产地</td>
					<td width="15%">单位</td>
					<td width="15%">规格</td>
					<td width="10%">备注</td>
		        </tr>	
				<c:forEach items="${requestScope.goodsList}" var="goods">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						<input type="text" name=""/>${goods.catelog_name}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${goods.name}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${goods.chandi}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${goods.danwei}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${goods.guige}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${goods.beizhu}
					</td>
				</tr>
				</c:forEach>
			</table>
			
			<form action="<%=path %>/goods?type=goodsSearch" name="form1" method="post">
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			         <input type="text" name="name" size="20"/>
			         &nbsp;
			         <input type="submit" value="查询"/>
			         &nbsp; 
			         <input type="button" value="添加" style="width: 80px;" onclick="goodsAdd()" />
			    </td>
			  </tr>
		    </table>
		    </form> --%>
	</body>
</html>
