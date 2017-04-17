<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ include file="/common/common.jspf"%>
<title>Login page</title>
<style type="text/css">
	#box{position:relative;}
	#box i{position:absolute;right:9px;top:-2px;width:20px;height:20px;background:url(icon/closeEye.svg) no-repeat center center;background-size:100%;}
	#box i.open{background:url(icon/openEye.svg) no-repeat center center;background-size:100%;}
</style>
</head>
<body>
	<div id="loginDiv">
		<form id="ff"  method="post" action="${proPath}/account/login.action">
			<div >
			<p>&nbsp;&nbsp;&nbsp;
				<label for="accLogin">账&nbsp;&nbsp;&nbsp;户:</label>
				<!-- 采用 js验证 -->
				<span class="user-icon"></span>
				<input type="text" name="accLogin" placeholder="请输入账户或账户名称 " style="width:150px;border-radius:4px; border:2px solid #DBDBDB ;"/>
			</p>
			</div>
			
			<div >
			<p>&nbsp;&nbsp;&nbsp;
				<label for="accPass">密&nbsp;&nbsp;&nbsp;码:</label>
				<!-- //行内验证
				<input class="easyui-validatebox" type="text" name="name"
					data-options="required:true,missingMessage:'请填写密码！'" /> -->
				<span id="box">
				<input type="password" name="accPass" id="id3" style="width:150px;border-radius:4px; border:2px solid #DBDBDB ;"/>
				<i id="ii" onclick="ps();"></i>
				</span>
				<span id="click"><a href="${proPath}/forget.jsp">忘记密码？</a></span>
				</p>
			</div>
			<div >
			<p>&nbsp;&nbsp;&nbsp;
				<label >验证码:</label>
				<input type="text" name="accWord" id ="accWord" style="width:150px;vertical-align:middle;border-radius:4px; border:2px solid #DBDBDB ;" />
				<img src="${proPath}/account/randImage.action" style="vertical-align:middle;border:1px solid #F0F8FF;height:19px;border-radius:4px; border:2px solid #DBDBDB ;" onclick="changeValidateCode(this);">
				
				<!-- 采用 js验证 -->
				</p>
			</div>
			<%--<input value="清空全部" onClick="doReset()" type="button">--%>
			<!-- <p>&nbsp;&nbsp;&nbsp;
				<input type="checkbox" checked="checked" id="rem" />
                <label for="rem">记住密码</label>
				</p>
			</div> -->
			
		</form>
		<div style="color:red">${requestScope.msg}</div>
	</div>
	<script type="text/javascript">
		//清空输入框
       /* function doReset(){
            for(i=0;i<document.all.tags("input").length;i++){
                if(document.all.tags("input")[i].type=="text"){
                    document.all.tags("input")[i].value="";
                }
            }
        }*/

        //闭眼到睁眼
	function ps(){
		if($("#id3").attr("type")=="password"){
			$("#box").html("<input type='text' id='id3' name='accPass' value='"+$("#id3").val()+"' style='width:150px;border-radius:4px;border:2px solid #DBDBDB;'> <i id='ii' class='open' onclick='txt();'></i>");
		}
	};
	//睁眼到闭眼
	function txt(){
		if($("#id3").attr("type")=="text"){
			$("#box").html("<input type='password' id='id3' name='accPass' value='"+$("#id3").val()+"' style='width:150px;border-radius:4px;border:2px solid #DBDBDB;'> <i id='ii' onclick='ps();'></i>");
		} 
	}

		/*
		 *＄｛选择器｝把ｄｏｍ对象转为ｊｑｕｅｒｙ对象，一般再处理成easyUI对象
		 *例如　把$("name='accName'")validatebox({})转为easyUI对象
		 *easyUI对象就可以使用相关的语法进行处理，如：$('selector').plugin('method', parameter); 
		 */
		//alert("ddddd");
		//这里的大括号相关于写json格式的数据：{属性：值，属性：值}
		//alert("ddddd");
		$("[name='accLogin']").validatebox({
			required : true,
			missingMessage : '请填写账号！'
		});
		$("[name='accPass']").validatebox({
			required : true,
			missingMessage : '请填写密码！'
		});
		$("[name='accWord']").validatebox({
			required : true,
			missingMessage : '请填写验证码！'
		});
		//禁用验证
		$("#ff").form("disableValidation");
		
		
		
		//取出传回来的参数error并与yes比较
		  var errori ='<%=request.getParameter("error")%>';
		  if(errori=='yes'){
		   //alert("登录失败!");
		   $.messager.alert("操作提示", "您未登录，请重新登录！","warning");
		  }
		

		//验证码
		function changeValidateCode(obj) {   
				//获取当前的时间作为参数，读取时就不会读取缓存中的内容   
			var timenow = new Date().getTime();   
				//每次请求需要一个不同的参数，否则可能会返回同样的验证码   
				//这和浏览器的缓存机制有关系，也可以把页面设置为不缓存，这样就不用这个参数了。   
			obj.src="${proPath}/account/randImage.action?d="+timenow;
			}
		//var inputCode = document.getElementByName("accWord").value.toUpperCase(); //取得输入的验证码并转化为大写   
		
		//把div的内容作为对话框方式弹出
		$('#loginDiv').dialog({
			title : '登陆入口',
			width : 300,
			height : 200,
			closed : false,
			cache : false,
			//设置关闭按钮可见
			closable : false,
			//模式化窗口.如果为true将锁屏
			modal : true, 
			buttons:[{
				text:'登陆',
				handler:function(){
					//alert("可以登陆了");
					//启用验证
					$("#ff").form("enableValidation");
					//进行验证，通过就提交
					if($("#ff").form("validate")){
					//提交
							$("#ff").submit();
					
					}
					
				}
			},{
				text:'注册',
				handler:function(){
					//alert("---------------");
					//request.getRequestDispatcher("register.jsp").forward(request.response);
					window.location.href="register.jsp";

			}
			}]
			
		});
		
	</script>
</body>
</html>
