<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/common/common.jspf"%>
<html>
<head>


<title></title>
<style type="text/css">
.searchbox{
	margin:-5
}

.hide{
	display:none;
}
</style>



<script type="text/javascript">
	$(function(){
	
			$('#dg').datagrid({    
			    //url:'${proPath}/supplier/selectPage.action', //通过关键字查询
			    //支持多条件查询
			    url:'${proPath}/account/selectPageUseDyc.action', 
			    
			    fitColumns:true,
			    nowrapL:true,
			    idField:'accId',
			    rownumbers:true,
			    pagination:true,
			    pageSize:10,
			    pageList:[2,5,10,20],
			    
			     queryParams: {
					accLogin:'%%',
					accType:'%%'			
				}, 
						    
			    toolbar: [{
					iconCls: 'icon-edit',
					text:'修改',
					handler: function(){
						//alert('修改按钮');
						//判断是否选中一行，并且只能选中一行进行修改
						var array = $('#dg').datagrid("getSelections");
						if(array.length!=1){
                            $.messager.alert("操作提示", "请选择需要修改的记录，并且只能选中一条！","warning");
							return false;							
						}
						
						//打开修改窗口
						parent.$('#win').window({    
							title :'修改用户信息',
						    width:600,    
						    height:400,    
						    modal:true,
						    content:"<iframe src='${proPath}/base/goURL/account/update.action' height='100%' width='100%' frameborder='0px' ></iframe>"  
						}); 
						
					}
				},'-',{
					iconCls: 'icon-remove',
					text:'删除',
					handler: function(){
						//alert('删除按钮');
						var array = $('#dg').datagrid("getSelections");
						if(array.length>0){
							//alert("选中");
							
							
							//定义数组，通过下边的用来存储选中记录的Id
						var ids = new Array();
						for (i = 0; i < array.length; i++) {
							ids[i] = array[i].supId;
							//alert(ids[i]);
						}
						//alert("ids" + ids);
						//如果需要锁整个页面，前面加parent.
						parent.$.messager.confirm('删除对话框', '您确认要删除吗？', function(r) {
							if (r) {
								//alert(r);
								$.ajax({
								  url: "${proPath}/account/deleteList.action",
								  type:"POST",
								  //设置为传统方式传送参数
								  traditional:true,
								  data:{pks:ids},
								  success: function(html){
                                      if(html>0){
                                          $.messager.alert("操作提示", "恭喜您 ，删除成功，共删除了"+html+"条记录","info");
                                          //alert("恭喜您 ，删除成功，共删除了"+html+"条记录");
                                      }else{
                                          $.messager.alert("操作提示", "对不起，删除失败","error");
                                          //alert("对不超 ，删除失败");
                                      }
								  //重新刷新页面
								    $("#dg").datagrid("reload");
								    //请除所有勾选的行
								    $("#dg").datagrid("clearSelections");
								  },
								  error: function (XMLHttpRequest, textStatus, errorThrown) {
									    $.messager.alert('删除错误','请联系管理员！','error');
									},
								  dataType:'json'
								});
							}
						});
						}else{
                            $.messager.alert("操作提示", "请选择需要删除的记录！","warning");
						}
					}
				},'-',{
					text:"用户账号：<input type='text' id='accLogin' name='accLogin'/>",					
				}
				,'-',{
					text:"用户类型：<input type='text' id='accType' name='accType'/>",					
				}],			       
			    

				columns : [ [{
					checkbox:true,
				}, {
				field : 'accId',
				title : '用户编号'
			}, {
				field : 'accName',
				title : '用户名称',
				width : 100
			},{
				field : 'accLogin',
				title : '用户账号',
				width : 100
			}, {
				field : 'accPass',
				title : '用户密码',
				width : 100,
				formatter:function(val,rec){
					//var len = val.length;
			          return "************";
			        }
			}, {
				field : 'accType',
				title : '用户类型',
				width : 100
			}] ]
		});
		
			$('#accType').searchbox({ 
			searcher:function(value,name){
				$('#dg').datagrid('load',{
					accLogin: '%'+$('#accLogin').val()+'%',
				    accType:'%'+value+'%'		
				});					
			}, 
			prompt:'' 
		});
		

	});
</script>
</head>
<body>
	<table id="dg"></table>
</body>
</html>