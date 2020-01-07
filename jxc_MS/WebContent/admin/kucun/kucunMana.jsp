<%@ page language="java" pageEncoding="UTF-8" import="com.orm.Cangku"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
		<script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
		<script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
		<script type="text/javascript" src="<%=path %>/js/popup.js"></script>
        <style type="text/css">
         	table .tr:nth-of-type(odd){ 
         		background-color:#CCEED0; 
         	} 
         	table .tr:nth-of-type(even){ 
         		background-color:#FBFFE9; 
         	} 
        	table tr:nth-of-type(2) td{
        		font-size:18px;
        		color:black;
        	}
        	.tr:hover{
        		background-color:#BDD5E1;
        	}
        	.img{
        		width:20px;
        		height:20px;
        		line-height:20px;
        		vertical-align: middle;
        		margin-right:5px;
        	}
        	.title{
        		font:bold 20px '楷体';
        	}
        </style>
        
        <script language="javascript">
	        function submitform(){
				var cangku_id=document.getElementById("cangku_id");
				var index=cangku_id.selectedIndex;
				var cangku_Val=cangku_id.options[index].value;
				//alert(cangku_Val);
				cangku_id.options[index].selected;
				document.getElementById("myform").action="kucun?type=kucunMana&cangku_id="+cangku_Val;
				document.getElementById("myform").submit();
			}
	        //出库价格调整
	        function updatejiage(kucun_id,goodsName,chuku_price){
	        	var url="<%=path %>/admin/kucun/updatejiage.jsp?kucun_id="+kucun_id+"&goodsName="+goodsName+"&chuku_price="+chuku_price;
                var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:300});
	            pop.setContent("contentUrl",url);
	            pop.setContent("title","销售价格调整");
	            pop.build();
	            pop.show();
	        }
	        function refresh(){
	        	window.location.href="<%=path%>/kucun?type=kucunMana&cangku_id=0";
	        }
        </script>
	</head>

	<body style="background:url('<%=path %>/img/5cbf1f2b7e13b.jpg');background-size:100%;">
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr height="26"  background="<%=path %>/img/wbg.gif">
					<td colspan="8">&nbsp;
						<span style="font:bold 18px '楷体';"><%=((Cangku)(request.getAttribute("cangku"))).getCangku_name() %>--库存信息汇总</span>&nbsp;
						--库存剩余容量：
						<%=((Cangku)(request.getAttribute("cangku"))).getCangku_size()%>
					</td>
				</tr>
				<tr>
					<td colspan="8">
						<form action="" id="myform">
							选择汇总仓库：<select name="cangku_id" id="cangku_id"  >
										<option value="0">总仓库</option>
										 <c:forEach items="${sessionScope.cangkuList }" var="cangku">
											   <option value="${cangku.cangku_id }">${cangku.cangku_name }</option>
										 </c:forEach>
								  </select>
								<input type="hidden" name="type" value="kucunMana" />
								<input type="button" value="查 询" onclick="submitform()" style="background:url(<%=path %>/img/right_06.gif);" />&nbsp;&nbsp;
								<input type="button" value="刷新" onclick="refresh()" />
						</form>
					</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" style="height:30px;background-color:#74C38C;">
					<td width="10%" class="title">商品编号</td>
					<td width="10%" class="title">商品名称</td>
					<td width="8%" class="title">库存数量</td>
					<td width="12%" class="title">库存报警(<50)</td>
					<td width="9%" class="title">进货单价:元</td>
					<td width="9%" class="title">销售价格:元</td>
					<td width="8%" class="title">仓库编号</td>
					<td width="12%" class="title">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.kucunList}" var="kucun">
				<tr class="tr" align="center" style="height:25px" bgcolor="#FFFFFF" onmouseover="javascript:this.bgColor='silver';" onmouseout="javascript:this.bgColor='#FFFFFF';" >
					<td  align="center" class="goods_id">${kucun.goods_id}</td>
					<td  align="center" class="goods_name">${kucun.goods_name}</td>
					<td  align="center" class="shuliang">${kucun.kucun}</td>
					<td  align="center">
						<c:if test="${kucun.kucun<50}">
						    <img src="<%=path %>/img/baojing2.png" class="img" alt="图片加载失败" /><font color="red" size="25px">报警</font>
						</c:if>
					</td>
					<td  align="center" class="ruku_price">${kucun.ruku_price}</td>
					<td  align="center" class="chuku_price">${kucun.chuku_price}</td>
					<td  align="center" class="chuku_price">${kucun.cangku_id}</td>
					<td  align="center" class="">
						<c:if test="${sessionScope.userType==0 }">
							<input type="button" value="销售价格调整" onclick="updatejiage(${kucun.kucun_id},'${kucun.goods_name }','${kucun.chuku_price }')" style="background-color:#74C38C" />
						</c:if>
						<c:if test="${sessionScope.userType==1 }">
							无权限
						</c:if>
					</td>
				</tr>
				</c:forEach>
				<tr>
					<td colspan="3">共 ${requestScope.size } 条记录</td>
				</tr>
			</table>
			<div id="chart" style="height:400px;width: 1000px;margin-top:20px;"></div>
			<!-- 生成库存报表 -->
			<!-- 引入echart -->
			<script src="<%=basePath%>echarts-2.2.7/build/dist/echarts.js"></script>
			<!-- 使用echart工具 -->
			<script src="<%=path%>/js/chart.js"></script>
			
	</body>
</html>
