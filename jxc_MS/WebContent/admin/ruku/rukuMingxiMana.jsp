<%@ page language="java" pageEncoding="UTF-8"%>
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
		<script type="text/javascript" src="<%=path %>/js/public.js"></script>
		<script type="text/javascript" src="<%=path %>/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="<%=path %>/js/popup.js"></script>
        <script language="javascript">
           function rukuMingxiDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/ruku?type=rukuMingxiDel&id="+id;
               }
           }
           
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="8" background="<%=path %>/images/tbg.gif">&nbsp;&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="15%">商品名称</td>
					<td width="15%">单价</td>
					<td width="15%">数量</td>
					<td width="10%">金额</td>
					<td width="10%">入库仓库</td>
<!-- 					<td width="10%">操作</td> -->
		        </tr>	
				<c:forEach items="${requestScope.rukuMingxiList}" var="rukuMingxi">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						${rukuMingxi.goods_name}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					   ${rukuMingxi.danjia}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					   ${rukuMingxi.shuliang}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${rukuMingxi.jine}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${rukuMingxi.cangku_name}
					</td>
<!-- 					<td bgcolor="#FFFFFF" align="center"> -->
<!-- 						<form action="" name="formAdd" method="post"> -->
<%-- 							<input type="hidden" name="ruku_id" value="${rukuMingxi.ruku_id }" /> --%>
<%-- 						   <input type="button" value="删除" onclick="rukuMingxiDel(${rukuMingxi.id})"/> --%>
<!-- 						</form> -->
<!-- 					</td> -->
				</tr>
				</c:forEach>
			</table>
	</body>
</html>
