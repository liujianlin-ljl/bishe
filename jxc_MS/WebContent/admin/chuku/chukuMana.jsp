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
		<script type="text/javascript" src="<%=path %>/js/popup.js"></script>
        <script language="javascript">
           function chukuDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/chuku?type=chukuDel&id="+id;
               }
           }
           
           function chukuAdd()
           {
                 var url="<%=path %>/admin/chuku/chukuAdd.jsp";
				 window.location.href=url;
           }
           function back(){
				var url="<%=path%>/admin/index/sysPro.jsp";
        	   window.location.href=url;
           }
           
           function chukuMingxiAdd(chuku_id)
           {
                var url="<%=path %>/admin/chuku/chukuMingxiAdd.jsp?chuku_id="+chuku_id;
                var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:300});
	            pop.setContent("contentUrl",url);
	            pop.setContent("title","添加销售明细");
	            pop.build();
	            pop.show();
           }
           
           function chukuMingxiMana(chuku_id)
           {
                var url="<%=path %>/chuku?type=chukuMingxiMana&chuku_id="+chuku_id;
                var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:300});
	            pop.setContent("contentUrl",url);
	            pop.setContent("title","查看销售明细");
	            pop.build();
	            pop.show();
           }
       </script>
       <style type="text/css">
       	a:hover{
       		text-decoration: underline;
       		font-weight:bold;
       	}
       	input:hover{
       		font-weight:bold;
       		box-shadow: 2px 2px 2px 2px dimgrey;
       		background-color:orange;
       	}
       </style>
       
	</head>

	<body style="background:url('<%=path %>/img/5cbf1f2b7e13b.jpg');background-size:100%;" >
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="25" colspan="100" background="<%=path %>/img/wbg.gif" >&nbsp;<span style="font:bold 18px '楷体';">销售信息管理</span>&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" style="font:bold 18px '宋体';">
					<td width="15%">单据号</td>
					<td width="15%">销售时间</td>
					<!-- <td width="10%">总金额</td> -->
					<td width="8%">经手人</td>
					<td width="12%">备注</td>
					<td width="10%">客户姓名</td>
					<td width="10%">联系方式</td>
					<td width="20%">明细</td>
					<td width="10%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.chukuList}" var="chuku">
				<tr align='center' bgcolor="#FFFFFF" onmousemove="javascript:this.bgColor='#A2D7B2';" onmouseout="javascript:this.bgColor='#FFFFFF';">
					<td align="center">
						${chuku.danjuhao}
					</td>
					<td align="center">
					   ${chuku.shijian}
					</td>
					<%-- <td bgcolor="#FFFFFF" align="center">
						${chuku.zongjiage}
					</td> --%>
					<td  align="center">
						${chuku.jingshouren}
					</td>
					<td align="center">
					    ${chuku.beizhu}
					</td>
					<td  align="center">
					    ${chuku.customerName}
					</td>
					<td align="center">
					    ${chuku.customerTel}
					</td>
					<td align="center">
					    <a style="color: red" href="#" onclick="chukuMingxiMana(${chuku.id})">销售明细</a>
					    &nbsp;&nbsp;&nbsp; 
					    <c:if test="${sessionScope.userType==0 }">
						    <a style="color: red" href="#" onclick="chukuMingxiAdd(${chuku.id})">添加销售明细</a>
					    </c:if>
					    <c:if test="${sessionScope.userType==1 && chuku.jingshouren eq sessionScope.yuangong.name }">
						    <a style="color: red" href="#" onclick="chukuMingxiAdd(${chuku.id})">添加销售明细</a>
					    </c:if>     
					</td>
					<td align="center">
						<form action="" name="formAdd" method="post">
						   <input type="button" class="del" value="删除" onclick="chukuDel(${chuku.id})"/>
						</form>
					</td>
				</tr>
				</c:forEach>
				<tr>
					<td colspan="7">共 ${requestScope.size } 条记录</td>
				</tr>
			</table>
			
			<table width='20%'  border='0'style="margin-top:8px;margin-left: 10px;">
			  <tr>
			    <td>
			      <input type="button" value="添加" style="width: 80px;" onclick="chukuAdd()" />
			    </td>
			    <td><input type="button" value="返回" style="width:80px;" onclick="back()" /> </td>
			  </tr>
		    </table>
	</body>
</html>
