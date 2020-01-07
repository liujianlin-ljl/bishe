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
           function shuaxin(){
        	   window.location.href="<%=path %>/ruku?type=findRukuMingxi";
           }
       </script>
	</head>

	<body style="background:url('<%=path %>/img/5cbf1f2b7e13b.jpg');background-size:100%;">
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="28" colspan="10" background="<%=path %>/img/wbg.gif" style="font:bold 18px '楷体';text-align:center;">&nbsp;入库明细管理&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="26" style="font:bold 18px '宋体';">
					<td colspan="10">
						<form action="<%=path %>/ruku">
							<input type="hidden" name="type" value="findRukuMingxi" />
							商品名称：<input type="text" id="goodsName" name="goodsName" size="22" placeholder="输入商品名称" value="${requestScope.goodsName }" />&nbsp;
							单据号：<input type="text" name="danjuhao" size="25" placeholder="输入单据号" value="${requestScope.danjuhao }" />&nbsp;
							单价：<input type="text" name="min"  size="4" value="${requestScope.min }" />&nbsp;-
								<input type="text" name="max"  size="4" value="${requestScope.max }" />&nbsp;
								<input type="submit" value="筛选" />&nbsp;
								<input type="button" value="刷新" onclick="shuaxin()" />
						</form>
					</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22" style="font:bold 18px '楷体';">
					<td width="5%">明细编号</td>
					<td width="15%">入库单据号</td>
					<td width="12%">商品名称</td>
					<td width="8%">单价</td>
					<td width="7%">数量</td>
					<td width="8%">金额</td>
					<td width="10%">入库时间</td>
					<td width="10%">入库仓库</td>
					<td width="15%">备注</td>
					<td width="10%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.rukuMingxiList}" var="rukuMingxi">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#A2D7B2';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td align="center">
						${rukuMingxi.id}
					</td>
					<td align="center">
						${rukuMingxi.danjuhao}
					</td>
					<td align="center">
						${rukuMingxi.goods_name}
					</td>
					<td align="center">
					   ${rukuMingxi.danjia}
					</td>
					<td align="center">
					   ${rukuMingxi.shuliang}
					</td>
					<td align="center">
						${rukuMingxi.jine}
					</td>
					<td align="center">
						${rukuMingxi.time}
					</td>
					<td align="center">
						${rukuMingxi.cangku_name}
					</td>
					<td align="center">
						${rukuMingxi.beizhu}
					</td>
					<td align="center">
						<form action="" name="formAdd" method="post">
							<input type="hidden" name="ruku_id" value="${rukuMingxi.ruku_id }" />
						   <input type="button" value="删除" onclick="rukuMingxiDel(${rukuMingxi.id})"/>
						</form>
					</td>
				</tr>
				</c:forEach>
				<tr>
					<td colspan="6">
						共 ${requestScope.size } 条记录
					</td>
				</tr>
			</table>
	</body>
</html>
