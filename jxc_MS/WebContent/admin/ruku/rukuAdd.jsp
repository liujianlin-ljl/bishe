<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<%@ page import="com.util.GetID" %>
<jsp:directive.page import="java.text.SimpleDateFormat"/> 

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
         <link rel="stylesheet" type="text/css" href="<%=path%>/css/input.css"/>
         <script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
		 <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
		 <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
		 
		 
        
        <script language="javascript">
           function gongyingshangAll()
		   {
		       var strUrl1 = "<%=path %>/gongyingshang?type=gongyingshangAll";
 				window.open(strUrl1,"","toolbar=yes, location=yes, directories=no, status=no, menubar=yes, scrollbars=yes, resizable=no, copyhistory=yes, width=900, height=500,left=200,top=100");
				//document.getElementById("gongyingshang_id").value=ret1;
		   }
		   
           function check()
           {
               if(document.formAdd.gongyingshang_id.value=="")
               {
                   alert("请选择供应商");
                   return false;
               }
               
               if(document.formAdd.danjuhao.value=="")
               { 
                   alert("请选择单据号");
                   return false;
               }
               document.formAdd.submit();
           }
         //返回 
	        function back(){
	     	   var url="<%=path%>/ruku?type=rukuMana";
	   	   		window.location.href=url;
	      	}
        </script>
         <style type="text/css">
        	table{border-radius: 10px;margin-top:50px;box-shadow:5px 5px 5px 5px;}
        	span{color:red;font-size:15px;}
        </style>
	</head>

	<body style="background:url('<%=path %>/img/bg05.jpg');background-size:100%;" >
			<form action="<%=path %>/ruku?type=rukuAdd" name="formAdd" method="post">
				     <table width="50%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:70px">
						<tr bgcolor="#E7E7E7" align="center">
							<td height="25" colspan="100" background="<%=path %>/img/wbg.gif">&nbsp;<span style="font:bold 18px '楷体';">填写入库单</span>&nbsp;</td>
						</tr>
						<tr align='center'  height="22">
						    <td width="25%"  align="right">
						         供应商：
						    </td>
						    <td width="75%"  align="left">
						    	<input type="hidden" name="gongyingshang_id" id="gongyingshang_id" /> 
						        <input type="text" name="gongyingshang_name" id="gongyingshang_name" readonly="readonly" placeholder="请选择供应商"/>
						        <input type="button" value="选择" onClick="gongyingshangAll()"/>
						    </td>
						</tr>
						<tr align='center'  height="22">
						    <td width="25%"  align="right">
						         单据号：
						    </td>
						    <td width="75%"  align="left">
						        <input type="text" name="danjuhao" value="<%=GetID.getUID("R") %>" size="20" readonly />
						    </td>
						</tr>
						<tr align='center'  height="22">
						    <td width="25%"  align="right">
						         入库时间：
						    </td>
						    <td width="75%"  align="left">
						        <input name="shijian" type="date" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>"/>
						    </td>
						</tr>
						<!-- <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         总金额：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input value="1000" type="text" name="zongjiage" size="20" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
						    </td>
						</tr> -->
						<tr align='center'  height="22">
						    <td width="25%" align="right">
						         经手人：
						    </td>
						    <td width="75%" align="left">
						    	<c:if test="${sessionScope.userType==0}">
							        <input type="text" name="jingshouren" value="系统管理员" size="20"  />
								</c:if>
								<c:if test="${sessionScope.userType==1}">
							        <input type="text" name="jingshouren" value="${sessionScope.yuangong.name}" size="20" readonly />
								</c:if>
						    </td>
						</tr>
						<tr align='center'  height="22">
						    <td width="25%" align="right">
						         备注：
						    </td>
						    <td width="75%" align="left">
						        <input type="text" name="beizhu" size="50" placeholder="请备注内容"/>
						    </td>
						</tr>
						<tr align='center'  height="22">
						    <td width="25%" align="right">
						        &nbsp;
						    </td>
						    <td width="75%" align="left">
						       <input type="button" class="btn" value="提交" onclick="check()"/>&nbsp; 
						       <input type="reset" class="btn" value="重置"/>&nbsp;
						       <input type="button" class="btn" value="返回" onclick="back()" />
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
