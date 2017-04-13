<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ include file="/common/common.jspf"%>
<script type="text/javascript" src="${proPath}/js/jscharts.js"></script>
<title></title>
</head>
<body>
	<div id="chartcontainer">这里将用来显示图形报表</div>
	<script type="text/javascript">
	//支持js二维数组、json格式、xml格式数据源
		
				//用于柱形图的多条柱
		 var myData = new Array([ "商品1", 22,12 ], [  "商品2", 7,34 ], [  "商品3", 38,22 ], [  "商品4", 4,21 ],
				[  "商品5", 5,5 ]); 
				//第二个参数值:bar表示用柱状图来展示报表
		var myChart = new JSChart('chartcontainer', 'bar');
		//数据源处理方式一：setDataArray(myData)使用js数组
		myChart.setDataArray(myData);		
		
		myChart.setTitle('测试报表');
		
		myChart.draw();
	
		
		</script>
		
		
</body>
</html>
		
	