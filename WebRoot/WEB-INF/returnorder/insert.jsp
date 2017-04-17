<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/common/common.jspf"%>
<html>
<head>


<title></title>
<style type="text/css">
.searchbox {
	margin: -3
}
</style>

<script type="text/javascript">
	$(function() {
		//变量用来支持单元格编辑时使用
	    var editIndex = undefined;

		$('#dg')
				.datagrid(
						{
							//url:'${proPath}/supplier/selectPage.action', //通过关键字查询
							//支持多条件查询
							//url:'${proPath}/supplier/selectPageUseDyc.action', 

							fitColumns : true,
							nowrapL : true,
							idField : 'goodsId',
							rownumbers : true,
							/* pagination:true,
							pageSize:5,
							pageList:[2,5,10,20], */

							/*     queryParams: {
								supName: '%%',
								supAddress:'%%'			
							},  */

							toolbar : [
									{
										iconCls : 'icon-add',
										text : '选择商品',
										handler : function() {
											//alert('选择商品');
											parent
													.$('#win')
													.window(
															{
																title : '选择需要退货的商品',
																width : 600,
																height : 400,
																modal : true,
																content : "<iframe src='${proPath}/base/goURL/goods/selectretun.action' height='100%' width='100%' frameborder='0px' ></iframe>"
															});
										}

									},
									'-',
									{
										iconCls : 'icon-remove',
										text : '删除商品',
										handler : function() {
											//alert('删除商品');
											//判断是否选中一行，并且只能选中一行进行修改
											var array = $("#dg").datagrid(
													"getSelections");
											if (array.length > 0) {
												for ( var i = array.length - 1; i >= 0; i--) {
													alert(i);
													var index = $("#dg")
															.datagrid(
																	"getRowIndex",
																	array[i].goodsId);
													$("#dg").datagrid(
															"deleteRow", index);
												}

											} else {
                                                $.messager.alert("操作提示", "请选择不需要退货的商品","warning");
											}

										}
									},
									'-',
									{
										iconCls : 'icon-ok',
										text : '提交退货',
										handler : function() {
											//alert('提交退货');
											//form表单验证
											$('#ff').form("enableValidation");
											//获取数据
											var data = $("#dg").datagrid("getData");
											//alert(data);
											console.info(data);
											console.info(data.rows);
											if(data.rows.length==0){
                                                $.messager.alert("操作提示", "请选择需要退货的商品！","warning");
												return false;
											} 
											//把对象转成JSON格式的字符串
											 //var rows =JSON.stringify(data.rows);

											var rows = $("#dg").datagrid(
													"getRows");
											console.info(rows);

											//把对象转成JSON格式的字符串
											rows = JSON.stringify(rows);
											console.info(rows);

											//提交采购到服务端
											$('#ff')
													.form(
															'submit',
															{
																url : '${proPath}/returnOrder/insert.action',
																onSubmit : function(
																		param) {
																	param.rows = rows;
																	return true;

																},
                                                                success : function(data) {
                                                                    //自己处理返回的信息
                                                                    //alert(data);
                                                                    $.messager.alert("操作提示", "提交退货成功！","info");
																	/* parent.$('#win').window({
																	 //title :'修改商品',
																	 width:300,
																	 height:200,
																	 modal:true,
																	 content:"提交成功！"
																	 }); */
                                                                }
                                                            });
                                        }

                                    } ],

							columns : [ [ {
								checkbox : true,
							}, {
								field : 'goodsId',
								title : '商品编号',
								width : 100
							}, {
								field : 'goodsName',
								title : '商品名称',
								width : 100
							}, {
								field : 'goodsUnit',
								title : '单位',
								width : 100
							}, {
								field : 'goodsType',
								title : '型号',
								width : 100
							}, {
								field : 'goodsColor',
								title : '颜色',
								width : 100
							}, {
								field : 'rodAmount',
								title : '数量',
								width : 100,
								editor:'numberbox',
							}, {
								field : 'rodReturnPrice',
								title : '进价',
								width : 100,
								//numberbox数字类型，precision两位精确数
								editor:{type:'numberbox',options:{precision:2}},
								
							}, {
								field : 'rodTotalPrice',
								title : '合计',
								width : 100,
								//numberbox数字类型，precision两位精确数
								editor:{type:'numberbox',options:{precision:2}},
								
							}, {
								field : 'rodImeiList',
								title : '串号列表',
								width : 100,
								align : 'right',
								editor:'textarea'
							} ] ],
							
							onDblClickCell: function(index,field,value){
								//alert("dblclick");
								//结束编辑行, 可以不用，不会被调用，将在单击事件处理
									if(editIndex != undefined){							
										//alert(" onDblClickCell editIndex != undefined");			
									  $(this).datagrid('endEdit', editIndex);
										editIndex = undefined;
									}
									//alert("dbclick");		
									//设置可编辑行	
									$(this).datagrid('beginEdit', index);
									editIndex = index;
									//alert("dbclick");				
									var ed = $(this).datagrid('getEditor', {index:index,field:field});
									//alert("field||index:"+field+index);				
									$(ed.target).focus();
								
							},
							onClickCell: function(index,field,value){
								if(editIndex!= undefined){					
									
								  //计算总价
								  var amount = $(this).datagrid('getEditor', {index:editIndex,field:"rodAmount"});
								  var returnPrice=$(this).datagrid('getEditor', {index:editIndex,field:"rodReturnPrice"});
								  var rodTotalPrice =$(returnPrice.target).numberbox('getValue')*$(amount.target).numberbox('getValue');
								  //alert("bodTotalPrice"+bodTotalPrice);
								  var ed = $(this).datagrid('getEditor', {index:editIndex,field:"rodTotalPrice"});
								  //alert(" onClickCell editIndex != undefined3");	
								  $(ed.target).numberbox('setValue', rodTotalPrice);
								  //alert(" onClickCell editIndex != undefined4");	
								  
								  //结束编辑行
								  $(this).datagrid('endEdit', editIndex);
									editIndex = undefined;
								}				
							}

							
						});

		$('#supName')
				.searchbox(
						{
							searcher : function(value, name) {
								//alert(value + "," + name);
								parent
										.$('#win')
										.window(
												{
													title : '选择供应商',
													width : 800,
													height : 600,
													modal : true,
													content : "<iframe src='${proPath}/base/goURL/supplier/selectretun.action' height='100%' width='100%' frameborder='0px' ></iframe>"
												});

							},
							prompt : '请选择供应商'
						});

		//禁用供应商信息的输入
		var box = $('#supName').searchbox('textbox');//获取控件文本框对象
		box.attr('disabled', true);// 设置无效，禁用输入

		$('#ff').form("disableValidation");

	});
</script>
</head>

<body class="mybody">
	<form class="myfm" style="padding:15px;margin:0px;background:#eee;"
		id="ff" action="" method="post">
		<div class="myftitle">请填写退货信息</div>
		<div class="myfitem2">
			<label>供应商：</label> <input type="hidden" id="supId" name="supId" /> <input
				type="text" id="supName" name="supName" /> 
				<label>仓库：</label><select id="cc"
				class="easyui-combobox" name="shId" style="width:200px;">
				<c:forEach items="${applicationScope.sysParam.shId}" var="shId">
					<option value="${shId.key}">${shId.value}</option>
				</c:forEach>
			</select> 
			<label>日期：</label><input type="text" id="roDate" class="easyui-datetimebox"
				name="roDate" required="required"></input>
		</div>
		<div class="myfitem2">
			<label>应退：</label><input type="text" id="roPayable" name="roPayable" />
			<label>已退：</label><input type="text" id="roPaid" name="roPaid" /> 
			<label>欠款：</label><input type="text" id="roArrears" name="roArrears" />
		</div>
		<div class="myfitem2">	
			<label>经手人：</label><input type="text" id="roOriginal" name="roOriginal" />
			<label>原始单号：</label><input type="text" 	id="roAttn" name="roAttn" /> 
			<label>操作员：</label><input type="text" id="roOperator" 	name="roOperator" /> 
		</div>
		<div class="myfitem2">
			<label>备注：</label><input type="text" id="roRemark" name="roRemark" />
		</div>
	</form>

	<table id="dg"></table>
</body>
</html>