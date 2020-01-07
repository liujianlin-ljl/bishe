<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="StyleSheet" href="<%=path%>/css/left.css" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.8.3.js"></script>
		<script>
			$(function() {
				$(".menu-list .first-menu").click(function() {
					$(this).addClass("active").siblings().removeClass("active");
					if (!$(".window-left").hasClass('fold')) {
						$(this).find("ul").slideToggle(500);
						$(this).siblings().find("ul").hide();
					}
				})
				$(".menu-list .second-menu").click(function() {
					var $this = $(this);
					$(".second-menu").each(function() {
						if ($(this).hasClass("current")) {
							$(this).removeClass("current");
						}
					})
					$this.addClass("current").siblings().removeClass("current");
					$this.parents(".first-menu").addClass("active").siblings().removeClass("active")
				})
				/*阻止事件冒泡*/
				$(".menu-list .first-menu ul").bind("click", function(event) {
					event.stopPropagation();
				});
				$(".go-back a").click(function() {
					$(".menu-list .first-menu").find("ul").hide();
					//收起状态
					if ($(".window-left").hasClass('fold')) {
						$(".window-left").animate({
							width: "200px"
						}, 300, 'swing');
						$(".window-left").removeClass('fold');
					} else {
						$(".window-left").animate({
							width: "60px"
						}, 300, 'swing');
						$(".window-left").addClass('fold')
					}
				})
			})
		</script>
</head>

<body>
	<div class="window-left">
			<div class="go-back">
				<a href="javascript:;">
					<i class="i-icon"></i>
				</a>
			</div>
			<c:if test="${sessionScope.userType==0}">
				<div class="menu-list">
					<ul>
						<li class="first-menu">
							<a href="<%=path%>/admin/index/sysPro.jsp"><i class="i-icon"></i></a>
							<span class="hover-tit" onclick="">首页</span>
						</li>
						<li class="first-menu">
							<a href="javascript:;"><i class="i-icon"></i></a>
							<span class="hover-tit">操作员信息管理</span>
							<ul>
								<li class="second-menu">
									<a href="<%=path %>/admin/yuangong/yuangongAdd.jsp" target='I2'>员工信息录入</a>
								</li>
								<li class="second-menu">
									<a href="<%=path %>/yuangong?type=yuangongMana" target='I2'>员工权限分配</a>
								</li>
								<li class="second-menu">
									<a href="<%=path %>/yuangong?type=shenheMana" target='I2'>员工注册审核</a>
								</li>
							</ul>
						</li>
						<li class="first-menu">
							<a href="javascript:;"><i class="i-icon"></i></a>
							<span class="hover-tit">基本信息管理</span>
							<ul>
								<li class="second-menu">
									<a href="<%=path %>/catelog?type=catelogMana" target='I2'>品牌管理</a>
								</li>
								<li class="second-menu">
									<a href="<%=path %>/goods?type=goodsMana" target='I2'>商品信息管理</a>
								</li>
								<li class="second-menu">
									<a href="<%=path %>/gongyingshang?type=gongyingshangMana" target='I2'>供应商信息管理</a>
								</li>
							</ul>
						</li>
						<li class="first-menu">
							<a href="javascript:;"><i class="i-icon"></i></a>
							<span class="hover-tit">仓库管理</span>
							<ul>
								<li class="second-menu">
									<a href="<%=path %>/cangku?type=cangkuMana" target='I2'>仓库信息</a>
								</li>
							</ul>
						</li>
						<li class="first-menu">
							<a href="javascript:;"><i class="i-icon"></i></a>
							<span class="hover-tit">进货管理</span>
							<ul>
								<li class="second-menu">
									<a href="<%=path %>/ruku?type=rukuMana" target='I2'>入库单管理</a>
								</li>
								<li class="second-menu">
									<a href="<%=path %>/ruku?type=findRukuMingxi" target='I2'>入库明细管理</a>
								</li>
							</ul>
						</li>
						<li class="first-menu">
							<a href="javascript:;"><i class="i-icon"></i></a>
							<span class="hover-tit">销售管理</span>
							<ul>
								<li class="second-menu">
									<a href="<%=path %>/chuku?type=chukuMana" target='I2'>出库单管理</a>
								</li>
								<li class="second-menu">
									<a href="<%=path %>/chuku?type=findChukuMingxi" target='I2'>出库明细管理</a>
								</li>
								<li class="second-menu">
									<a href="<%=path %>/customer?type=customerMana" target='I2'>客户管理</a>
								</li>
							</ul>
						</li>
						<li class="first-menu">
							<a href="javascript:;"><i class="i-icon"></i></a>
							<span class="hover-tit">库存管理</span>
							<ul>
								<li class="second-menu">
									<a href="<%=path %>/kucun?type=kucunMana&cangku_id=0" target='I2'>库存信息管理</a>
								</li>
								<li class="second-menu">
									<a href="<%=path %>/admin/kucun/pancun.jsp" target='I2'>盘点信息查询</a>
								</li>
							</ul>
						</li>
						<li class="first-menu">
							<a href="javascript:;"><i class="i-icon"></i></a>
							<span class="hover-tit">查询统计</span>
							<ul>
								<li class="second-menu">
									<a href="<%=path %>/selectTongji?year=2019&cangku_id=0" target='I2'>仓库统计查询</a>
								</li>
							</ul>
						</li>
						<li class="first-menu">
							<a href="javascript:;"><i class="i-icon"></i></a>
							<span class="hover-tit">系统管理</span>
							<ul>
								<li class="second-menu">
									<a href="<%=path %>/admin/userinfo/userPw.jsp" target='I2'>修改密码</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</c:if>
			<c:if test="${sessionScope.userType==1}">
				<div class="menu-list">
					<ul>
						<li class="first-menu">
							<a href="javascript:;"><i class="i-icon"></i></a>
							<span class="hover-tit" onclick="">首页</span>
						</li>
						<li class="first-menu">
							<a href="javascript:;"><i class="i-icon"></i></a>
							<span class="hover-tit">基本信息管理</span>
							<ul>
								<li class="second-menu">
									<a href="<%=path %>/catelog?type=catelogMana" target='I2'>品牌管理</a>
								</li>
								<li class="second-menu">
									<a href="<%=path %>/goods?type=goodsMana" target='I2'>商品信息管理</a>
								</li>
							</ul>
						</li>
						<li class="first-menu">
							<a href="javascript:;"><i class="i-icon"></i></a>
							<span class="hover-tit">仓库管理</span>
							<ul>
								<li class="second-menu">
									<a href="<%=path %>/cangku?type=cangkuMana" target='I2'>仓库信息查看</a>
								</li>
							</ul>
						</li>
						<li class="first-menu">
							<a href="javascript:;"><i class="i-icon"></i></a>
							<span class="hover-tit">库存管理</span>
							<ul>
								<li class="second-menu">
									<a href="<%=path %>/kucun?type=kucunMana&cangku_id=0" target='I2'>库存信息查看</a>
								</li>
							</ul>
						</li>
						<li class="first-menu">
							<a href="javascript:;"><i class="i-icon"></i></a>
							<span class="hover-tit">客户管理</span>
							<ul>
								<li class="second-menu">
									<a href="<%=path %>/customer?type=customerMana" target='I2'>客户信息查看</a>
								</li>
							</ul>
						</li>
						<li class="first-menu">
							<a href="javascript:;"><i class="i-icon"></i></a>
							<span class="hover-tit">进货管理</span>
							<ul>
								<li class="second-menu">
									<a href="<%=path %>/ruku?type=rukuMana" target='I2'>入库单管理</a>
								</li>
								<li class="second-menu">
									<a href="<%=path %>/ruku?type=findRukuMingxi" target='I2'>入库明细管理</a>
								</li>
							</ul>
						</li>
						<li class="first-menu">
							<a href="javascript:;"><i class="i-icon"></i></a>
							<span class="hover-tit">销售管理</span>
							<ul>
								<li class="second-menu">
									<a href="<%=path %>/chuku?type=chukuMana" target='I2'>出库单管理</a>
								</li>
								<li class="second-menu">
									<a href="<%=path %>/chuku?type=findChukuMingxi" target='I2'>出库明细管理</a>
								</li>
							</ul>
						</li>
						<li class="first-menu">
							<a href="javascript:;"><i class="i-icon"></i></a>
							<span class="hover-tit">系统管理</span>
							<ul>
								<li class="second-menu">
									<a href="<%=path %>/admin/userinfo/myInfo.jsp" target='I2'>我的个人信息</a>
								</li>
								<li class="second-menu">
									<a href="<%=path %>/admin/userinfo/yuangongPw.jsp" target='I2'>修改个人密码</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</c:if>
		</div>
</body>
</html>
