﻿<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
				alert(result);
				
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
					//数据源处理方式一：setDataArray(myData)使用js数组
					myChart.setDataArray(data);
					//数据源处理方式二：setDataJSON使用json格式数据
					//myChart.setDataJSON(result);
					//数据源处理方式三：setDataXML使用xml格式数据
					//myChart.setDataXML("data.xml");
					
					myChart.setTitle('测试报表');
					
					myChart.draw();
				}
			});
		
		
			
			});
		});
		</script>
		
		<!-- var myChart = new JSChart('chart_container', $("#type").val(),'');
					// 需要的是js 二维数组格式
					myChart.setDataArray(data);
					// 设置树状结构颜色值, 通过slice来获取数组部分数据
					myChart.colorize(color.slice(0,data.length));
					// 设置报表尺寸
					myChart.setSize(100*data.length,200);
					// 是否在柱形上面显示值
					myChart.setBarValues(true);
					// 设置支持3D显示
					myChart.set3D(true);
					// 柱形之间的距离. 1~100之间
					myChart.setBarSpacingRatio(50);
					// 柱形透明度
					myChart.setBarOpacity(1);
					// 柱形边框值
					myChart.setBarBorderWidth(1);
					// 设置报表的标题
					myChart.setTitle('订单销售Top ' + $("#number").val());
					// 设置标题字体大小
					myChart.setTitleFontSize(10);
					// 设置标题字体颜色
					myChart.setTitleColor('#607985');
					// 设置轴的颜色值
					myChart.setAxisValuesColor('#607985');
					// 设置网格的透明度
					myChart.setGridOpacity(0.8);
					// 设置坐标的值
					myChart.setAxisNameX('商品名称',true);
					myChart.setAxisNameY('销量',true);
					// 设置轴的内间距, 可以调整轴与文字的距离
					myChart.setAxisPaddingBottom(50);
					myChart.setAxisPaddingLeft(50);
					myChart.draw();	 -->
</body>
</html>
		
	