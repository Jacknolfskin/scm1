<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ include file="/common/common.jspf"%>
<title>Login page</title>
</head>
<body>
	<div id="registerDiv">
		<form id="ff"  method="post" action="${proPath}/foundPass/updateAccPass.action">
			<div >
			<p>&nbsp;&nbsp;&nbsp;
				<label >&nbsp;&nbsp;&nbsp;新密码:</label>
				<input type="password" name="accPass" id ="accPass" style="width:150px;border-radius:4px; border:2px solid #DBDBDB ;" />
				</p>
			</div>
			
			<div >
			<p>&nbsp;&nbsp;&nbsp;
				<label >确认密码:</label>
				<input type="password" id ="accPass1" onkeyup="pw()" style="width:150px;border-radius:4px; border:2px solid #DBDBDB ;" />
				<span id="tishi"></span>
				</p>
			</div>
		</form>
		<div style="color:red">${requestScope.msg}</div>
	</div>
	<script type="text/javascript">
		
		
		$("[name='accPass']").validatebox({
			required : true,
			missingMessage : '请填写密码！'
		});
		//禁用验证
		$("#ff").form("disableValidation");
		
		//验证两次密码是否相同
		function pw() {
            var pw1 = document.getElementById("accPass").value;
            var pw2 = document.getElementById("accPass1").value;
            if(pw1 == pw2) {
                document.getElementById("tishi").innerHTML="<font color='green'>两次密码相同</font>";
            }
            else {
                document.getElementById("tishi").innerHTML="<font color='red'>两次密码不同</font>";
            }
        }
		
		
		//把div的内容作为对话框方式弹出
		$('#registerDiv').dialog({
			title : '重置密码',
			width : 300,
			height : 250,
			closed : false,
			cache : false,
			//设置关闭按钮可见
			closable : false,
			//模式化窗口.如果为true将锁屏
			modal : true, 
			buttons:[{
				text:'返回',
				handler:function(){
					
					window.location.href = "http://localhost:8080/scm1/login.jsp";

			}
			},{
				text:'提交',
				handler:function(){
					//启用验证
					$("#ff").form("enableValidation");
					//进行验证，通过就提交
					if($("#ff").form("validate")){
					//提交
					$.messager.alert("操作提示", "修改成功,请重新登录！", "info", function () { 
						
						            $("#ff").submit();
						
						        });  
					}
				}
			}]
			
		});
		
		
		
	</script>
</body>
</html>
