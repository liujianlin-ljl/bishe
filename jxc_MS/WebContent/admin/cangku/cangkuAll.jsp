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
			function cangkuDel(id){
               if(confirm('您确定删除吗？')){
                   window.location.href="<%=path %>/cangku?type=cangkuDel&id="+id;
               }
           }
			function cangkuEdit(id){
	        	var url="<%=path%>/cangku?type=findById&id="+id;
	        	window.location.href=url;
	        }
			function back(){
				var url="<%=path%>/cangku?type=cangkuMana";
				window.location.href=url;
			}
		</script>
	</head>

	<body background='<%=path %>/images/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="100" background="<%=path %>/images/tbg.gif">&nbsp;仓库查询结果&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1">
					<td width="10%">名称</td>
					<td width="10%">仓库负责人</td>
					<td width="10%">联系电话</td>
					<td width="10%">仓库地址</td>
					<td width="10%">仓库剩余容量</td>
					<td width="10%">状态</td>
					<td width="10%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.cangkuList}" var="cangku">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='silver';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td align="center">
						${cangku.cangku_name}
					</td>
					<td align="center">
						${cangku.cangku_master}
					</td>
					<td align="center">
					    ${cangku.cangku_tel}
					</td>
					<td align="center">
						${cangku.cangku_addr}
					</td>
					<td align="center">
						${cangku.cangku_size}
					</td>
					<td  align="center">
					    <c:if test="${cangku.cangku_size<=50}">
					    	<font color="red">仓库容量即将耗尽</font>
					    </c:if>
					    <c:if test="${cangku.cangku_size>50}">
					    	<font color="black">正常</font>
					    </c:if>
					</td>
					<td align="center">
						<input type="button" onclick="cangkuDel(${cangku.cangku_id})" value="删除"/>
						<input type="button" onclick="cangkuEdit(${cangku.cangku_id})" value="编辑"/>
					</td>
				</tr>
				</c:forEach>
				<tr>
					<td colspan="8">共 ${requestScope.size } 条记录</td>
				</tr>
			</table>
			
			<table width='98%'  border='0' style="margin-top:8px;margin-left: 5px;">
				  <tr>
				    <td>
				      <input type="button" value="返回" style="width: 80px;" onclick="back()" />
				    </td>
				  </tr>
			</table>
	</body>
</html>
