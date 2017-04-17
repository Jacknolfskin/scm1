<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<%@ include file="/common/common.jspf"%>
<title>My JSP</title>
</head>
<body class="mybody">

	<form id="ff" class="myfm" method="post">
	<div class="myftitle">
			请输入商品的信息
		</div>
	   <div class="myfitem">
			<label for="goodsId">商品编号:</label> <input type="text" name="goodsId" />
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
				<!-- <div class="myfitem">
			<label for="goodsStore">库存下限:</label> <input type="text"
				name="goodsStore" />
				</div>
				<div class="myfitem">
			<label for="goodsLimit">有效的修改时间:</label> <input type="text"
				name="goodsLimit" />
				</div>
				<div class="myfitem">
			<label for="goodsCommission">提成:</label> <input type="text"
				name="goodsCommission" />
				</div>
				<div class="myfitem">
			<label for="goodsProducer">生产商:</label> <input type="text"
				name="goodsProducer" />
				
				</div>
				<div class="myfitem">
			<label for="goodsSelPrice">售价:</label> <input type="text"
				name="goodsSelPrice" />
				</div>
				<div class="myfitem">
			<label for="goodsBuyPrice">进价:</label> <input type="text"
				name="goodsBuyPrice" />
		
		<div class="myfitem">
			<label for="Remark">备注:</label>
			<textarea name="Remark"></textarea>
		</div> -->
		<div class="myfitem">
			<a id="btn" href="#" class="easyui-linkbutton" >提交</a>  
			<a id="btn2" href="#" class="easyui-linkbutton" onclick="javascript:parent.$('#win').window('close');" >关闭</a>  
		</div>
	</form>

	<script type="text/javascript">
		$(function() {
			var win = parent.$("iframe[title='商品管理']").get(0).contentWindow;//返回ifram页面窗体对象（window)
		
			$("[name='goodsName']").validatebox({
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
						url : '${proPath}/goods/insert.action',
						onSubmit : function() {
							return true;
						},
						success : function(count) {							
								//可以定义为对应消息框
								if(count>0){
									alert("添加成功！");									
								}else{
									alert("添加失败！");
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
