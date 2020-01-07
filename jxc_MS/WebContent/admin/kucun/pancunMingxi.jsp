<%@ page language="java" import="java.util.*,com.util.GetID"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>

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

<link rel="stylesheet" type="text/css" href="<%=path%>/css/base.css" />
<script type="text/javascript" src="<%=path%>/jquery-1.8.3.js"></script>
<script language="javascript">
	 //返回 
	 function back(){
	    var url="<%=path%>/admin/kucun/pancun.jsp";
		window.location.href = url;
	}
</script>
<style type="text/css">
	.span{
		text-decoration: underline;
		color:green;
		font-size:20px;
	}
</style>
</head>

<body style="background:url('<%=path %>/img/5cbf1f2b7e13b.jpg');background-size:100%;">
	<table width="98%" border="0" cellpadding="2" cellspacing="1"
		bgcolor="#D1DDAA" align="center" style="margin-top: 8px">
		<tr bgcolor="#E7E7E7">
			<td height="28" colspan="10" background="<%=path%>/img/wbg.gif"
				style="font: bold 18px '楷体'; text-align: center;">&nbsp;
				商品盘存明细信息：&nbsp;查询条件--&nbsp;商品名称：&nbsp;<span class="span">${requestScope.goodsName }</span>&nbsp;&nbsp;&nbsp;&nbsp;
				仓库：&nbsp;<span class="span">${requestScope.cangkuName }</span>&nbsp;
				<a href="<%=path%>/admin/kucun/pancun.jsp"><img src="<%=path%>/img/syb.gif"/></a>
			</td>
		</tr>
		<tr bgcolor="#E7E7E7">
			<td height="28" colspan="10" >&nbsp;入库明细&nbsp;</td>
		</tr>
		<tr align="center" bgcolor="#FAFAF1" height="22"
			style="font: bold 18px '楷体';">
			<td width="5%">明细编号</td>
			<td width="15%">入库单据号</td>
			<td width="12%">商品名称</td>
			<td width="8%">单价</td>
			<td width="7%">数量</td>
			<td width="8%">金额</td>
			<td width="10%">入库时间</td>
<!-- 			<td width="10%">入库仓库</td> -->
			<td width="15%">备注</td>
		</tr>
		<c:forEach items="${requestScope.rukuMingxiList}" var="rukuMingxi">
			<tr align='center' bgcolor="#FFFFFF"
				onMouseMove="javascript:this.bgColor='#A2D7B2';"
				onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<td  align="center">${rukuMingxi.id}</td>
				<td  align="center">${rukuMingxi.danjuhao}</td>
				<td  align="center">${rukuMingxi.goods_name}</td>
				<td  align="center">${rukuMingxi.danjia}</td>
				<td  align="center" class="ruku_count">${rukuMingxi.shuliang}</td>
				<td  align="center" class="ruku_money">${rukuMingxi.jine}</td>
				<td  align="center">${rukuMingxi.time}</td>
<%-- 				<td  align="center">${rukuMingxi.cangku_name}</td> --%>
				<td  align="center">${rukuMingxi.beizhu}</td>
			</tr>
		</c:forEach>
			<tr align="center" height="30px">
					<td>累计</td>
					<td colspan="6">
						入库总金额：<span id="r_money"></span>元&nbsp;&nbsp;
						入库总数量：<span id="r_shuliang"></span>台&nbsp;&nbsp;
						商品占用仓库空间：<span id="cangku_size"></span>&nbsp;&nbsp;
					</td>
					<td>
						<c:if test="${requestScope.rsize ==0 }"><span style="text-align:center;">没有任何结果</span></c:if>
						<c:if test="${requestScope.rsize !=0 }">共 ${requestScope.rsize } 条记录</c:if>
					</td>
			</tr>
	</table>
	<script type="text/javascript">
		var r_money=0;//总计入库额
		var r_shuliang=0;//总计出库额
		var ruku_money=document.getElementsByClassName("ruku_money");
		var ruku_count=document.getElementsByClassName("ruku_count");
		for(var i=0;i<ruku_money.length;i++){//总计
			r_money+=parseInt(ruku_money[i].innerHTML);
			r_shuliang+=parseInt(ruku_count[i].innerHTML);
		}
		document.getElementById("r_money").innerHTML=r_money;
		document.getElementById("r_shuliang").innerHTML=r_shuliang;
		document.getElementById("cangku_size").innerHTML=r_shuliang;
	</script>
	
	<table width="98%" border="0" cellpadding="2" cellspacing="1"
		bgcolor="#D1DDAA" align="center" style="margin-top: 20px">
		<tr bgcolor="#E7E7E7">
			<td height="28" colspan="10" >&nbsp;出库明细&nbsp;</td>
		</tr>
		<tr align="center" bgcolor="#FAFAF1" height="22"
			style="font: bold 18px '楷体';">
			<td width="5%">明细编号</td>
			<td width="15%">出库单据号</td>
			<td width="12%">商品名称</td>
			<td width="8%">单价</td>
			<td width="7%">数量</td>
			<td width="8%">金额</td>
			<td width="10%">出库时间</td>
			<td width="15%">备注</td>
		</tr>
		<c:forEach items="${requestScope.chukuMingxiList}" var="chukuMingxi">
			<tr align='center' bgcolor="#FFFFFF"
				onMouseMove="javascript:this.bgColor='#A2D7B2';"
				onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<td  align="center">${chukuMingxi.id}</td>
				<td  align="center">${chukuMingxi.danjuhao}</td>
				<td  align="center">${chukuMingxi.goods_name}</td>
				<td  align="center">${chukuMingxi.danjia}</td>
				<td  align="center" class="chuku_count">${chukuMingxi.shuliang}</td>
				<td  align="center" class="chuku_money">${chukuMingxi.jine}</td>
				<td  align="center">${chukuMingxi.time}</td>
<%-- 				<td  align="center">${rukuMingxi.cangku_name}</td> --%>
				<td  align="center">${chukuMingxi.beizhu}</td>
			</tr>
		</c:forEach>
		<tr align="center" height="30px">
			<td>累计</td>
			<td colspan="6">
				出库总金额：<span id="c_money"></span>元&nbsp;&nbsp;
				出库总数量：<span id="c_shuliang"></span>台&nbsp;&nbsp;
				释放仓库空间：<span id="c_size"></span>&nbsp;&nbsp;
			</td>
			<td>
				<c:if test="${requestScope.csize ==0 }"><span style="text-align:center;">没有任何结果</span></c:if>
				<c:if test="${requestScope.csize !=0 }">共 ${requestScope.csize } 条记录</c:if>
			</td>
		</tr>
	</table>
	<script type="text/javascript">
		var c_money=0;//总计入库额
		var c_shuliang=0;//总计出库额
		var chuku_money=document.getElementsByClassName("chuku_money");
		var chuku_count=document.getElementsByClassName("chuku_count");
		for(var i=0;i<chuku_money.length;i++){//总计
			c_money+=parseInt(chuku_money[i].innerHTML);
			c_shuliang+=parseInt(chuku_count[i].innerHTML);
		}
		document.getElementById("c_money").innerHTML=c_money;
		document.getElementById("c_shuliang").innerHTML=c_shuliang;
		document.getElementById("c_size").innerHTML=c_shuliang;
	</script>
</body>
</html>
