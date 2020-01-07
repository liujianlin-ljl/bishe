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
		<script type="text/javascript" src="<%=path %>/js/popup.js"></script>
        <script language="javascript">
           function gongyingshangDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/gongyingshang?type=gongyingshangDel&id="+id;
               }
           }
           
           function gongyingshangAdd()
           {
                 var url="<%=path %>/admin/gongyingshang/gongyingshangAdd.jsp";
				 window.location.href=url;
           }
           function gongyingshangEdit(id,mingcheng,dizhi,lianxiren,dianhua,youbian,chuanzhen,youxiang){
      	    	var url="<%=path %>/admin/gongyingshang/gongyingshangEdit.jsp?id="+id+"&mingcheng="+mingcheng+
      	    	"&dizhi="+dizhi+"&lianxiren="+lianxiren+"&dianhua="+dianhua+"&youbian="+youbian+
      	    	"&chuanzhen="+chuanzhen+"&youxiang="+youxiang;
                var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:300});
	            pop.setContent("contentUrl",url);
	            pop.setContent("title","修改供应商信息");
	            pop.build();
	            pop.show();
           }
           function backIndex(){
        	   window.location.href="<%=path%>/admin/index/sysPro.jsp";
           }
       </script>
       <style>
       		.btn{
       			width: 100px;
       			height:22px;
       			font:bold 18px "宋体";
       		}
       		.btn:hover{background-color:#A2D7B2;border-radius: 10px;}
       </style>
	</head>

	<body style="background:url('<%=path %>/img/bg05.jpg');background-size:100%;">
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" align="center" colspan="8" background="<%=path %>/images/tbg.gif" style="font:bold 20px '宋体';">&nbsp;供应商信息管理&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#A2D7B2" height="26" style="font:bold 20px '楷体';">
					<td width="15%">名称</td>
					<td width="20%">地址</td>
					<td width="8%">联系人</td>
					<td width="10%">电话</td>
					<td width="8%">邮编</td>
					<td width="10%">传真</td>
					<td width="10%">email</td>
					<td width="10%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.gongyingshangList}" var="gongyingshang">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#A2D7B2';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td align="center">
						${gongyingshang.mingcheng}
					</td>
					<td align="center">
						${gongyingshang.dizhi}
					</td>
					<td align="center">
					    ${gongyingshang.lianxiren}
					</td>
					<td align="center">
						${gongyingshang.dianhua}
					</td>
					<td align="center">
						${gongyingshang.youbian}
					</td>
					<td align="center">
					    ${gongyingshang.chuanzhen}
					</td>
					<td align="center">
					    ${gongyingshang.youxiang}
					</td>
					<td align="center">
						<input type="button" onclick="gongyingshangDel(${gongyingshang.id})" value="删除"/>&nbsp;&nbsp;
						<input type="button" onclick="gongyingshangEdit(${gongyingshang.id},
						${gongyingshang.mingcheng},${gongyingshang.dizhi},${gongyingshang.lianxiren},
						${gongyingshang.dianhua},${gongyingshang.youbian},${gongyingshang.chuanzhen},
						${gongyingshang.youxiang})" value="编辑"/>
					</td>
				</tr>
				</c:forEach>
				<tr>
					<td colspan="8">共 ${requestScope.size } 条记录</td>
				</tr>
			</table>
			
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			      <input type="button" value="添  加" class="btn"  onclick="gongyingshangAdd()" />
			      <input type="button" value="返回首页" class="btn"  onclick="backIndex()" />
			    </td>
			  </tr>
		    </table>
	</body>
</html>
