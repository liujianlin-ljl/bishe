<%@ page language="java" import="java.util.*,com.util.GetID" pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" type="text/css" href="<%=path%>/css/input.css"/>
        <script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
		<script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
        <script language="javascript">
           var i=0;
           function catelogAll()
           {
               if(i==0)
               {
                   document.getElementById("indicator").style.display="block";
                   loginService.catelogAll(callback);
                   i=1;
               }
               
           }
           function callback(data)
           {
               document.getElementById("indicator").style.display="none";
               DWRUtil.addOptions("catelog_id",data,"id","name");
           }
           
           function check()
           {
               if(document.formAdd.catelog_id.value==0)
               { 
                   alert("请选择类别");
                   return false;
               }
               return true;
           }
        </script>
        <style>
        	span{font-size:16px;color:red;}
        </style>
	</head>

	<body style="background:url('<%=path %>/img/5cbf1f2b7e13b.jpg');background-size:100%;">
			<form action="<%=path %>/goods?type=goodsAdd" name="formAdd" method="post">
				     <table width="96%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<!-- 						<tr bgcolor="#E7E7E7"> -->
<!-- 							<td height="14" colspan="100">&nbsp;商品信息录入&nbsp;</td> -->
<!-- 						</tr> -->
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#A2D7B2';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%"  align="right">
						         类别：
						    </td>
						    <td width="75%"  align="left">
						        <table border="0">
							           <tr> 
							               <td>  
							                  <select name="catelog_id" id="catelog_id" onclick="catelogAll()">
									              <option value="0">请选择类别</option>
									          </select>
							               </td>
							               <td>
							                  <img id="indicator" src="<%=path %>/img/loading.gif" style="display:none"/>
							               </td>
							           </tr>
							    </table>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#A2D7B2';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" align="right">
						         名称：
						    </td>
						    <td width="75%"  align="left">
						        <input type="text" name="name" size="20" placeholder="请输入商品名称" />&nbsp;
						        <span>*</span>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#A2D7B2';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" align="right">
						         价格：
						    </td>
						    <td width="75%"  align="left">
						        <input type="text" name="danjia" size="20" placeholder="请输入商品价格" />&nbsp;
						        <span>*</span>
						    </td>
						</tr>
						<tr align='center' onMouseMove="javascript:this.bgColor='#A2D7B2';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%"  align="right">
						         产地：
						    </td>
						    <td width="75%"  align="left">
						        <input type="text" name="chandi" size="20" placeholder="请输入产地" />
						        <span>*</span>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#A2D7B2';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%"  align="right">
						         单位：
						    </td>
						    <td width="75%"  align="left">
						        <input type="text" name="danwei" size="20" placeholder="请输入单位"/>
						        <span>*</span>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#A2D7B2';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%"  align="right">
						         规格：
						    </td>
						    <td width="75%" align="left">
						        <input type="text" name="guige" size="20" placeholder="请输入规格"/>
						        <span>*</span>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#A2D7B2';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" align="right">
						         备注：
						    </td>
						    <td width="75%" align="left">
						        <input type="text" name="beizhu" size="50" placeholder="输入备注内容"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#A2D7B2';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" align="right">
						        &nbsp;
						    </td>
						    <td width="75%" align="left">
						    	<input type="hidden" name="id" value="<%=GetID.getGoodsId() %>"  />
						        <input type="submit" class="btn" value="提交" onclick="return check()"/>&nbsp; 
						        <input type="reset" class="btn" value="重置"/>&nbsp;
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
