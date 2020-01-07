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
           function rukuDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/ruku?type=rukuDel&id="+id;
               }
           }
           
           function rukuAdd()
           {
                 var url="<%=path %>/admin/ruku/rukuAdd.jsp";
				 window.location.href=url;
           }
           function back(){
				var url="<%=path%>/admin/index/sysPro.jsp";
       	   		window.location.href=url;
          }
           
           function rukuMingxiAdd(ruku_id)
           {
                var url="<%=path %>/admin/ruku/rukuMingxiAdd.jsp?ruku_id="+ruku_id;
                var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:300});
	            pop.setContent("contentUrl",url);
	            pop.setContent("title","添加入库明细");
	            pop.build();
	            pop.show();
           }
           
           function rukuMingxiMana(ruku_id)
           {
                var url="<%=path %>/ruku?type=rukuMingxiMana&ruku_id="+ruku_id;
                var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:300});
	            pop.setContent("contentUrl",url);
	            pop.setContent("title","查看入库明细");
	            pop.build();
	            pop.show();
           }
       </script>
	</head>

	<body style="background:url('<%=path %>/img/5cbf1f2b7e13b.jpg');background-size:100%;" >
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="25" colspan="100" background="<%=path %>/img/wbg.gif">&nbsp;<span style="font:bold 18px '楷体';">入库信息管理</span>&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22" style="font:bold 18px '宋体';">
					<td width="15%">供应商</td>
					<td width="15%">单据号</td>
					<td width="15%">入库时间</td>
					<!-- <td width="10%">总金额</td> -->
					<td width="8%">经手人</td>
					<td width="12%">备注</td>
					<td width="15%">明细</td>
					<td width="10%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.rukuList}" var="ruku">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#A2D7B2';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td align="center">
						${ruku.gongyingshang.mingcheng}
					</td>
					<td align="center">
						${ruku.danjuhao}
					</td>
					<td align="center">
					   ${ruku.shijian}
					</td>
					<%-- <td align="center">
						${ruku.zongjiage}
					</td> --%>
					<td align="center">
						${ruku.jingshouren}
					</td>
					<td align="center">
					    ${ruku.beizhu}
					</td>
					<td align="center">
					    <a style="color: red" href="#" onclick="rukuMingxiMana(${ruku.id})">入库明细</a>
					    &nbsp;&nbsp;&nbsp;  
					     <c:if test="${sessionScope.userType==0 }">
						    <a style="color: red" href="#" onclick="rukuMingxiAdd(${ruku.id})">添加入库明细</a>
					    </c:if>
					    <c:if test="${sessionScope.userType==1 && ruku.jingshouren eq sessionScope.yuangong.name }">
						    <a style="color: red" href="#" onclick="rukuMingxiAdd(${ruku.id})">添加入库明细</a>
					    </c:if>         
					</td>
					<td align="center">
						<form action="" name="formAdd" method="post">
						   <input type="button" value="删除" onclick="rukuDel(${ruku.id})"/>
						</form>
					</td>
				</tr>
				</c:forEach>
				<tr>
					<td colspan="7">共 ${requestScope.size } 条记录</td>
				</tr>
			</table>
			
			<table width='20%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			      <input type="button" value="添加" style="width: 80px;" onclick="rukuAdd()" />
			    </td>
			    <td><input type="button" value="返回" style="width:80px;" onclick="back()" /> </td>
			  </tr>
		    </table>
	</body>
</html>
