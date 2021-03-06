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
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/table.css" />
        <script language="javascript">
           function yuangongShenhe(id)
           {
               if(confirm('您确定通过审核该员工吗？'))
               {
                   window.location.href="<%=path %>/yuangong?type=shenhe&id="+id;
               }
           }
          
          //返回 
           function back(){
				var url="<%=path%>/admin/index/sysPro.jsp";
      	   		window.location.href=url;
         }
       </script>
       <style type="text/css">
       	.pn-loperator:hover{
       		font-weight:bold;
       		font-size:12px;
       		text-decoration: underline;
       	}
       	input:hover{
       		font-weight:bold;
       		box-shadow: 2px 2px 2px 2px dimgrey;
       		background-color:#A2D7B2;
       	}
       </style>
       
	</head>

	<body style="background:url('<%=path %>/img/5cbf1f2b7e13b.jpg');background-size:100%;" >
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="22" colspan="100" background="<%=path %>/img/wbg.gif">&nbsp;<span style="font:bold 18px '楷体';">审核员工注册信息&nbsp;</span></td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" style="font:bold 18px '宋体';background-color:#8ACD9E;" >
					<td width="10%">姓名</td>
					<td width="5%">性别</td>
					<td width="6%">年龄</td>
					<td width="10%">电话</td>
					<td width="18%">住址</td>
					<td width="10%">职位</td>
					<td width="15%">状态</td>
					<td width="15%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.yuangongList}" var="yuangong">
				<tr class="tr" align='center' onmousemove="javascript:this.bgColor='#CCEED0';" onmouseout="javascript:this.bgColor='#FFFFFF';">
					<td align="center">
						${yuangong.name}
					</td>
					<td align="center">
						${yuangong.sex}
					</td>
					<td align="center">
					    ${yuangong.age}
					</td>
					<td align="center">
						${yuangong.tel}
					</td>
					<td align="center">
						${yuangong.address}
					</td>
					<td align="center">
					    ${yuangong.zhiwei}
					</td>
					<td align="center">
					  	  待审核
					</td>
					<td  align="center">
						<a href="#" onclick="yuangongShenhe(${yuangong.id})" class="pn-loperator" style="font-size:15px;">通过审核</a>
					</td>
				</tr>
				</c:forEach>
				<tr>
					<td colspan="10">共 ${requestScope.size } 条记录</td>
				</tr>
			</table>
			
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			      <input type="button" value="新增员工" style="width: 80px;" onclick="yuangongAdd()" />
			      <input type="button" value="返回" onclick="back()" />
			    </td>
			  </tr>
		    </table>
	</body>
</html>
