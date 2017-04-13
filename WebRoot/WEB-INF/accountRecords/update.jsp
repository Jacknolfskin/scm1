<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<%@ include file="/common/common.jspf"%>
<title>My JSP</title>
</head>
<body>

	<form id="ff" class="myfm" method="post">
	<div class="myftitle">
			请修改进销明细的信息
		</div>
	   <div class="myfitem">
			<label for="supId">供应商编号:</label> <input type="text" name="supId" />
		</div>
		<div class="myfitem">
			<label for="arBusType">交易类型:</label> <input type="text" name="arBusType" />
		</div>
		<div class="myfitem">
			<label for="arPayable">应付:</label> <input type="text"
				name="arPayable" />
		</div>
		<div class="myfitem">
			<label for="arPaid">已付:</label> <input type="text"
				name="arPaid" />
		</div>
		<div class="myfitem">
			<label for="arArrears">欠款:</label> <input type="text"
				name="arArrears" />
		</div>
		<div class="myfitem">
			<label for="arDiscount">优惠金额:</label> <input type="text"
				name="arDiscount" />
		</div>
		<div class="myfitem">
			<label for="arAttn">原始单号:</label> <input type="text"
				name="arAttn" />
		</div>
		<div class="myfitem">
			<label for="arOperator">操作员:</label> <input type="text"
				name="arOperator" />
		</div>
		<div class="myfitem">
			<label for="arDate">交易时间:</label> <input type="text"
				name="arDate" ></input>
		</div>
		<div class="myfitem">
			<label for="arId">交易编号:</label> <input type="text"
				name="arId" />
		</div>
		<div class="myfitem">
			<label for="arRemark">备注:</label>
			<textarea name="arRemark"></textarea>
		</div>
		<div class="myfitem">
			<a id="btn" href="#" class="easyui-linkbutton" >提交</a>  
			<a id="btn2" href="#" class="easyui-linkbutton" onclick="javascript:parent.$('#win').window('close');" >关闭</a>
		</div>
	</form>

	<script type="text/javascript">
		$(function() {
			var win = parent.$("iframe[title='进销明细']").get(0).contentWindow;//返回ifram页面窗体对象（window)
			
			var row = win.$('#dg').datagrid("getSelected");
			alert(row.supId);
			
			$('#ff').form('load',{
				supId:row.supId,
				arBusType:row.arBusType,
				arPayable:row.arPayable,
				arPaid:row.arPaid,
				arArrears:row.arArrears,
				arDiscount:row.arDiscount,
				arAttn:row.arAttn,
				arOperator:row.arOperator,
				arDate:row.arDate,
				arRemark:row.arRemark,
				arId:row.arId,
			});

			
		
			$("[name='supId']").validatebox({
				required : true,
				missingMessage : '请填写供应商编号！'
			});
			$("[name='arAttn']").validatebox({
				required : true,
				missingMessage : '请填写原始单号！'
			});
			$("[name='arOperator']").validatebox({
				required : true,
				missingMessage : '请填写操作员姓名！'
			});
			//禁用验证
			$("#ff").form("disableValidation");

			$("#btn").click(function() {
				//alert("ddddddddddd");
				$("#ff").form("enableValidation");
				if ($("#ff").form("validate")) {
					//alert("------------");
					$('#ff').form('submit', {
						url : '${proPath}/accountRecords/update.action',
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
