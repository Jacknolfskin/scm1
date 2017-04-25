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

</body>
</html>
		
	