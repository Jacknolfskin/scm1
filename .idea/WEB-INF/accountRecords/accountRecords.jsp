<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/common/common.jspf"%>
<html>
<head>


<title></title>
<style type="text/css">
.searchbox{
	margin:-3
}

.hide{
	display:none;
}
</style>

<script type="text/javascript">
	$(function(){
	
			$('#dg').datagrid({    
			    //url:'${proPath}/supplier/selectPage.action', //通过关键字查询
			    //支持多条件查询
			    url:'${proPath}/accountRecords/selectPageUseDyc.action', 
			    
			    fitColumns:true,
			    nowrapL:true,
			    idField:'arId',
			    rownumbers:true,
			    pagination:true,
			    pageSize:20,
			    pageList:[2,5,10,20],
			    
			     queryParams: {
					arAttn: '%%',
					arOperator:'%%'			
				}, 
						    
			    toolbar: [{
					iconCls: 'icon-edit',
					text:'修改',
					handler: function(){
						//判断是否选中一行，并且只能选中一行进行修改
						var array = $('#dg').datagrid("getSelections");
						if(array.length!=1){
                            $.messager.alert("操作提示", "请选择需要修改的记录，并且只能选中一条！","warning");
							return false;							
						}
						
						//打开修改窗口
						parent.$('#win').window({    
							title :'修改进销明细',
						    width:600,    
						    height:480,
						    modal:true,
						    content:"<iframe src='${proPath}/base/goURL/accountRecords/update.action' height='100%' width='100%' frameborder='0px' ></iframe>"  
						}); 
						
					}
				},'-',{
					iconCls: 'icon-remove',
					text:'删除',
					handler: function(){
						var array = $('#dg').datagrid("getSelections");
						if(array.length>0){
							//定义数组，通过下边的用来存储选中记录的Id
						var ids = new Array();
						for (i = 0; i < array.length; i++) {
							ids[i] = array[i].arId;
						}
						//alert("ids" + ids);
						//如果需要锁整个页面，前面加parent.
						parent.$.messager.confirm('删除对话框', '您确认要删除吗？', function(r) {
							if (r) {
								//alert(r);
								$.ajax({
								  url: "${proPath}/accountRecords/deleteList.action",
								  type:"POST",
								  //设置为传统方式传送参数
								  traditional:true,
								  data:{pks:ids},
								  success: function(html){
                                      if(html>0){
                                          $.messager.alert("操作提示", "恭喜您 ，删除成功，共删除了"+html+"条记录","info");
                                          //alert("恭喜您 ，删除成功，共删除了"+html+"条记录");
                                      }else{
                                          $.messager.alert("操作提示", "对不起，删除失败","error");
                                          //alert("对不超 ，删除失败");
                                      }
								  //重新刷新页面
								    $("#dg").datagrid("reload");
								    //请除所有勾选的行
								    $("#dg").datagrid("clearSelections");
								  },
								  error: function (XMLHttpRequest, textStatus, errorThrown) {
									    $.messager.alert('删除错误','请联系管理员！','error');
									},
								  dataType:'json'
								});


							}
						});
						}else{
                            $.messager.alert("操作提示", "请选择需要删除的记录！","warning");
						}
					}
				},'-',{
					iconCls: 'icon-redo',
					text:'导出',
					handler: function(){
						//alert('导出按钮');
						var array = $('#dg').datagrid("getSelections");
						if(array.length>0){
						
						//定义数组，通过下边的用来存储选中记录的Id
						var ids = new Array();
						for (i = 0; i < array.length; i++) {
							ids[i] = array[i].arId;
							//alert(ids[i]);
						}
						
						//需要锁整个页面，前面加parent.
						parent.$.messager.confirm('导出选项', '您确认要导出吗？', function(r) {
							if (r) {
								var pks = ids;
								$("#pks").val(pks);
								//alert("***************"+$("#pks").val());
								$("#ff").submit();
							}
						});
						}else{
                            $.messager.alert('操作提示','请选择需要导出的记录！','warning');
						}
					}
				},'-',{
					text:"原始单号：<input type='text' id='arAttn' name='arAttn'/>",					
				}
				,'-',{
					text:"操作员：<input type='text' id='arOperator' name='arOperator'/>",					
				}],			       
			    
				
				columns : [ [{
					//var Date = dateFormat('arDate','yyyy-MM-dd HH:mm:ss'),
					checkbox:true,
					
				}, {
				field : 'supId',
				title : '供应商编号'
			}, {
				field : 'arBusType',
				title : '交易类型',
				width : 100
			}, {
				field : 'arPayable',
				title : '应付',
				width : 100
			}, {
				field : 'arPaid',
				title : '已付',
				width : 100
			}, {
				field : 'arArrears',
				title : '欠款',
				width : 100
			}, {
				field : 'arDiscount',
				title : '优惠金额',
				width : 100		
			}, {
				field : 'arAttn',
				title : '原始单号',
				width : 100,
			}, {
				field : 'arOperator',
				title : '操作员',
				width : 100,
				align : 'right'
			}, {
				field : 'arDate',
				title : '交易时间',
				width : 100,
				align : 'right'
			}, {
				field : 'arRemark',
				title : '备注',
				width : 100,
				align : 'right'
			}, {
				field : 'arId',
				title : '交易编号',
				width : 100,
				align : 'right'
			}] ]
		});
			
			dateFormat = function (date, format) {
				 
	            date = new Date(date);
	 
	            var o = {
	                'M+' : date.getMonth() + 1, //month
	                'd+' : date.getDate(), //day
	                'H+' : date.getHours(), //hour
	                'm+' : date.getMinutes(), //minute
	                's+' : date.getSeconds(), //second
	                'q+' : Math.floor((date.getMonth() + 3) / 3), //quarter
	                'S' : date.getMilliseconds() //millisecond
	            };
	 
	            if (/(y+)/.test(format))
	                format = format.replace(RegExp.$1, (date.getFullYear() + '').substr(4 - RegExp.$1.length));
	 
	            for (var k in o)
	                if (new RegExp('(' + k + ')').test(format))
	                    format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ('00' + o[k]).substr(('' + o[k]).length));
	 
	            return format;
	        };
		
			$('#arOperator').searchbox({ 
			searcher:function(value,name){ 
				//alert("arOperator:"+value); 
				alert("arAttn:"+value); 
				alert("arOperator:"+$('#arOperator').val());
				$('#dg').datagrid('load',{
					arAttn: '%'+$('#arAttn').val()+'%',
					arOperator:'%'+value+'%'		
				});					
			}, 
			prompt:'' 
		});
		
	/* 通过关键字查询
		$('#ss').searchbox({ 
			searcher:function(value,name){ 
				alert(value + "," + name); 
				$('#dg').datagrid('load',{
					keyWord: '%'+value+'%'					
				});					
			}, 
			prompt:'请输入供应商名称' 
		}); */ 

	});
</script>
</head>

<body >
	<table id="dg"></table>
	<div class="hide">
	<form action="${proPath}/accountRecords/selectScore.action" method="post" id="ff">
		<input type="text" name="pks" value="" id="pks">
	</form>
	</div>
</body>
</html>