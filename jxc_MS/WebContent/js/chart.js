//配置路径  
require.config({
	paths : {
		echarts : 'echarts-2.2.7/build/dist'
	}
});
// 开始使用
require([ 'echarts', 'echarts/chart/bar' // 使用柱状图就加载bar模块，按需加载
], function(ec) {
	// 基于准备好的dom，初始化echarts图表
	var myChart = ec.init(document.getElementById('chart'));
	// 准备数据
	var good_name = document.getElementsByClassName("goods_name");
	var kucun_shuliang = document.getElementsByClassName("shuliang");
	// alert(good_name[1].innerHTML);

	// var g_name[]=new String[good_name.length];
	var g_name = [];
	var shu_liang = [];
	for (var i = 0; i < good_name.length; i++) {
		g_name[i] = good_name[i].innerHTML;
		//alert(g_name[i]);
	}
	for (var i = 0; i < kucun_shuliang.length; i++) {
		shu_liang[i] = kucun_shuliang[i].innerHTML;
		//alert(shu_liang[i]);
	}

	var option = {
		tooltip : {
			trigger: 'axis',
			show : true,
			axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	        }
		},
		legend : {
			selectedMode:false,
			data : [ '库存报表' ]
		},
		calculable : true,
		xAxis : [ {
			type : 'category',
			data : g_name,
			axisLabel:{
				show:true,
				number:0
			}
		} ],
		yAxis : [ {
			type : 'value'
		} ],
		series : [ {
			"name" : "库存量",
			"type" : "bar",
			"data" : shu_liang
		} ]
	};
	// 为echarts对象加载数据
	myChart.setOption(option);
});