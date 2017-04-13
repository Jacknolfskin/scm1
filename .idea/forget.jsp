<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ include file="/common/common.jspf"%>
<title>Login page</title>
<style type="text/css">
	tr{
		line-height:30px;
		height:30px;
		font-size:13px;
	}
	form{
		margin-left:22px;	
		margin-top:18px;
	}
	tr td:first-child{
		text-align:right;
	}
</style>
</head>
<body>
	<div id="registerDiv">
		<form id="ff"  method="post" action="${proPath}/foundPass/forget.action">
		<table>
			<tr>
			<td><label for="accLogin">账户：</label></td>
			<td><input type="text" name="accLogin" id ="accLogin"style="width:150px;border-radius:4px; border:2px solid #DBDBDB ;"/></td>
			</tr>
			
			<tr>
			<td><label for="accEmail">注册邮箱：</label></td>
			<td><input type="text" name="accEmail" id ="accEmail" style="width:150px;border-radius:4px; border:2px solid #DBDBDB ;"/></td>
			</tr>
		</table>
		</form>
	</div>
			
	<script type="text/javascript">
	
		$("[name='accLogin']").validatebox({
			required : true,
			missingMessage : '请填写账号！'
		});
		$("[name='accEmail']").validatebox({
			required : true,
			missingMessage : '请填写注册邮箱！'
		});
		//禁用验证
		$("#ff").form("disableValidation");

		
		//把div的内容作为对话框方式弹出
		$('#registerDiv').dialog({
			title : '找回密码',
			width : 300,
			height : 170,
			closed : false,
			cache : false,
			//设置关闭按钮可见
			closable : false,
			//模式化窗口.如果为true将锁屏
			modal : true, 
			buttons:[{
				text:'返回',
				handler:function(){
					
					window.history.back();

			}
			},{
				text:'提交',
				handler:function(){
					 //$.messager.alert("操作提示",${requestS},"info");
					//启用验证
					$("#ff").form("enableValidation");
					//进行验证，通过就提交
					if($("#ff").form("validate")){
					//提交
					$.messager.alert("操作提示", "提交成功！", "info", function () { 
							
				            $("#ff").submit();
				
				        });  
					}
				}
			}]
		});
		
	</script>
</body>
</html>
