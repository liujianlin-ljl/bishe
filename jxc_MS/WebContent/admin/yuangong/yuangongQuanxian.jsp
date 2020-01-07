<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.util.GetID" %>
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
            function check1()
            {
                if(document.formAdd.loginName.value=="")
                {
                    alert("请输入帐号");
                    return false;
                }
                if(document.formAdd.loginPw.value=="")
                {
                    alert("请输入密码");
                    return false;
                }
                if(document.formAdd.quanxian.value==0)
                {
                    alert("请选择权限");
                    return false;
                }
                //判断账号是否存在
                loginService.login(document.formAdd.loginName.value,document.formAdd.loginPw.value,"1",callback);
                //document.formAdd.submit();
            }
            
            function callback(data)
    		{
    		   
    		    if(data=="no")
    		    {
    		    	document.formAdd.submit();
    		    }
    		    if(data=="yes")
    		    {
    		        alert("抱歉，此账号已存在，请使用其他账号！！！");
    		        window.location.reload();
    		    }
    		    
    		}
            //返回
            function back(){
				var url="<%=path%>/yuangong?type=yuangongMana";
       	   		window.location.href=url;
          }
        </script>
        <style type="text/css">
        	table{border-radius: 10px;margin-top:50px;box-shadow:5px 5px 5px 5px;}
        </style>
	</head>

	<body style="background:url('<%=path %>/img/5cbf1f2b7e13b.jpg');background-size:100%;">
			<form action="<%=path %>/yuangong?type=yuangongQuanxian" name="formAdd" method="post">
				     <table width="48%" height="260" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#D1DDAA">
						<tr bgcolor="#EEF4EA">
					        <td colspan="3" background="<%=path %>/img/wbg.gif" class='title'><span>员工权限</span></td>
					    </tr>
						<tr align='center' bgcolor="#FFFFFF" onmousemove="javascript:this.bgColor='#CCEED0';" onmouseout="javascript:this.bgColor='#D1DDAA';">
						    <td width="25%" align="right">
						         帐号：
						    </td>
						    <td width="75%" align="left">
						        <input type="text" name="loginName" value="<%=GetID.getUserName() %>" size="20"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onmousemove="javascript:this.bgColor='#CCEED0';" onmouseout="javascript:this.bgColor='#D1DDAA';">
						    <td width="25%" align="right">
						         密码：
						    </td>
						    <td width="75%" align="left">
						        <input type="text" name="loginPw" value="000000" size="20"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onmousemove="javascript:this.bgColor='#CCEED0';" onmouseout="javascript:this.bgColor='#D1DDAA';">
						    <td width="25%" align="right">
						         权限：
						    </td>
						    <td width="75%" align="left">
						        <select name="quanxian">
						            <option value="0">--请选择权限--</option>
						            <option value="1">--操作员--</option>
						        </select>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onmousemove="javascript:this.bgColor='#CCEED0';" onmouseout="javascript:this.bgColor='#D1DDAA';" >
						    <td width="25%" align="right">
						        &nbsp;
						    </td>
						    <td width="75%"  align="left">
						       <input type="hidden" name="id" value="<%=request.getParameter("id") %>"/>
						       <input type="button" class="btn" value="提交" onclick="check1()"/>&nbsp; 
						       <input type="reset" class="btn" value="重置"/>&nbsp;
						       <input type="button" class="btn" value="返回" onclick="back()"/>&nbsp;
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
