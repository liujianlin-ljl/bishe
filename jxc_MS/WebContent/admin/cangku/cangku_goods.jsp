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
		
        <script language="javascript">
           function cangkuDel(id)
           {
               if(confirm('您确定要下架该商品吗'))
               {
                   window.location.href="<%=path %>/cangku?type=cangkuDel&id="+id;
               }
           }
           
          
           //返回 
           function back(){
				var url="<%=path%>/cangku?type=cangkuMana";
      	   		window.location.href=url;
         }
           
           
       </script>
	</head>

	<body style="background:url('<%=path %>/img/5cbf1f2b7e13b.jpg');background-size:100%;">
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="8" background="<%=path %>/images/tbg.gif">&nbsp;<%=request.getAttribute("cangku_name") %>仓库商品&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="10%">商品编号</td>
					<td width="10%">商品名称</td>
					<td width="10%">商品数量</td>
					<td width="10%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.kucunList}" var="kucun">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='silver';" onMouseOut="javascript:this.bgColor='#FFFFFF';" >
					<td align="center">
						${kucun.goods_id}
					</td>
					<td align="center">
						${kucun.goods_name}
					</td>
					<td align="center">
					    ${kucun.kucun}
					</td>
					<td align="center">
						 <c:if test="${sessionScope.userType==0 }">
							<input type="button" onclick="xiajia(${kucun.goods_id})" value="下架"/>
						</c:if>
						<c:if test="${sessionScope.userType==1 }">无权限</c:if>
					</td>
				</tr>
				</c:forEach>
				<tr>
					<td colspan="8">共 ${requestScope.size } 条记录</td>
				</tr>
			</table>
			
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			      <input type="button" value="返回" style="width: 80px;" onclick="back()" />
			    </td>
			  </tr>
			  
		    </table>
	</body>
</html>
