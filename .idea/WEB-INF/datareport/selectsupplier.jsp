<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ include file="/common/common.jspf"%>
<title></title>
</head>
<body>
	开始时间: <input id="start" type="text" class="easyui-datebox" />
	结束时间: <input id="end" type="text" class="easyui-datebox" />
	
	报表图类:
	<select id="type">
		<option value="bar">柱状图</option>
		<option value="line">线型图</option>
		<option value="pie">饼状图</option>
	</select>
	
	<input type="button" value="查询报表" id="search" />
	<div id="chart_container">Loading chart...</div>
	<script type="text/javascript">
	$(function(){
	
		$("#search").click(function(){
			$.ajax({
				url: "${proPath}/supplier/selectSupplier.action",
				data: {start:$("#start").datebox("getValue"),end:$("#end").datebox("getValue")},
				type:'post',
				dataType:'json',
				success:function(result){
				
				  var data=new Array();  //data是一个数组
					$(result).each(function(i){
						//alert("i:" + i + "," + this.s_name + "," + this.number);
						data[i]=new Array();  // data[i] 声明为数组
						data[i][0]=this.sup_name; 
						data[i][1]=this.total;
					});
					//支持js二维数组、json格式、xml格式数据源
					/* var myData = new Array([ "商品1", 20 ], [  "商品2", 10 ], [  "商品3", 30 ], [  "商品4", 10 ],
							[  "商品5", 5 ]); */
							//第二个参数值有：line,bar,pie分别表示用线形图、柱状图、饼图来展示报表
					var myChart = new JSChart('chart_container',$("#type").val());

					myChart.setDataArray(data);
                    //设置x轴和容器底部的距离，默认30。
	                myChart.setAxisPaddingBottom(50);
                    //设置x轴上标签文字与容器下边的距离，默认1
                    myChart.setTextPaddingBottom(10);

                    //设置y轴和容器左边距，默认30。
                    myChart.setAxisPaddingLeft(80);
                    //设置y轴上标签文字与容器左边的距离，默认8
                    myChart.setTextPaddingLeft(20);

                    //设置x轴上显示的值的个数，此值会自动调整，对饼图无效。
                    myChart.setAxisValuesNumberY(11);
                    //设置y轴的起始值，如果设置了结束值，则此值必须比结束值小.
                    myChart.setIntervalStartY(10000);
                    //设置y轴的结束值，如果设置了起始值，则此值必须比起始值大。
                    myChart.setIntervalEndY(1000000);
                    myChart.setSize(1000, 500);
                    //设置x轴名称
                    myChart.setAxisNameX('供应商');
                    //设置x轴名称
                    myChart.setAxisNameY('采购额');

                    myChart.setLineColor('#4682B4', '采购额');
                    //设置是否显示图例
                    //myChart.setLegendShow(true);
                    //设置x轴上提示
                    myChart.setTooltip([1]);
                    myChart.setTooltip([2]);
                    myChart.setTooltip([3]);
                    myChart.setTooltip([4]);
                    myChart.setTooltip([5]);
                    myChart.setTooltip([6]);
                    myChart.setTooltip([7]);
                    myChart.setTooltip([8]);
                    myChart.setTooltip([9]);
                    myChart.setTooltip([10]);
                    //为提示标志设置颜色
                    myChart.setFlagColor('#8A2BE2');
                    //设置提示标志的半径，默认3.
                    myChart.setFlagRadius(4);
					
					myChart.setTitle('采购额统计报表');
					
					myChart.draw();
				}
			});
		
		
			
			});
		});
		</script>

</body>
</html>
		
	