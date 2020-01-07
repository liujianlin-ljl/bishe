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
		 <script type="text/javascript" src='<%=path%>/js/jquery-1.8.3.js'></script>
        
        <script language="javascript">
           function getCustomer(){//获取客户
        	   var customer=document.getElementById("customer_id");
           		//alert("点击了下拉客户");
        	   $.ajax({
	                type: "post",//使用post方法访问后台
	                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	                url: "<%=path%>/customer",
	                data: {
	                    'type': "getAllCustomer"
	                },
	                dataType:"json",
	                success: function (data) {
	                	customer.innerHTML="";
	                    //data = decodeURI(data);//防止中文乱码
	                    if (data.length != "" && data.length != null) {
	                       // alert("data.length:"+data.length);
	                        for (var i =0;i<data.length;i++) {
	                            customer.options.add(new Option(data[i].name, data[i].id));
	                        }
	                    }
	                },
	                error: function (XMLHttpRequest, textStatus, errorThrown) {
	                    alert("没有找到客户！！！");
	                }
	            });
           }
           function check()
           {
        	   var customer=document.getElementById("customer_id");
        	   var index=customer.selectedIndex;
               if(document.formAdd.danjuhao.value=="")
               { 
                   alert("请输入单据号");
                   return false;
               }
               if(customer.options[index].value==0){
            	   alert("请先选择客户");
            	   return false;
               }
               document.formAdd.submit();
           }
         //返回 
	        function back(){
	     	   var url="<%=path%>/chuku?type=chukuMana";
	   	   		window.location.href=url;
	      	}
        </script>
        <style type="text/css">
        	input:hover{
       		font-weight:bold;
       		box-shadow: 1px dimgrey;
       		background-color:orange;
       	}
       	table{border-radius: 10px;margin-top:50px;box-shadow:5px 5px 5px 5px;}
        span{color:red;font-size:15px;}
        </style>
	</head>

	<body style="background:url('<%=path %>/img/bg05.jpg');background-size:100%;">
			<form action="<%=path %>/chuku?type=chukuAdd" name="formAdd" method="post">
				     <table width="50%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:70px">
						<tr bgcolor="#E7E7E7" align="center">
							<td height="25" colspan="100" background="<%=path %>/img/wbg.gif">&nbsp;<span style="font:bold 18px '楷体';">填写销售单</span>&nbsp;</td>
						</tr>
						<tr align='center'  onmousemove="javascript:this.bgColor='#CCEED0';" onmouseout="javascript:this.bgColor='#D1DDAA';" height="22">
						    <td width="25%" align="right">
						         单据号：
						    </td>
						    <td width="75%" align="left">
						        <input type="text" name="danjuhao" value="<%=GetID.getUID("C") %>" size="20" readonly />
						    </td>
						</tr>
						<tr align='center' onmousemove="javascript:this.bgColor='#CCEED0';" onmouseout="javascript:this.bgColor='#D1DDAA';" height="22">
						    <td width="25%"  align="right">
						         销售时间：
						    </td>
						    <td width="75%"  align="left">
						        <input name="shijian" type="date" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>"/>
						    </td>
						</tr>
						<tr align='center' onmousemove="javascript:this.bgColor='#CCEED0';" onMouseOut="javascript:this.bgColor='#D1DDAA';">
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
						<tr align='center' onmousemove="javascript:this.bgColor='#CCEED0';" onmouseout="javascript:this.bgColor='#D1DDAA';">
						    <td width="25%" align="right">
						         备注：
						    </td>
						    <td width="75%"  align="left">
						        <input type="text" name="beizhu" size="50" placeholder="请备注内容"/>
						    </td>
						</tr>
						<tr align='center' onmousemove="javascript:this.bgColor='#CCEED0';" onmouseout="javascript:this.bgColor='#D1DDAA';">
						    <td width="25%" align="right">
						         客户：
						    </td>
						    <td width="75%" align="left">
						        <select name="customer_id" id="customer_id" onfocus="getCustomer()">
									  <option value="0">--请选择客户--</option>
								</select>
						    </td>
						</tr>
						<tr align='center' onmousemove="javascript:this.bgColor='#CCEED0';" onmouseout="javascript:this.bgColor='#D1DDAA';">
						    <td width="25%"  align="right">
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
