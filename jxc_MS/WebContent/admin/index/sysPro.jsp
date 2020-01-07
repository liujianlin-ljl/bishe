<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title></title>
		<style>
			#container {
				width: 560px;
				/* border: 1px solid black; */
			}
			dl {
				width: 560px;
				margin-top: 0px;
				margin-left: 20px;
				/* border: 1px solid red; */
			}
			dl dt {
				margin-left: 10px;
				font: bold 18px "楷体";
				line-height: 30px;
			}
			dl dt dd{
				line-height:20px;
			}
			h2 {
				width: 560px;
				font: bold 28px "楷体";
				text-align: center;
			}
		</style>
		<title>系统操作主页</title>
	</head>
	<body style="background:url('<%=path %>/img/5cbf1f2b7e13b.jpg');background-size:100%;">
		<table width="600px" border="0" cellpadding="0" cellspacing="0">
			<!-- 头部开始 -->
			<tr>
				<!--第一行左边框-->
				<td valign="middle" background="<%=path %>/img/mail_left_bg.gif">&nbsp;</td>
				<!--第一行中间内容-->
				<td valign="top" bgcolor="#F7F8F9">
					<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
						<!-- 空白行-->
						<tr>
							<td colspan="2" valign="top">&nbsp;</td>
							<td>&nbsp;</td>
							<td valign="top">&nbsp;</td>
						</tr>
						<!--**********这里是内容**********-->
						<tr>
							<!--左边内容-->
							<td colspan="2" rowspan="3" valign="top" >
								<h2>欢迎使用笔记本电脑进销存管理系统</h2>
								<img src="<%=path %>/img/ts.gif" width="16" height="16" style="margin-left:10px;"> 提示：本系统为进销存管理系统，主要功能为
								 <div id="container">
									&nbsp;&nbsp;&nbsp;&nbsp;
									<dl>
										<dt>1、基本信息管理模块</dt>
											<dd>员工信息管理、员工权限分配</dd>
											<dd>商品信息管理、品牌管理</dd>
											<dd>供应商信息管理</dd>
										<dt>2、仓库管理模块：总仓库、各分仓库</dt>
										<dt>3、进货管理模块：入库单管理、入库明细管理</dt>
										<dt>4、销售管理模块</dt>
											<dd>销售单管理</dd>
											<dd>销售销售明细</dd>
											<dd>客户管理</dd>
										<dt>5、库存管理模块：库存信息汇总、盘点库存</dt>
										<dt>6、查询统计模块：月入库额、销售额、利润额</dt>
										<dt>7、系统管理模块：修改密码</dt>
								</dl>
								</div>
							</td>
							<!--间隔
							<!--右边内容-->
							<td width="40%" valign="top">
								<table width="100%" height="150" border="0" cellpadding="0" cellspacing="0" style="border: 2px solid #CCCCCC;border-radius: 10px;background:linear-gradient(to top,#FFFFFF, #74C38C);box-shadow: 2px 2px 5px 5px;">
									<tr align="center">
										<td width="93%" height="30" background="<%=path %>/img/news_title_bg.gif" class="left_bt" style="font:bold 20px '楷体';background:linear-gradient(to left,#FFFFFF, #74C38C);">笔记本销量排行榜</td>
									</tr>
									<tr>
										<td>
											<table width="475" border="0">
												<tr align="center" style="font-weight: bold;">
													<td width="5%">排名</td>
													<td width="15%">品牌</td>
													<td width="20%">型号</td>
													<td width="15%">年销量:台</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td height="100" valign="top" id="news" width="100%">

											<marquee direction="up" scrollamount="2" vspace="30px" width="475px" height="100px" onmouseout="this.start()"
											 onmouseover="this.stop()">
												<table width="475">
													<c:forEach items="${sessionScope.xiaoliangList }" var="xiaoliang">
														<tr align="center">
															<td width="5%">${xiaoliang.id }</td>
															<td width="15%">${xiaoliang.catelogName }</td>
															<td width="20%">${xiaoliang.goodsName }</td>
															<td width="15%">${xiaoliang.xiaoLiang }</td>
														</tr>
													</c:forEach>
												</table>
											</marquee>

										</td>
									</tr>
									<tr>
										<td height="5" colspan="2">&nbsp;</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr height="20">
							<td colspan="2" valign="top">&nbsp;</td>
							<td>&nbsp;</td>
							<td valign="top">&nbsp;</td>
						</tr>
						<!--第二行-->
						<tr>
							<td valign="top">
								<table width="100%" height="230" border="0" cellpadding="0" cellspacing="0" style="border: 2px solid #CCCCCC;background:linear-gradient(to bottom,#FFFFFF, #74C38C);border-radius: 10px;box-shadow: 2px 2px 5px 5px;">
									<tr align="center" style="background:url(<%=path %>/img/news_title_bg.gif)">
										<td width="93%" height="30" background="<%=path %>/img/news_title_bg.gif" class="left_bt" style="font:bold 20px '楷体';background:linear-gradient(to right,#FFFFFF, #74C38C);">员工业绩排行榜</td>
									</tr>
									<tr>
										<td>
											<table width="475" border="0" style="font-weight: bold;">
												<tr align="center">
													<td width="5%">排名</td>
													<td width="8%">员工编号</td>
													<td width="15%">姓名</td>
													<td width="15%">业绩(销售额):元</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td height="102" valign="top">
											<marquee direction="up" scrollamount="2" vspace="30px" width="475px" height="100px" onmouseout="this.start()"
											 onmouseover="this.stop()">
												<table width="475" border="0">
													<c:forEach items="${sessionScope.yejiList }" var="yeji">
														<tr align="center">
															<td width="5%">${yeji.id }</td>
															<td width="8%">${yeji.yuangongId }</td>
															<td width="15%">${yeji.name }</td>
															<td width="15%">${yeji.yeji }</td>
														</tr>
													</c:forEach>
												</table>
											</marquee>
										</td>
									</tr>
									<tr>
										<td height="5" colspan="2">&nbsp;</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td height="40" colspan="4">
								<table width="100%" border="0" cellpadding="0" cellspacing="0" >
									<tr>
										<td><p style="font:bold 18px '宋体';line-height:40px; ">权限说明：本系统主要为系统管理员和操作员两个身份，两者权限不同</p></td>
									</tr>
									<tr>
										<td height="50">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;如果你的身份是操作员，你将有进行基础信息管理操作(如品牌管理，商品信息管理等)、进货管理、销售管理以及查看仓库信息的权限</td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;如果你的身份是系统管理员，你将有进行基础信息管理操作(如品牌管理，商品信息管理等)、进货管理(入库单，入库明细)、销售管理(如销售单，销售明细和客户的管理)、库存管理、仓库管理以及查询统计模块的权限</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td width="2%">&nbsp;</td>
							<td width="51%" class="left_txt">
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
					</table>
				</td>
				<td background="<%=path %>/img/mail_right_bg.gif">&nbsp;</td>
			</tr>
			<!-- 底部部分 -->
			<tr>
				<td valign="bottom" background="img/mail_left_bg.gif">
					<img src="<%=path %>/img/buttom_left.gif" width="17" height="17" />
				</td>
				<td background="<%=path %>/img/buttom_bgs.gif">
					<img src="<%=path %>/img/buttom_bgs.gif" width="17" height="17">
				</td>
				<td valign="bottom" background="img/mail_right_bg.gif">
					<img src="<%=path %>/img/buttom_right.gif" width="16" height="17" />
				</td>
			</tr>
		</table>
	</body>