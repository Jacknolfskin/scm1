<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<%@ include file="/common/common.jspf"%>
<title>My JSP</title>
</head>
<body>

	<form id="ff" class="myfm" method="post">
	<div class="myftitle">
			请修改用户的信息
		</div>
	   <div class="myfitem">
			<label for="accId">用户编号:</label> <input type="text" name="accId" readonly="readonly" />
		</div>
		<div class="myfitem">
			<label for="accName">用户名称:</label> <input type="text" name="accName" />
		</div>
		<div class="myfitem">
			<label for="accLogin">用户账户:</label> <input type="text"
				name="accLogin" />
		</div>
		<div class="myfitem">
			<label for="accPass">用户密码:</label> <input type="text"
				name="accPass" />
		</div>
		<div class="myfitem">
			<label for="accType">用户类型:</label> <select id="cc"
				class="easyui-combobox" name="accType" style="width:200px;">
					<option value="管理员">管理员</option>
					<option value="操作员">操作员</option>
					<option value="普通用户">普通用户</option>
			</select> 
		</div>
		<div class="myfitem">
			<a id="btn" href="#" class="easyui-linkbutton" >提交</a>  
			<a id="btn2" href="#" class="easyui-linkbutton" onclick="javascript:parent.$('#win').window('close');" >关闭</a>  
		</div>
	</form>
	<script type="text/javascript">
		$(function() {
			var win = parent.$("iframe[title='用户管理']").get(0).contentWindow;//返回ifram页面窗体对象（window)
			
			var row = win.$('#dg').datagrid("getSelected");
			//alert(row.accId);
			
			$('#ff').form('load',{
				accId:row.accId,
				accName:row.accName,
				accLogin:row.accLogin,
				accPass:row.accPass,
				accType:row.accType,
				
			});

			
		
			$("[name='accName']").validatebox({
				required : true,
				missingMessage : '请填写用户名称！'
			});
			$("[name='accLogin']").validatebox({
				required : true,
				missingMessage : '请填写账户！'
			});
			$("[name='accPass']").validatebox({
				required : true,
				missingMessage : '请填写账户密码！'
			});
			$("[name='accType']").validatebox({
				required : true,
				missingMessage : '请填写账户类型！'
			});
			
			//禁用验证
			$("#ff").form("disableValidation");

			$("#btn").click(function() {
				//alert("ddddddddddd");
				$("#ff").form("enableValidation");
				if ($("#ff").form("validate")) {
					//alert("------------");
					$('#ff').form('submit', {
						url : '${proPath}/account/update.action',
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
								win.$("#dg").datagrid("clearSelections");
						}
					});

				}

			});

		});
	</script>
</body>
</html>
