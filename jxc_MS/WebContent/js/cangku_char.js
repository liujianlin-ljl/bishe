//配置路径  
require.config({
	paths : {
		echarts : 'echarts-2.2.7/build/dist'
	}
});
// 开始使用
require([ 'echarts', 'echarts/chart/pie' // 使用柱状图就加载bar模块，按需加载
], function(ec) {
	// 基于准备好的dom，初始化echarts图表
	var myChart = ec.init(document.getElementById('chart'));
	// 准备数据
	var datares=[];
	var cangku_name=[];
	var cangkuName=document.getElementsByClassName("cangkuName");
	var cangkuSize=document.getElementsByClassName("cangkuSize");
	for(var i=0;i<cangkuName.length;i++){
		//alert(cangkuName[i].innerHTML+"仓库的剩余容量为："+cangkuSize[i].innerHTML);
		var data02=new Object();
		data02.name=cangkuName[i].innerHTML;
		data02.value=cangkuSize[i].innerHTML;
		cangku_name[i]=cangkuName[i].innerHTML;
		datares[i]=data02;
	}

	option = {
		    title : {
		        text: '仓库信息饼图',
		        subtext: '仓库剩余容量',
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    legend: {
		        orient: 'vertical',
		        x: 'left',
		        data: cangku_name
		    },
		    series : [
		        {
		            name: '仓库',
		            type: 'pie',
		            radius : '55%',
		            center: ['50%', '60%'],
		            data:datares,
		            itemStyle: {
		                emphasis: {
		                    shadowBlur: 10,
		                    shadowOffsetX: 0,
		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		                }
		            }
		        }
		    ]
		};
	// 为echarts对象加载数据
	myChart.setOption(option);
});