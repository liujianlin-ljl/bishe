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
		<link rel="stylesheet" type="text/css" href="<%=path%>/css/input.css"/>
		<script type="text/javascript" src="<%=path %>/js/popup.js"></script>
        <script language="javascript">
           function goodsDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/goods?type=goodsDel&id="+id;
               }
           }
           function goodsAdd(){
       	    	var url="<%=path %>/admin/goods/goodsAdd.jsp";
                var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:300});
	            pop.setContent("contentUrl",url);
	            pop.setContent("title","商品录入");
	            pop.build();
	            pop.show();
          }
           function goodsEdit(id){
       	    	var url="<%=path %>/goods?type=goodsSingle&id="+id;
                var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:300});
	            pop.setContent("contentUrl",url);
	            pop.setContent("title","商品修改");
	            pop.build();
	            pop.show();
          }
//            function goodsAdd()
//            {
<%--                  var url="<%=path %>/admin/goods/goodsAdd.jsp"; --%>
// 				 window.location.href=url;
//            }
//            function goodsEdit(id)
//            {
<%--                  var url="<%=path %>/goods?type=goodsSingle&id="+id; --%>
// 				 window.location.href=url;
//            }
         //刷新
           function refresh(){
          	 window.location.href="<%=path%>/goods?type=goodsMana";
           }
       </script>
       <style type="text/css">
        	table tr td:first-child { 
 			font-size: 12px; 
 		} 
/* 		.tr2{ */
/* 			font-size:16px; */
/* 		} */
       </style>
	</head>

	<body style="background:url('<%=path %>/img/5cbf1f2b7e13b.jpg');background-size:100%;">
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td colspan="2" background="<%=path %>/images/tbg.gif" style="line-height:0px;">&nbsp;
						<span style="margin:0px;display:block;background:url('<%=path%>/img/goodsbg.png');width:132px;height:40px;"></span>&nbsp;
					</td>
					 <td colspan="7">
					 <form action="<%=path %>/goods?type=goodsSearch" name="form1" method="post">
				         <input type="text" name="name" size="20" placeholder="请输入商品名称" style="background-color:#A2D7B2;"/>
				         &nbsp;
				         <input type="submit" class="btn" value="查询"/>
				         &nbsp; 
				         <input type="button" class="btn" value="新增商品" style="width: 80px;" onclick="goodsAdd()" />&nbsp;
				         <input type="button" class="btn" value="刷新" onclick="refresh();" />
			         </form>
			    </td>
				</tr>
				<tr align="center" height="22" style="font:bold 18px '宋体';background-color:#8ACD9E;">
					<td width="13%">商品编号</td>
					<td width="8%">品牌</td>
					<td width="14%">名称</td>
					<td width="8%">价格:元</td>
					<td width="15%">产地</td>
					<td width="5%">单位</td>
					<td width="8%">规格</td>
					<td width="8%">备注</td>
					<td width="10%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.goodsList}" var="goods">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#A2D7B2';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td align="center" >
						${goods.id}
					</td>
					<td align="center" class="tr2">
						${goods.catelog_name}
					</td>
					<td align="center" class="tr2">
						${goods.name}
					</td>
					<td align="center"  class="tr2">
						${goods.danjia}
					</td>
					<td align="center" class="tr2">
						${goods.chandi}
					</td>
					<td align="center" class="tr2">
					    ${goods.danwei}
					</td>
					<td align="center" class="tr2">
						${goods.guige}
					</td>
					<td align="center" class="tr2">
						${goods.beizhu}
					</td>
					<td align="center" class="tr2">
						<form action="<%=path %>/admin/goods/goodsEditPre.jsp" name="formAdd" method="post">
						     <input type="button" value="删除" onclick="goodsDel('${goods.id}')"/>
						     <input type="button" value="编辑" onclick="goodsEdit('${goods.id}')"/>
						</form>
					</td>
				</tr>
				</c:forEach>
				<tr>
			    <td colspan="7">
			        共 ${requestScope.size } 条记录
			    </td>
			  </tr>
			</table>
	</body>
</html>
