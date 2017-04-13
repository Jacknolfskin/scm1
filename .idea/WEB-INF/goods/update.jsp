<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<%@ include file="/common/common.jspf"%>
<title>My JSP</title>
</head>
<body>

	<form id="ff" class="myfm" method="post">
	<div class="myftitle">
			请修改商品的信息
		</div>
	   <div class="myfitem">
			<label for="goodsId">商品编号:</label> <input type="text" name="goodsId" readonly="readonly" />
		</div>
		<div class="myfitem">
			<label for="goodsName">商品名称:</label> <input type="text" name="goodsName" />
		</div>
		<div class="myfitem">
			<label for="goodsUnit">商品单位:</label> <input type="text"
				name="goodsUnit" />
		</div>
		<div class="myfitem">
			<label for="goodsColor">商品颜色:</label> <input type="text"
				name="goodsColor" />
		</div>
		<div class="myfitem">
			<label for="goodsType">商品型号:</label> <input type="text"
				name="goodsType" />
		</div>
		<div class="myfitem">
			<a id="btn" href="#" class="easyui-linkbutton" >提交</a>  
			<a id="btn2" href="#" class="easyui-linkbutton" onclick="javascript:parent.$('#win').window('close');" >关闭</a>  
		</div>
	<script type="text/javascript">
		$(function() {
			var win = parent.$("iframe[title='商品管理']").get(0).contentWindow;//返回ifram页面窗体对象（window)
			
			var row = win.$('#dg').datagrid("getSelected");
			//alert(row.supId);
			
			$('#ff').form('load',{
				goodsId:row.goodsId,
				goodsName:row.goodsName,
				goodsUnit:row.goodsUnit,
				goodsType:row.goodsType,
				goodsColor:row.goodsColor,
				
			});

			
		
			$("[name='supName']").validatebox({
				required : true,
				missingMessage : '请填写商品名称！'
			});
			//禁用验证
			$("#ff").form("disableValidation");

			$("#btn").click(function() {
				//alert("ddddddddddd");
				$("#ff").form("enableValidation");
				if ($("#ff").form("validate")) {
					//alert("------------");
					$('#ff').form('submit', {
						url : '${proPath}/goods/update.action',
						onSubmit : function() {
							return true;
						},
						success : function(count) {							
								//可以定义为对应消息框
								if(count>0){
									alert("修改成功！");									
								}else{
									alert("修改失败！");
								}
								parent.$("#win").window("close");
								win.$("#dg").datagrid("reload");							
						}
					});

				}

			});

		});
	</script>
</body>
</html>
