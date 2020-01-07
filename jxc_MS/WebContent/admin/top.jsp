<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<style type="text/css">
			body {
				margin-left: 0px;
				margin-top: 0px;
				margin-right: 0px;
				margin-bottom: 0px;
				background:linear-gradient(to top,#FFFFFF, #74C38C);
			}

			.STYLE1 {
				font-size: 12px
			}

			.STYLE2 {
				color: #03515d;
				font-size: 12px;
			}

			a:link {
				font-size: 12px;
				text-decoration: none;
				color: #000000;
			}

			a:visited {
				font-size: 12px;
				text-decoration: none;
				color: #000000;
			}

			a:hover {
				font-size: 12px;
				text-decoration: none;
				color: #FF0000;
			}

			a.v1:link {
				font-size: 12px;
				text-decoration: none;
				color: #03515d;
			}

			a.v1:visited {
				font-size: 12px;
				text-decoration: none;
				color: #03515d;
			}
			.name,.name a{
				font:bold 18px "楷体";
/* 				font-weight: bold; */
/* 				font-family: "楷体"; */
			}
			#clock{
				font-family: "楷体";
			}
			#titleicon{
				display: inline-block;
				width: 50px;
				height: 44px;
				margin-left:20px;
				line-height: 44px;
				vertical-align: middle;
				background: url(../img/titleicon.png) no-repeat;
				background-size: 100%;
				border-radius: 15px 20px 20px 15px;
			}
			#title{
				display: inline-block;
				background-color: #3FBDB1;
				color: white;
				width: 330px;
				height: 40px;
				line-height: 40px;
				vertical-align: middle;
				border-radius: 10px 50px 50px 10px;
			}
		</style>
		<script type="text/javascript">
			function logout() {
				if (confirm("确定要退出本系统吗??")) {
					window.parent.location = "<%=path %>/admin?type=exit";
				}
			}
		</script>
	</head>

	<body>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="26" background="<%=path %>/img/main_03.gif">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="227" height="26" background="<%=path %>/img/main_01.gif">
									&nbsp;
								</td>
								<td>
									&nbsp;
								</td>
								<td width="60">
									<img src="<%=path %>/img/main_05.gif" width="60" height="26" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="64">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="55%" valign="top" height="64" background="<%=path %>/img/main_06.gif" nowrap="nowrap">
									<table>
										<tr height="8">
											<td></td>
										</tr>
										<tr>
											<td>&nbsp;&nbsp;&nbsp;</td>
											<td>
												<font style="font:bold 25px '楷体';">
													<span id="titleicon"></span><span id="title">笔记本电脑进销存管理系统</span>
												</font>
											</td>
										</tr>
									</table>
								</td>
								<td width="45%" valign="top" height="64" background="<%=path %>/img/main_066.gif" nowrap="nowrap">
									<table>
										<tr height="8">
											<td></td>
										</tr>
										<tr>
											<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
											<td>
												<div style="font-size: 18px;">
													<c:if test="${sessionScope.userType==0}">
														欢迎您：<span class="name">系统管理员</span>
													</c:if>
													<c:if test="${sessionScope.userType==1}">
														欢迎您：<span class="name"><a href="<%=path %>/admin/userinfo/myInfo.jsp" target='I2'>${sessionScope.yuangong.name}</a> </span>
													</c:if>
													&nbsp;&nbsp;
													<SCRIPT>
														setInterval("clock.innerHTML=new Date().toLocaleString()+'&nbsp;&nbsp;'+''.charAt(new Date().getDay());",
															1000)
													</SCRIPT><SPAN id="clock"></SPAN>&nbsp;&nbsp;&nbsp;
													<a href="#" style="font-size: 17px;" onclick="logout()">注销系统</a>&nbsp;&nbsp;
												</div>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</body>
</html>
