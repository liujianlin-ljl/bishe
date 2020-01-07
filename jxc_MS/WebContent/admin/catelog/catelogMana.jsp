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
		<script type="text/javascript" src="<%=path %>/js/public.js"></script>
		<script type="text/javascript" src="<%=path %>/js/popup.js"></script>
        <script language="javascript">
           function catelogDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/catelog?type=catelogDel&id="+id;
               }
           }
           function stopCatelog(id)
           {
               if(confirm('确定要停产吗？'))
               {
                   window.location.href="<%=path %>/catelog?type=stopCatelog&id="+id;
               }
           }
           function reCatelog(id)
           {
               if(confirm('确定要恢复吗？'))
               {
                   window.location.href="<%=path %>/catelog?type=reCatelog&id="+id;
               }
           }
           	function catelogEdit(catelog_id,catelog_name){
        	    var url="<%=path %>/admin/catelog/catelogEdit.jsp?id="+catelog_id+"&catelogName="+catelog_name;
                var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:300});
	            pop.setContent("contentUrl",url);
	            pop.setContent("title","修改分类名称");
	            pop.build();
	            pop.show();
           }
           	function catelogAdd(){
        	    var url="<%=path %>/admin/catelog/catelogAdd.jsp";
                var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:200});
	            pop.setContent("contentUrl",url);
	            pop.setContent("title","分类录入");
	            pop.build();
	            pop.show();
           }
           
//            function catelogAdd()
//            {
<%--                  var url="<%=path %>/admin/catelog/catelogAdd.jsp"; --%>
// 				 window.location.href=url;
//            }
           function findCatelogByDel(del){
        	   window.location.href="<%=path%>/catelog?type=findCatelogByDel&del="+del;
           }
         //刷新
           function refresh(){
          	 window.location.href="<%=path%>/catelog?type=catelogMana";
           }
       </script>
	</head>

	<body style="background:url('<%=path %>/img/5cbf1f2b7e13b.jpg');background-size:100%;">
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:10px">
				<tr background="<%=path %>/img/wbg.gif">
					<td height="26" colspan="2" >&nbsp;
						<span style="font:bold 18px '楷体';">品牌分类管理</span>&nbsp;
						<input type="button" value="添加新品牌" style="margin-left:50px;width: 80px; height:24px;font-weight:bold;background-color:#A2D7B2;" onclick="catelogAdd()" />
				      	<input type="button" value="刷    新" style="margin-left:20px;width: 80px;background-color:#A2D7B2;height:24px;" onclick="refresh()" />
					</td>
					<td colspan="2">
						<form action="<%=path %>/catelog">&nbsp;&nbsp;&nbsp;&nbsp;
							<select name="del" id="del"  onchange="javascript:findCatelogByDel(this.value);">
								<option value="">选择状态</option>
								<option value="no">正常</option>
								<option value="yes">停产</option>
							</select>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="hidden" name="type" value="findCatelogByName" />
							<input type="text" name="catelog_name" size="20" value="${requestScope.catelog_name }" placeholder="请输入分类名称" />
							<input type="submit" value="查找" style="background-color:#A2D7B2;" />
						</form>
					</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22" style="font:bold 18px '宋体';">
				    <td width="10%">序号</td>
					<td width="30%">名称</td>
					<td width="20%">状态</td>
					<td width="20%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.catelogList}" var="catelog" varStatus="ss">
				<tr align='center' class="tr" bgcolor="#FFFFFF"  onMouseMove="javascript:this.bgColor='#A2D7B2';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td  align="center">
						${ss.index+1}
					</td>
					<td  align="center">
						${catelog.name}
					</td>
					<td  align="center">
						<c:if test="${catelog.del =='no' }">
							<font color="green" size="20">正常</font>
						</c:if>
						<c:if test="${catelog.del =='yes' }">
							<font color="red" size="20">已停产</font>
						</c:if>
					</td>
					<td  align="center" >
						<input type="button" value="删除" onclick="catelogDel(${catelog.id})"/>
						<input type="button" value="编辑" onclick="catelogEdit(${catelog.id},'${catelog.name }')"/>
						<c:if test="${catelog.del =='no' }">
							<input type="button" value="停      产"  onclick="stopCatelog(${catelog.id})" style="width:62px;" />
						</c:if>
						<c:if test="${catelog.del =='yes' }">
							<input type="button" value="恢复正常"  onclick="reCatelog(${catelog.id})" style="width:62px;" />
						</c:if>
					</td>
				</tr>
				</c:forEach>
				<tr>
					<td colspan="3">共 ${requestScope.size } 条记录</td>
				</tr>
			</table>
	</body>
</html>
