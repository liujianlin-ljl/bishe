<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
		<script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
        <script type='text/javascript' src='<%=path %>/js/chukuMingxi.js'></script>
        <script type="text/javascript" src='<%=path%>/js/jquery-1.8.3.js'></script>
        <script type="text/javascript">
        function chooseGoods(goods_id){
        	var danjia=document.getElementById("danjia");
        	var shuliang=document.getElementById("shuliang");
        	var beizhu=document.getElementById("beizhu");
        	var cangku=document.getElementById("cangku_id");
        	var goodsKucun=document.getElementById("goodsKucun");
        	var index=cangku.selectedIndex;
        	var cangku_id=cangku.options[index].value;
        	if(cangku_id==0){
        		alert("请先选择仓库");
        		return false;
        	}else{
        		$.ajax({
                    type: "get",//使用post方法访问后台
                    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                    url: "<%=path%>/kucun",
                    data: {
                        'type': "getdanjia",
                        'goodsId':goods_id,
                        'cangkuId':cangku_id
                    },
                    dataType:"json",
                    success: function (data) {
                    	//alert(data.price);
                        //data = decodeURI(data);//防止中文乱码
                        goodsKucun.innerHTML="库存剩余："+data.kucun;
                        if(data.kucun==0){
                        	goodsKucun.style.color="red";
                        }
                        danjia.value=data.price;
                        shuliang.value=data.kucun;
                        beizhu.value="出库成功，单价:"+data.price+"元";
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("单价有误");
                    }
                });
        	}
        }
        
        function check() {
        	var danjia=document.getElementById("danjia");
        	var shuliang=document.getElementById("shuliang");
        	if (document.formAdd.goods_id.value == 0) {
        		alert("请选择货品");
        		return false;
        	}
        	if(danjia.value==0){
        		alert("此商品还未设置出库价格，无法完成出库，请等待管理员操作");
        		return false;
        	}
        	if(shuliang.value==0){
        		alert("出库数量不能为0！");
        		return false;
        	}
        	return true;
        }
        </script>
	</head>

	<body>
			<form action="<%=path %>/chuku?type=chukuMingxiAdd" name="formAdd" method="post">
				   <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
				     <tr align='center' bgcolor="#FFFFFF" onmousemove="javascript:this.bgColor='silver';" onmouseout="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" align="right">
						         仓库：
						    </td>
						    <td width="75%" align="left">
						        <table border="0">
							           <tr> 
							               <td>  
							                  <select name="cangku_id" id="cangku_id" onchange="catelogAll(this.value)">
									              <option value="0">--请选择仓库--</option>
									              <c:forEach items="${sessionScope.cangkuList }" var="cangku">
										              <option value="${cangku.cangku_id }">${cangku.cangku_name }</option>
									              </c:forEach>
									          </select>
							               </td>
							               <td>
							                  <img id="indicator" src="<%=path %>/img/loading.gif" style="display:none"/>
							               </td>
							           </tr>
							    </table>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onmousemove="javascript:this.bgColor='gray';" onmouseout="javascript:this.bgColor='#FFFFFF';" >
						    <td width="25%"  align="right">
						         分类：
						    </td>
						    <td width="75%" align="left">
						        <table border="0">
							           <tr> 
							               <td>  
							                  <select name="catelog_id" id="catelog_id"  onchange="goodsAll(this.value)">
									              <option value="0">请选择货品分类</option>
									          </select>
							               </td>
							               <td>
							                  <img id="indicator" src="<%=path %>/img/loading.gif" style="display:none"/>
							               </td>
							           </tr>
							    </table>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onmousemove="javascript:this.bgColor='gray';" onmouseout="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" align="right">
						         货品：
						    </td>
						    <td width="75%" align="left">
						        <table border="0">
							           <tr> 
							               <td>  
							                  <select name="goods_id" id="goods_id" onchange="chooseGoods(this.value)">
									              <option value="0">--请选择货品--</option>
									          </select>
							               </td>
							               <td>
							               	  <span id="goodsKucun"></span>
							                  <img id="indicator" src="<%=path %>/img/loading.gif" style="display:none"/>
							               </td>
							           </tr>
							    </table>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onmousemove="javascript:this.bgColor='gray';" onmouseout="javascript:this.bgColor='#FFFFFF';" >
						    <td width="25%" align="right">
						                单价：
						    </td>
						    <td width="75%" align="left">
						        <input value="" type="text" name="danjia" id="danjia" size="20" readonly onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onmousemove="javascript:this.bgColor='grey';" onmouseout="javascript:this.bgColor='#FFFFFF';" >
						    <td width="25%"  align="right">
						                数量：
						    </td>
						    <td width="75%"  align="left">
						        <input value="10" type="text" name="shuliang" id="shuliang" size="20" placeholder="输入商品数量" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onmousemove="javascript:this.bgColor='gray';" onmouseout="javascript:this.bgColor='#FFFFFF';" >
						    <td width="25%" align="right">
						         备注：
						    </td>
						    <td width="75%" align="left">
						        <input type="text" name="beizhu" id="beizhu" size="50" placeholder="输入商品备注内容" />
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onmousemove="javascript:this.bgColor='gray';" onmouseout="javascript:this.bgColor='#FFFFFF';" >
						    <td width="25%" align="right">
						        &nbsp;
						    </td>
						    <td width="75%" align="left">
						       <input type="hidden" name="chuku_id" value="<%=request.getParameter("chuku_id") %>"/>
						       <input type="submit" id="sub" value="提交" onclick="return check();"/>&nbsp; 
						       <input type="reset" value="重置"/>&nbsp;
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
