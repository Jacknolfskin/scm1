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
		margin-left:20px;	
		margin-top:8px;
	}
	tr td:first-child{
		text-align:right;
	}
</style>
</head>
<body>
	<div id="registerDiv">
		<form id="ff"  method="post" action="${proPath}/account/register.action">
		<table>
			<tr>
			<td align="right"><label for="accName">账户名称：</label></td>
			<td><input type="text" name="accName" id="accName" style="width:150px;border-radius:4px; border:2px solid #DBDBDB ;" /></td>
			</tr>
			
			<tr>
			<td><label for="accLogin">账户名：</label></td>
			<td><input type="text" name="accLogin" id="accLogin" style="width:150px;border-radius:4px; border:2px solid #DBDBDB ;"/></td>
			</tr>
			
			<tr>
			<td><label >账户密码：</label></td>
			<td><input type="text" name="accPass" id ="accPass" style="width:150px;border-radius:4px; border:2px solid #DBDBDB ;" /></td>
			</tr>
			
			<tr>
			<td><label >确认密码：</label></td>
			<td><input type="text"  id ="accPass1" onkeyup="pw()" style="width:150px;border-radius:4px; border:2px solid #DBDBDB ;" /></td>
			<span id="tishi"></span>
			</tr>
			
			<tr>
			<td><label for="accEmail">邮箱：</label></td>
			<td><input type="text" name="accEmail" style="width:150px;border-radius:4px; border:2px solid #DBDBDB ;"/></td>
			</tr>
			
			<tr>
			<td><label >账户类型：</label></td>
			<td><select id="cc" name="accType" style="width:150px;border-radius:4px; border:2px solid #DBDBDB ;">
					<option value="管理员">管理员</option>
					<option value="操作员">操作员</option>
					<option value="普通用户">普通用户</option>
			    </select></td>
			</tr>
			
		</table>
		</form>

		<div style="color:red">${requestScope.msg}</div>

	</div>
	
	<script type="text/javascript">
		
		$("[name='accLogin']").validatebox({
			required : true,
			missingMessage : '请填写账号！'
		});
		$("[name='accName']").validatebox({
			required : true,
			missingMessage : '请填写账号名称！'
		});
		$("[name='accEmail']").validatebox({
			required : true,
			missingMessage : '请填写用户邮箱！'
		});
		$("[name='accPass']").validatebox({
			required : true,
			missingMessage : '请填写密码！'
		});
		$("[name='accType']").validatebox({
			required : true,
			missingMessage : '请填写账户类型！'
		});
		//禁用验证
		$("#ff").form("disableValidation");
		
		
		
		//验证两次密码是否相同
		function pw() {
            var pw1 = document.getElementById("accPass").value;
            var pw2 = document.getElementById("accPass1").value;
            if(pw1 == pw2) {
                document.getElementById("tishi").innerHTML="<font color='green'>两次密码相同</font>";
                document.getElementById("submit").disabled = false;
            }
            else {
                document.getElementById("tishi").innerHTML="<font color='red'>两次密码不同</font>";
                document.getElementById("submit").disabled = true;
            }
        }
		
		//注册验证账号名称
		   $('#accName').blur(function(){
			    //alert("=============");
			    CheakNull("#accName");
				$.ajax({
					url:"${proPath}/account/registerverity.action",
					data:{"accName":$("#accName").val()},
					type:"post",
					async:false,
					success:function(msg){
						if(false==msg){
							 $.messager.alert("操作提示", "当前账号名称已被使用，请输入其他账号名称！","warning");
							 //$("#accName").focus();
						}
					}
				});
		});
		
		//注册验证账号
		 $('#accLogin').blur(function(){
			    CheckNull("#accLogin");
				$.ajax({
					url:"${proPath}/account/registerverity.action",
					data:{"accLogin":$("#accLogin").val()},
					type:"post",
					async:false,
					success:function(msg){
						if(false==msg){
							 $.messager.alert("操作提示", "当前账号已被使用，请输入其他账号！","warning");
						}
					}
				});
		});
		
		
		    //判断是否为空
			function JTrim(s)
			{
			    return s.replace(/(^\s*)|(\s*$)/g, "");
			}
			function CheckNull(msg){
				var msg2 = $(msg).val();
				if (JTrim(msg2) == ""){
			   		$.messager.alert("操作提示", "账户名为空！","warning");
			  	}
			}
		   	
		//把div的内容作为对话框方式弹出
		$('#registerDiv').dialog({
			title : '注册入口',
			width : 300,
			height : 300,
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
				text:'注册',
				handler:function(){
					//启用验证
					$("#ff").form("enableValidation");
					//进行验证，通过就提交
					if($("#ff").form("validate")){
					//提交
					        $.messager.alert("操作提示", "注册成功，请重新登录！","info");
							$("#ff").submit();
							
							
					}
				}
			}]
			
		});
		
	</script>
</body>
</html>
