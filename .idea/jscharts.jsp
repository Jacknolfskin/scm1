<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
 <%@ include file="/common/common.jspf" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Login page</title>  	
  </head>  
  <body>
 	<div id="chartcontainer">这里将用来显示图形报表</div>
 	<script type="text/javascript">
		var myData = new Array([ "商品1", 20 ], [  "商品2", 10 ], [  "商品3", 30 ], [  "商品4", 10 ],
				[  "商品5", 5 ]);
				//第二个参数值有：line,bar,pie分别表示用线形图、柱状图、饼图来展示报表
		var myChart = new JSChart('chartcontainer', 'line');
		//myChart.setDataArray(myData);
		//数据源处理方式二：setDataJSON使用json格式数据
		//myChart.setDataJSON("data.json");
		//数据源处理方式三：setDataXML使用xml格式数据
		myChart.setDataXML("data.xml");
		myChart.setAxisNameX('商品名称',true);
		myChart.setAxisNameY('销量',true);
		myChart.setTitle("商品销售报表");
		myChart.setTitleColor('#6079ff');
		myChart.draw();
		</script>
  </body>
</html>