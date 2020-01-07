//配置路径  
require.config({
	paths : {
		echarts : 'echarts-2.2.7/build/dist'
	}
});
// 开始使用
require([ 'echarts', 'echarts/chart/bar', 'echarts/chart/line' // 使用柱状图就加载bar模块，按需加载
], function(ec) {
	// 基于准备好的dom，初始化echarts图表
	var myChart = ec.init(document.getElementById('tongji_chart'));
	// 准备数据
	var ruku_money = document.getElementsByClassName("ruku_money");
	var chuku_money = document.getElementsByClassName("chuku_money");
	var lirun_money = document.getElementsByClassName("lirun_money");
	// alert("入库金额："+ruku_money[1]);
	// alert("出库金额："+chuku_money[1]);
	// alert("利润："+lirun_money[1]);

	var rukuMoney = [];//入库额数据
	var chukuMoney = [];//出库额数据
	var lirunMoney = [];//利润额数据
	
	

	for (var i = 0; i < ruku_money.length; i++) {
		rukuMoney[i] = ruku_money[i].innerHTML / 10000;
		r_money+=ruku_money[i].innerHTML;
	}
	for (var i = 0; i < chuku_money.length; i++) {
		chukuMoney[i] = chuku_money[i].innerHTML / 10000;
		 //alert(chukuMoney[i]);
	}
	for (var i = 0; i < lirun_money.length; i++) {
		lirunMoney[i] = lirun_money[i].innerHTML / 10000;
		// alert(lirunMoney[i]);
	}

	option = {
		tooltip : {
			trigger : 'axis',
			axisPointer : {
				type : 'cross',
				crossStyle : {
					color : '#999'
				}
			}
		},
		toolbox : {
			feature : {
				dataView : {
					show : true,
					readOnly : false
				},
				magicType : {
					show : true,
					type : [ 'line', 'bar' ]
				},
				restore : {
					show : true
				},
				saveAsImage : {
					show : true
				}
			}
		},
		legend : {
			data : [ '入库总额', '出库总额', '利润' ]
		},
		xAxis : [ {
			type : 'category',
			data : [ '1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月',
					'10月', '11月', '12月' ],
			axisPointer : {
				type : 'shadow'
			}
		} ],
		yAxis : [ {
			type : 'value',
			name : '金额',
			// min: 0,
			// max: 250,
			// interval: 50,
			axisLabel : {
				formatter : '{value} 万元'
			}
		}, {
			type : 'value',
			name : '利润',
			// min: 0,
			// max: 25,
			// interval: 5,
			axisLabel : {
				formatter : '{value} 万元'
			}
		} ],
		series : [ {
			name : '入库总额',
			type : 'bar',
			data : rukuMoney
		}, {
			name : '出库总额',
			type : 'bar',
			data : chukuMoney
		}, {
			name : '利润',
			type : 'line',
			yAxisIndex : 1,
			data : lirunMoney
		} ]
	};
	// 为echarts对象加载数据
	myChart.setOption(option);
});