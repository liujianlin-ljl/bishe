<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.orm.Cangku"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
	<title>查询统计</title>
	<style type="text/css">
		.table1 .tr{
/* 			background-color:silver; */
/* 			opacity: 0.5; */
/* 			background:url(tab_bg.gif); */
		}
		.table2{
			width:500px;
		}
		.table3,.table4{
			width:250px
		}
		.table2 tr td{
			width:300px;
		}
		.table2 tr:nth-of-type(odd){
 			background-color:#A2D7B2;
		}
		.table3 tr:nth-of-type(odd){
 			background-color:#A2D7B2;
		}
		.table4 tr:nth-of-type(odd){
 			background-color:#A2D7B2;
		}
		
		input,select{
			width:60px;
			height:25px;
			font:bold 15px "宋体";
			border-radius: 5px;
		}
		
	</style>
	
	<script type="text/javascript">
		function submitform(){
			//选择年份
			var year=document.getElementById("year");
			var index=year.selectedIndex;
			var yearVal=year.options[index].value;
			//选择仓库
// 			var cangku=document.getElementById("cangku_id");
// 			var index2=cangku.selectedIndex;
// 			var cangku_name=cangku.options[index2].text;
// 			alert(cangku_name);
			document.getElementById("myform").action="selectTongji?year="+yearVal;
			document.getElementById("myform").submit();
		}
	
	</script>
	
	</head>
<body style="background:url('<%=path %>/img/5cbf1f2b7e13b.jpg');background-size:100%;">
<form action="/selectTongji"  id="myform">
	<table width="1000" border="0" cellpadding="0" cellspacing="0" bgcolor="#D1DDAA" align="center" style="margin-top:20px" class="table1">
				<tr background="<%=path %>/img/login-content-bg.gif"  >
					<td height="40" colspan="2" >&nbsp;<strong style="font-size:18px;">
						<%=request.getAttribute("cangku_name") %> 
						<%=request.getAttribute("year") %>年月统计查询结果</strong>&nbsp;
					</td>
					<td colspan="2">
						选择仓库:<select name="cangku_id" id="cangku_id" style="width:90px;"  >
										<option value="0">总仓库</option>
										 <c:forEach items="${sessionScope.cangkuList }" var="cangku">
											   <option value="${cangku.cangku_id }" >${cangku.cangku_name }</option>
										 </c:forEach>
								  </select>
						<span>选择年份：</span>
							<select name="year" id="year" style="width:90px;text-align:center;background:url(<%=path %>/img/right_10.gif);">
								<option value="2017">2016年</option>
								<option value="2017">2017年</option>
								<option value="2018">2018年</option>
								<option value="2019" selected>2019年</option>
								<option value="2020">2020年</option>
							</select>	
							<input type="button" value="查 询" onclick="submitform()" style="background:url(<%=path %>/img/right_06.gif);" />
					</td>
					
				</tr>
				<tr align="center" background="<%=path %>/img/wbg.gif" style="height:35px; width:300px;font:bold 18px '楷体';">
					<td width="10%">月份</td>
					<td width="10%">入库总额（元）</td>
					<td width="5%">出库总额（元）</td>
					<td width="5%">利润（元）</td>
		        </tr>
				<tr class="tr" align="center" height="60px"  style="background-color:#BDD5E1;">
						<td colspan="2" align="center"  width="1000px" >
							<table class="table2" width="1000px" cellpadding="0" cellspacing="0">
								<c:forEach items="${requestScope.tongjiRukuList}" var="ruku"> 
								<tr align="center" style="width:500px;height:25px;">
									<td align="center" >${ruku.month}</td>
									<td align="center" class="ruku_money" >${ruku.money}</td>
								</tr>
								</c:forEach>
							</table>
						</td>
						<td align="center">
							<table width="100px" class="table3" cellpadding="0" cellspacing="0">
								<c:forEach items="${requestScope.tongjiChukuList}" var="chuku"> 
								<tr align="center" style="height:25px;">
									<td align="center" class="chuku_money" >${chuku.money}</td>
								</tr>
								</c:forEach>
							</table>
						</td>
						<td>
							<table class="table4" cellpadding="0" cellspacing="0">
							<!-- 统计利润 -->
								<c:forEach items="${requestScope.moneyList}" var="lirun"> 
								<tr align="center" style="height:25px;">
									<td colspan="2" class="lirun_money">${lirun.money}</td>
								</tr>
								</c:forEach>
							</table>
						</td>
					</tr>
					<tr align="center" height="40px">
						<td>总计</td>
						<td id="r_money"></td>
						<td id="c_money"></td>
						<td id="l_money"></td>
					</tr>
			</table>
</form>
<div id="tongji_chart" style="height:400px;width: 1000px;margin-top:20px;"></div>
<script src="<%=basePath%>echarts-2.2.7/build/dist/echarts.js"></script>
<script src="<%=path%>/js/tongjiChart.js"></script>
	<script type="text/javascript">
		var r_money=0;//总计入库额
		var c_money=0;//总计出库额
		var l_money=0;//总计利润额
		var ruku_money=document.getElementsByClassName("ruku_money");
		var chuku_money=document.getElementsByClassName("chuku_money");
		var lirun_money=document.getElementsByClassName("lirun_money");
		for(var i=0;i<ruku_money.length;i++){//总计
			r_money+=parseInt(ruku_money[i].innerHTML);
			c_money+=parseInt(chuku_money[i].innerHTML);
			l_money+=parseInt(lirun_money[i].innerHTML);
		}
		document.getElementById("r_money").innerHTML=r_money;
		document.getElementById("c_money").innerHTML=c_money;
		document.getElementById("l_money").innerHTML=l_money;
	</script>
</body>
</html>