<%@ page language="java" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css" href="<%=path%>/css/table.css" />
<title>员工查看审核状态</title>
</head>

<body
	style="background:url('<%=path%>/img/bg05.jpg');background-size:100%;">
	<table width="80%" border="0" cellpadding="2" cellspacing="1"
		bgcolor="#D1DDAA" align="center" style="margin-top: 50px">
		<tr bgcolor="#E7E7E7">
			<td height="22" align="center" colspan="100" background="<%=path%>/img/wbg.gif">&nbsp;<span
				style="font: bold 18px '楷体';">我的审核&nbsp;</span></td>
		</tr>
		<tr align="center" bgcolor="#FAFAF1"
			style="font: bold 18px '宋体'; background-color: #8ACD9E;">
			<td width="10%">姓名</td>
			<td width="5%">性别</td>
			<td width="5%">年龄</td>
			<td width="8%">电话</td>
			<td width="10%">住址</td>
			<td width="8%">职位</td>
			<td width="10%">审核状态</td>
			<c:if test="${requestScope.yuangong.del =='no' }">
				<td width="8%">权限</td>
				<td width="8%">登录账号</td>
				<td width="8%">登录密码</td>
			</c:if>
		</tr>
		<tr class="tr" align='center'
			onmousemove="javascript:this.bgColor='#CCEED0';"
			onmouseout="javascript:this.bgColor='#FFFFFF';">
			<td align="center">${requestScope.yuangong.name}</td>
			<td align="center">${requestScope.yuangong.sex}</td>
			<td align="center">${requestScope.yuangong.age}</td>
			<td align="center">${requestScope.yuangong.tel}</td>
			<td align="center">${requestScope.yuangong.address}</td>
			<td align="center">${requestScope.yuangong.zhiwei}</td>
			<c:if test="${requestScope.yuangong.del =='no' }">
				<td align="center">已通过审核</td>
				<td align="center">
				<c:if
						test="${requestScope.yuangong.quanxian ==1 }">操作员
				</c:if>
				<c:if
						test="${requestScope.yuangong.quanxian ==0 }">普通员工
				</c:if></td>
				<td align="center">
				<c:if
						test="${empty requestScope.yuangong.loginName  }">待分配
				</c:if> 
				<c:if
						test="${not empty requestScope.yuangong.loginName }">${requestScope.yuangong.loginName }
				</c:if>
				</td>
				<td align="center"><c:if
						test="${empty requestScope.yuangong.loginPw  }">待分配</c:if> <c:if
						test="${not empty requestScope.yuangong.loginPw }">${requestScope.yuangong.loginPw }</c:if>
				</td>
			</c:if>
			<c:if test="${requestScope.yuangong.del =='yes' }">
				<td align="center">等待审核</td>
			</c:if>
		</tr>
		<tr>
			<td colspan="10"><a href="<%=path%>/login.jsp">前往登录</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="<%=path%>/admin/yuangong/yuangongReg.jsp">返回</a></td>
		</tr>
	</table>

</body>
</html>
