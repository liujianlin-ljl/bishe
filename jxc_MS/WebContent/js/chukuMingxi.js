var i = 0;
function catelogAll(cangku_id) {
	document.getElementById("indicator").style.display = "block";
	loginService.getCatelogByCangkuId(cangku_id, callback);
	i = 1;
}
function callback(data) {
	document.getElementById("indicator").style.display = "none";
	DWRUtil.removeAllOptions("catelog_id");
	DWRUtil.addOptions("catelog_id", {
		0 : '--请选择分类--'
	});
	DWRUtil.addOptions("catelog_id", data, "id", "name");
}
function goodsAll(catelog_id) {
	loginService.getGoodsByCatelogId(catelog_id, callback1);
}
function callback1(data) {
	DWRUtil.removeAllOptions("goods_id");
	DWRUtil.addOptions("goods_id", {
		0 : '--请选择货品--'
	});
	DWRUtil.addOptions("goods_id", data, "id", "name");
}


