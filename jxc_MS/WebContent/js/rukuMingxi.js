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

function check() {
	if (document.formAdd.goods_id.value == 0) {
		alert("请选择货品");
		return false;
	}
	return true;
}