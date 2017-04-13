<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ include file="/common/common.jspf"%>
<title>Login page</title>
<style type="text/css">
	.ff{
		text-align:center;
		margin-top:200px;
		font-size:20px;
	}
</style>
</head>
<script language="JavaScript1.2" type="text/javascript"> 
function delayURL(url) { 
var delay=document.getElementById("time").innerHTML; 
//最后的innerHTML不能丢，否则delay为一个对象 
if(delay>0){ 
delay--; 
document.getElementById("time").innerHTML=delay; 
}else{ 
window.top.location.href=url; 
} 
setTimeout("delayURL('" + url + "')", 1000); 
//此处1000毫秒即每一秒跳转一次 
} 
</script> 
<body style="background-color:#ccc;">
 
<div class="ff">
<span id="time" style="color: red;font-size:30px;">7</span> 
秒钟之后自动跳转，如果不跳转，请点击链接 
<a href="http://localhost:8080/scm1/login.jsp">登录页面</a> 
</div>

<script type="text/javascript"> 
delayURL("http://localhost:8080/scm1/login.jsp"); 
</script> 
</body>
</html>
