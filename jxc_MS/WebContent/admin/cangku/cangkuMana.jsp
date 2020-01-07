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
           function cangkuDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path%>/cangku?type=cangkuDel&id="+id;
               }
           }
           
           function cangkuAdd()
           {
                 var url="<%=path%>/admin/cangku/cangkuAdd.jsp";
				 window.location.href=url;
           }
           function cangkuEdit(id){
        	   var url="<%=path%>/cangku?type=findById&id="+id;
        	   window.location.href=url;
           }
         //返回 
           function back(){
        	   var url="<%=path%>/admin/index/sysPro.jsp";
      	   		window.location.href=url;
         	}
         function refresh(){
        	 window.location.href="<%=path%>/cangku?type=cangkuMana";
         }
           function findCangkuByName(name){
        	   window.location.href="<%=path%>/cangku?type=findCangkuByName&cangku_name="+name;
           }
           function findCangkuByMaster(master){
        	   window.location.href="<%=path%>/cangku?type=findCangkuByMaster&cangku_master="+master;
           }
           function findCangkuByAddr(addr){
        	   window.location.href="<%=path%>/cangku?type=findCangkuByAddr&cangku_addr="+addr;
           }
       </script>
</head>

<body style="background:url('<%=path %>/img/5cbf1f2b7e13b.jpg');background-size:100%;">
	<table width="98%" border="0" cellpadding="2" cellspacing="1"
		bgcolor="#D1DDAA" align="center" style="margin-top: 8px">
		<tr bgcolor="#E7E7E7">
			<td height="26" colspan="8" background="<%=path %>/img/wbg.gif" style="font:bold 18px '楷体';">&nbsp;仓库管理&nbsp;</td>
		</tr>
		<tr align="center">
			<td colspan="8">
				<form action="<%=path%>/cangku?type=findCangkuBySize" method="post">
					仓库名称：<input type="text" id="find" name="cangku_name" value="${requestScope.cangku_name }" placeholder="输入仓库名称" onblur="findCangkuByName(this.value)" />&nbsp;&nbsp;
					负责人：<input type="text" name="cangku_master" value="${requestScope.cangku_master }" placeholder="输入仓库负责人" onblur="findCangkuByMaster(this.value)" />
					地址：<input type="text" name="cangku_addr" value="${requestScope.cangku_addr }" placeholder="输入仓库地址" onblur="findCangkuByAddr(this.value)" />
					容量：<input type="text" name="min" size="4" value="${requestScope.min }" /> - 
						<input type="text" name="max" size="4" value="${requestScope.max }" />
					<input type="submit" value="查询" />
				</form>
				
			</td>
		</tr>
		<tr align="center" bgcolor="#FAFAF1" height="26" style="font:bold 16px '楷体';">
			<td width="8%">序列号</td>
			<td width="12%">名称</td>
			<td width="10%">仓库负责人</td>
			<td width="10%">联系电话</td>
			<td width="20%">仓库地址</td>
			<td width="8%">仓库剩余容量</td>
			<td width="15%">状态</td>
			<td width="16%">操作</td>
		</tr>
		<c:forEach items="${requestScope.cangkuList}" var="cangku">
			<tr align='center' bgcolor="#FFFFFF"
				onMouseMove="javascript:this.bgColor='#A2D7B2';"
				onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<td align="center">${cangku.cangku_id}</td>
				<td align="center">
					<a href="kucun?type=kucunMana&caozuo=cangku_goods&cangku_id=${cangku.cangku_id }&cangku_name=${cangku.cangku_name}" 
						class="cangkuName" style="color:blue;">
						${cangku.cangku_name}
					</a>
				</td>
				<td align="center">${cangku.cangku_master}</td>
				<td align="center">${cangku.cangku_tel}</td>
				<td align="center">${cangku.cangku_addr}</td>
				<td align="center" class="cangkuSize">${cangku.cangku_size}</td>
				<td align="center"><c:if test="${cangku.cangku_size<=50}">
						<font color="red">仓库容量即将耗尽</font>
					</c:if> <c:if test="${cangku.cangku_size>50}">
						<font color="black">正常</font>
					</c:if></td>
				<td align="center">
					<c:if test="${sessionScope.userType==0 }">
						<input type="button" onclick="cangkuDel(${cangku.cangku_id})" value="删除" /> &nbsp;&nbsp;
						<input type="button" onclick="cangkuEdit(${cangku.cangku_id})" value="编辑" />
					</c:if>
					<c:if test="${sessionScope.userType==1 }">无权限</c:if>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="8">共 ${requestScope.size } 条记录</td>
		</tr>
	</table>

	<table width='98%' border='0'
		style="margin-top: 8px; margin-left: 5px;">
		<tr>
			<td>
			<c:if test="${sessionScope.userType==0 }">
			<input type="button" class="btn" value="新增仓库" style="width: 80px;height:20px;font-weight:bold;background-color:#A2D7B2;"
				onclick="cangkuAdd()" />
			</c:if>
				<input type="button" class="btn" value="返回"
				style="width: 80px;height:20px;font-weight:bold;background-color:#A2D7B2;" onclick="back()" />
				 <input type="button" class="btn" value="刷新"
				style="width: 80px;height:20px;font-weight:bold;background-color:#A2D7B2;" onclick="refresh()" /></td>
		</tr>
	</table>
	<div id="chart" style="height: 360px; width: 600px;margin-left:300px; margin-top: -20px;"></div>
	<!-- 生成仓库报表 -->
	<!-- 引入echart -->
	<script src="<%=basePath%>echarts-2.2.7/build/dist/echarts.js"></script>
	<!-- 使用echart工具 -->
	<script src="<%=path%>/js/cangku_char.js"></script>
	
</body>
</html>
