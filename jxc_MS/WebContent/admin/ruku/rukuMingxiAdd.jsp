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
		<script type="text/javascript" src='<%=path%>/js/jquery-1.8.3.js'></script>
<%-- 		<script type="text/javascript" src='<%=path%>/js/rukuMinxi.js'></script> --%>
        <script language="javascript">
			function getGoodsAll(catelog_id){
				
				var objSelect = document.getElementById("goods_id");
	            $.ajax({
	                type: "post",//使用post方法访问后台
	                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	                url: "<%=path%>/goods",
	                data: {
	                    'type': "findGoods",
	                    'catelog_id':catelog_id
	                },
	                dataType:"json",
	                success: function (data) {
	                	//alert("请求成功:"+data[3].id);
	                	objSelect.innerHTML="";
	                    //data = decodeURI(data);//防止中文乱码
	                    if (data.length != "" && data.length != null) {
	                        	//alert("data.length:"+data.length);
	                        for (var i =0;i<data.length;i++) {
	                            objSelect.options.add(new Option(data[i].name, data[i].id));
	                        }
	                    }
	                },
	                error: function (XMLHttpRequest, textStatus, errorThrown) {
	                    alert("该分类还没有商品！！！");
	                }
	            });
			}
			
			function getPrice(goodsId){
				var danjia=document.getElementById("danjia");
				var beizhu=document.getElementById("beizhu");
				if(goodsId==0){
	        		alert("请先选择要进货的商品");
	        		return false;
	        	}else{
	        		$.ajax({
	                    type: "post",//使用post方法访问后台
	                    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	                    url: "<%=path%>/ruku",
	                    data: {
	                        'type': "getPrice",
	                        'goodsId':goodsId
	                    },
	                    dataType:"json",
	                    success: function (data) {
	                        //data = decodeURI(data);//防止中文乱码
	                        danjia.value=data.price;
	                        beizhu.value="入库成功，单价:"+data.price+"元";
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
		        		alert("入库单价未更新，请重新选择商品!");
		        		return false;
		        	}
		        	if(shuliang.value==0){
		        		alert("入库数量不能为0！");
		        		return false;
		        	}
		        	return true;
		        }
        </script>
	</head>

	<body background='<%=path %>/images/allbg.gif'>
			<form action="<%=path %>/ruku?type=rukuMingxiAdd" name="formAdd" method="post">
				     <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
				     <tr align='center' bgcolor="#FFFFFF" onmousemove="javascript:this.bgColor='silver';" onmouseout="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" align="right">
						         仓库：
						    </td>
						    <td width="75%" align="left">
						        <table border="0">
							           <tr> 
							               <td>  
							                  <select name="cangku_id" id="cangku_id" >
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
						<tr align='center' bgcolor="#FFFFFF" onmousemove="javascript:this.bgColor='silver';" onmouseout="javascript:this.bgColor='#FFFFFF';">
						    <td width="25%" align="right">
						         分类：
						    </td>
						    <td width="75%" align="left">
						        <table border="0">
							           <tr> 
							               <td>  
							                  <select name="catelog_id" id="catelog_id"  onchange="javascript:getGoodsAll(this.value);">
									              	<option value="0">请选择货品分类</option>
									              <c:forEach items="${sessionScope.catelogList }" var="catelog">
									              	<option value="${catelog.id }">${catelog.name }</option>
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
						<tr align='center' bgcolor="#FFFFFF" onmousemove="javascript:this.bgColor='silver';" onmouseout="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" align="right">
						         商品：
						    </td>
						    <td width="75%" align="left">
						        <table border="0">
							           <tr> 
							               <td>  
							                  <select name="goods_id" id="goods_id" onchange="getPrice(this.value)">
									              <option value="0">--请选择商品--</option>
									          </select>
							               </td>
							               <td>
							                  <img id="indicator" src="<%=path %>/img/loading.gif" style="display:none"/>
							               </td>
							           </tr>
							    </table>
						    </td>
						</tr>
						
						<tr align='center' bgcolor="#FFFFFF" onmousemove="javascript:this.bgColor='silver';" onmouseout="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" align="right">
						               单价：
						    </td>
						    <td width="75%" align="left">
						        <input value="0" type="text" name="danjia" id="danjia" size="20" readonly onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onmousemove="javascript:this.bgColor='silver';" onmouseout="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" align="right">
						               数量：
						    </td>
						    <td width="75%"  align="left">
						        <input value="10" type="text" name="shuliang" size="20" placeholder="输入商品数量" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onmousemove="javascript:this.bgColor='silver';" onmouseout="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" align="right">
						         备注：
						    </td>
						    <td width="75%"  align="left">
						        <input type="text" name="beizhu" id="beizhu" placeholder="输入备注内容" size="50"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onmousemove="javascript:this.bgColor='silver';" onmouseout="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" align="right">
						        &nbsp;
						    </td>
						    <td width="75%"align="left">
						       <input type="hidden" name="ruku_id" value="<%=request.getParameter("ruku_id") %>"/>
						       <input type="submit" value="提交" onclick="return check()"/>&nbsp; 
						       <input type="reset" value="重置"/>&nbsp;
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
