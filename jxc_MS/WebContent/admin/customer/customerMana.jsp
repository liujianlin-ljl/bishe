<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
<meta http-equiv="description" content="This is my page" />

<link rel="stylesheet" type="text/css" href="<%=path%>/css/base.css" />

<script language="javascript">
		   function findById(id){
			   window.location.href="<%=path%>/customer?type=findCustomerById&id="+id;
		   }
		   function findByName(name){
			   window.location.href="<%=path%>/customer?type=findCustomerByName&c_name="+name;
		   }
		   function findByType(type){
			   window.location.href="<%=path%>/customer?type=findCustomerByType&c_type="+type;
		   }
           function customerDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path%>/customer?type=customerDel&id="+id;
               }
           }
           function stopTrade(id)//停止销售
           {
               if(confirm('确定要停止与该客户的交易吗？'))
               {
                   window.location.href="<%=path%>/customer?type=stopTrade&id="+id;
               }
           }
           function reTrade(id)//恢复交易
           {
               if(confirm('确定恢复与该客户的交易吗？'))
               {
                   window.location.href="<%=path%>/customer?type=reTrade&id="+id;
               }
           }
           
           function customerAdd()
           {
                 var url="<%=path%>/admin/customer/customerAdd.jsp";
				 window.location.href=url;
           }
           function customerEdit(id){
        	   var url="<%=path%>/customer?type=findCustomerToEdit&id="+id;
        	   window.location.href=url;
           }
         //返回 
           function back(){
        	   var url="<%=path%>/admin/index/sysPro.jsp";
      	   		window.location.href=url;
         	}
         //刷新
         function refresh(){
        	 window.location.href="<%=path%>/customer?type=customerMana";
         }
//            function findCangkuByName(){
//         	   var cangku_name=document.getElementById("find");
<%--         	   var url="<%=path%>/cangku?type=findCangkuByName&cangku_name="+cangku_name; --%>
//         	   window.location.href=url;
//            }
       </script>
</head>

<body style="background:url('<%=path %>/img/5cbf1f2b7e13b.jpg');background-size:100%;">
	<table width="98%" border="0" cellpadding="2" cellspacing="1"
		bgcolor="#D1DDAA" align="center" style="margin-top: 8px">
		<tr bgcolor="#E7E7E7">
			<td height="26" colspan="8" background="<%=path %>/img/wbg.gif" style="font:bold 18px '楷体';">&nbsp;客户信息管理&nbsp;</td>
		</tr>
		<tr align="center" bgcolor="#FAFAF1" height="26" style="font:bold 16px '宋体';">
			<td colspan="7">
				<form action="">
					客户编号：<input type="text" id="id" name="id" size="22" placeholder="输入客户编号" value="${requestScope.id }" onblur="findById(this.value)"/>&nbsp;
					客户姓名：<input type="text" name="c_name" placeholder="输入客户姓名" value="${requestScope.name }" onblur="findByName(this.value)"/>&nbsp;
					客户类型：<select name="c_type" onchange="findByType(this.value)" >
								<option value="普通客户">普通客户</option>
								<option value="重要客户">重要客户</option>
								<option value="VIP客户">VIP客户</option>
								<c:if test="${requestScope.type != 'null'}">
									<option value="${requestScope.type}" selected>${requestScope.type}</option>
								</c:if>
								<c:if test="${requestScope.type eq 'null'}">
									<option value="普通客户" selected>-请选择类型-</option>
								</c:if>
						   </select>
				</form>
				
			</td>
		</tr>
		<tr align="center" bgcolor="#FAFAF1" height="26" style="font:bold 16px '楷体';">
			<td width="10%">客户编号</td>
			<td width="10%">客户姓名</td>
			<td width="10%">客户性别</td>
			<td width="10%">联系电话</td>
			<td width="10%">客户类型</td>
			<td width="10%">状态</td>
			<td width="20%">操作</td>
		</tr>
		<c:forEach items="${requestScope.customerList}" var="customer">
			<tr align='center' bgcolor="#FFFFFF"
				onMouseMove="javascript:this.bgColor='#A2D7B2';"
				onMouseOut="javascript:this.bgColor='#FFFFFF';">
				<td align="center">
					${customer.id}
				</td>
				<td align="center">
					${customer.cname}
				</td>
				<td align="center">
					${customer.csex}
				</td>
				<td align="center">
					${customer.ctel}
				</td>
				<td align="center">
					${customer.ctype}
				</td>
				<td align="center">
					<c:if test="${customer.del eq 'no' }">
						<font size="15" color="green">正常</font>
					</c:if>
					<c:if test="${customer.del eq 'yes' }">
						<font size="15" color="red">停止销售</font>
					</c:if>
					
				</td>
				<td align="center">
					<c:if test="${sessionScope.userType==0 }">
						<input type="button" onclick="customerDel('${customer.id}')" value="删除" />
						<c:if test="${customer.del eq 'no'}">
							<input type="button" onclick="stopTrade('${customer.id}')" value="停止交易" /> 
						</c:if> 
						<c:if test="${customer.del eq 'yes'}">
							<input type="button" onclick="reTrade('${customer.id}')" value="恢复交易" /> 
						</c:if> 
						<input type="button" onclick="customerEdit('${customer.id}')" value="编辑" />
					</c:if>
					<c:if test="${sessionScope.userType==1 }">无权限</c:if>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="7">共 ${requestScope.size } 条记录</td>
		</tr>
	</table>

	<table width='98%' border='0'
		style="margin-top: 8px; margin-left: 5px;">
		<tr>
			<td>
				<c:if test="${sessionScope.userType==0 }">
					<input type="button" value="新增客户" style="width: 80px;" onclick="customerAdd()" /> 
				</c:if>
				<input type="button" value="返回" style="width: 80px;" onclick="back()" />
				<input type="button" value="刷新" style="width: 80px;" onclick="refresh()" />
			</td>
		</tr>
	</table>
</body>
</html>
