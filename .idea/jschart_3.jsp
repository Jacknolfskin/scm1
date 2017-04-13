<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
 <%@ include file="/common/common.jspf" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Login page</title>  	
  </head>  
  <body>
 	<div id="graph">Loading graph...</div>

<script type="text/javascript">
	var myChart = new JSChart('graph', 'line');
	myChart.setDataArray([['1', 80],['2', 40],['3', 60],['4', 65],[5, 50],[6, 50],[7, 60],[8, 80],[9, 150],[10, 100],[11, 70],[12, 100]], '收入');
	myChart.setDataArray([['1', 100],['2', 55],['3', 80],['4', 115],[5, 80],[6, 70],[7, 30],[8, 130],[9, 160],[10, 170],[11, 190],[12, 70]], '支出');
	
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
	myChart.setIntervalStartY(10);
	//设置y轴的结束值，如果设置了起始值，则此值必须比起始值大。
	myChart.setIntervalEndY(200);
	//在x轴上添加标签，其参数是两个值构成的一个数组，第一个参数为标签在x轴上的位置，第二个值为标签显示的内容（名称）,一般用来对应数组的第一个为数字的元素。
/* 	 myChart.setLabelX([1,'p1']);
	myChart.setLabelX([2,'p2']);
	myChart.setLabelX([3,'p3']);
	myChart.setLabelX([4,'p4']);
	myChart.setLabelX([5,'p5']); 
	 myChart.setLabelX([6,'p1']);
	myChart.setLabelX([7,'p2']);
	myChart.setLabelX([8,'p3']);
	myChart.setLabelX([9,'p4']);
	myChart.setLabelX([10,'p5']);  */
	//设置x轴上显示的值(刻度值)的个数，此值会自动调整，对饼图无效。
	myChart.setAxisValuesNumberX(3);
	//是否显示x轴上的刻度值
	myChart.setShowXValues(false);
	//设置标题颜色
	myChart.setTitleColor('#4545ff');
	//设置x/y轴值刻度值的颜色，对饼图无效
	myChart.setAxisValuesColor('#4545ff');
	//设置曲线图中曲线的颜色,第一个参数为颜色，第二个参数为数组（数据源）的最后一个字符串元素
	myChart.setLineColor('#A4D314', '收入');
	myChart.setLineColor('#BBBBBB', '支出');
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
	myChart.setFlagColor('#9D16FC');
	//设置提示标志的半径，默认3.
	myChart.setFlagRadius(5);
	//设置图表的背景图片，图片会自动沿两轴重复
	myChart.setBackgroundImage('chart_bg.jpg');
	//预定义容器的大小，需用在draw()函数之前
	myChart.setSize(600, 400);
	//设置x轴名称
	myChart.setAxisNameX('月份');
	//设置x轴名称
	myChart.setAxisNameY('金额（元)');
	//设置是否显示图例
	myChart.setLegendShow(true);

	myChart.setTitle("公司年度月收支报表");
	myChart.draw();
</script>
 	
  </body>
</html>