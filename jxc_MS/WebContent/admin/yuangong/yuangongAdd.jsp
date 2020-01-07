<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
        <script language="javascript">
        </script>
        <style type="text/css">
        	table{border-radius: 10px;margin-top:50px;box-shadow:5px 5px 5px 5px;}
        	span{color:red;font-size:15px;}
        </style>
	</head>

	<body style="background:url('<%=path %>/img/5cbf1f2b7e13b.jpg');background-size:100%;">
			<form action="<%=path %>/yuangong?type=yuangongAdd" name="formAdd" method="post">
				     <table width="48%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" >
						<tr bgcolor="#E7E7E7" style="height:30px;background-color:#74C38C;">
							<td height="14" colspan="100" style="font:bold 20px '宋体';" background="<%=path %>/images/tbg.gif">&nbsp;员工信息录入&nbsp;</td>
						</tr>
						<tr align='center'  onMouseMove="javascript:this.bgColor='#CCEED0';" onMouseOut="javascript:this.bgColor='#D1DDAA';" height="22">
						    <td width="25%" align="right">
						               姓名：
						    </td>
						    <td width="75%" align="left">
						        <input type="text" name="name" size="20"/>&nbsp;<span>*</span>
						    </td>
						</tr>
						<tr align='center'  onMouseMove="javascript:this.bgColor='#CCEED0';" onMouseOut="javascript:this.bgColor='#D1DDAA';" height="22">
						    <td width="25%"  align="right">
						         性别：
						    </td>
						    <td width="75%"  align="left">
						        <input type="radio" name="sex" value="男" checked="checked"/>男
						        &nbsp;&nbsp;&nbsp;&nbsp;
						        <input type="radio" name="sex" value="女"/>女
						    </td>
						</tr>
						<tr align='center'  onMouseMove="javascript:this.bgColor='#CCEED0';" onMouseOut="javascript:this.bgColor='#D1DDAA';" height="22">
						    <td width="25%"  align="right">
						         年龄：
						    </td>
						    <td width="75%"  align="left">
						        <input type="text" name="age" size="20"/>&nbsp;<span>*</span>
						    </td>
						</tr>
						<tr align='center'  onMouseMove="javascript:this.bgColor='#CCEED0';" onMouseOut="javascript:this.bgColor='#D1DDAA';" height="22">
						    <td width="25%"  align="right">
						         电话：
						    </td>
						    <td width="75%"  align="left">
						        <input type="text" name="tel" size="20"/>&nbsp;<span>*</span>
						    </td>
						</tr>
						<tr align='center'  onMouseMove="javascript:this.bgColor='#CCEED0';" onMouseOut="javascript:this.bgColor='#D1DDAA';" height="22">
						    <td width="25%"  align="right">
						        住址：
						    </td>
						    <td width="75%"  align="left">
						        <input type="text" name="address" size="20"/>&nbsp;<span>*</span>
						    </td>
						</tr>
						<tr align='center'  onMouseMove="javascript:this.bgColor='#CCEED0';" onMouseOut="javascript:this.bgColor='#D1DDAA';" height="22">
						    <td width="25%"  align="right">
						        职位：
						    </td>
						    <td width="75%"  align="left">
						        <input type="text" name="zhiwei" size="20" value="员工" readonly/>&nbsp;
						        <span>*</span>
						    </td>
						</tr>
						<tr align='center'  onMouseMove="javascript:this.bgColor='#CCEED0';" onMouseOut="javascript:this.bgColor='#D1DDAA';" height="22">
						    <td width="25%"  align="right">
						        &nbsp;
						    </td>
						    <td width="75%" align="left">
						    	<input type="hidden" value="0" name="quanxian"  />
								<input type="hidden" value="no" name="del"  />
								<input type="hidden" value="add" name="caozuo"  />
						        <input type="submit" class="btn" value="提交"/>&nbsp; 
						        <input type="reset" class="btn" value="重置"/>&nbsp;
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
