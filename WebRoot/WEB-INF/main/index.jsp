<%--
  Created by IntelliJ IDEA.
  User: 那个抽烟的大爷
  Date: 2017/4/14
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/common/common.jspf"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="copyright" content="All Rights Reserved, Copyright (C) 2013, Wuyeguo, Ltd." />
    <%--<title>Power by Wuyeguo</title>--%>
    <script type="text/javascript">

        $(function() {
            $("a[title]").click(function() {
                var text = this.href;
                var ii = $(this).attr("data-icon");
                //alert(text);
                //判断是否存在
                if($('#tt').tabs("exists",this.title)){
                    //存在则选中
                    //alert("存在了");
                    $('#tt').tabs("select",this.title);
                }else{
                    $('#tt').tabs('add', {
                        title:this.title,
                        //面板有关闭按键
                        closable:true,
                        iconCls:ii,
                        //fit:true,
                        //href对远程页面js的支持不好
                        //href: text
                        //可以加载内容填充到选项卡，页面有Js时，也可加载
                        content:"<iframe src='"+text+"'  title='"+this.title+"' height='100%' width='100%' frameborder='0px' ></iframe>"
                    });

                }
                return false;

            });
        });
    </script>
</head>
<body class="easyui-layout">
<!-- begin of header -->
<div class="wu-header" data-options="region:'north',border:false,split:true">
    <div class="wu-header-left">
        <h1>欢迎使用进销存系统</h1>
    </div>
    <div class="wu-header-right">
        <p><strong class="easyui-tooltip" title="2条未读消息">${sessionScope.account.accLogin}</strong>，欢迎您！</p>
        <p><a href="${proPath}/base/goURL/main/main.action">网站首页</a>|<a href="#">支持论坛</a>|<a href="#">帮助中心</a>|<a href="#">安全退出</a></p>
    </div>
</div>
<!-- end of header -->
<!-- begin of sidebar -->
<div class="wu-sidebar" data-options="region:'west',split:true,border:true,title:'导航菜单'">
    <div class="easyui-accordion" data-options="border:false,fit:true">
        <div title="快捷菜单" data-options="iconCls:'icon-application-cascade'" style="padding:5px;">
            <ul class="easyui-tree wu-side-tree">
                <li iconCls="icon-chart-organisation"><a href="javascript:void(0)" iconCls="icon-chart-organisation" data-link="../temp/layout-1.html" >菜单导航</a></li>
                <li iconCls="icon-user-group"><a href="${proPath}/base/goURL/account/systemuser.action"  data-icon="icon-user-group" title="用户管理">用户管理</a></li>
                <li iconCls="icon-user-group"><a href="${proPath}/base/goURL/goods/goodslist.action" data-icon="icon-user-group" title="商品管理">商品管理</a></li>
                <li iconCls="icon-book"><a href="${proPath}/base/goURL/buyorder/insert.action" data-icon="icon-book" title="商品采购">商品采购</a></li>
            </ul>
        </div>
        <div title="内容管理" data-options="iconCls:'icon-application-form-edit'" style="padding:5px;">
            <ul class="easyui-tree wu-side-tree">
                <li iconCls="icon-chart-organisation"><a href="${proPath}/base/goURL/supplier/supplierlist.action" data-icon="icon-chart-organisation" title="供应商管理">供应商管理</a></li>
                <li iconCls="icon-book"><a href="${proPath}/base/goURL/goods/goodslist.action" data-icon="icon-book" title="商品管理">商品管理</a></li>
            </ul>
        </div>

        <div title="采购管理" data-options="iconCls:'icon-bricks'" style="padding:5px;">
            <ul class="easyui-tree wu-side-tree">
                <li iconCls="icon-chart-organisation"><a href="${proPath}/base/goURL/buyorder/insert.action"  data-icon="icon-chart-organisation" title="商品采购">商品采购</a></li>
                <li iconCls="icon-application-osx-error"><a href="${proPath}/base/goURL/returnorder/insert.action"  data-icon="icon-application-osx-error" title="商品退货" >商品退货</a></li>
            </ul>
        </div>

        <div title="订单管理" data-options="iconCls:'icon-cart'" style="padding:5px;">
            <ul class="easyui-tree wu-side-tree">
                <li iconCls="icon-book"><a href="${proPath}/base/goURL/accountRecords/accountRecords.action" data-icon="icon-book" title="订单明细">订单明细</a></li>
            </ul>
        </div>

        <div title="用户管理" data-options="iconCls:'icon-user-group'" style="padding:5px;">
            <ul class="easyui-tree wu-side-tree">
                <li iconCls="icon-user-group"><a href="${proPath}/base/goURL/account/systemuser.action"  data-icon="icon-user-group" title="用户管理">用户管理</a></li>
            </ul>
        </div>

        <div title="报表中心" data-options="iconCls:'icon-chart-curve'" style="padding:5px;">
            <ul class="easyui-tree wu-side-tree">
                <li iconCls="icon-chart-curve"><a href="${proPath}/base/goURL/datareport/selectsupplier.action" data-icon="icon-chart-curve" title="供应商采购额统计">供应商采购额统计</a></li>
            </ul>
        </div>
        <div title="系统设置" data-options="iconCls:'icon-wrench'" style="padding:5px;">
            <ul class="easyui-tree wu-side-tree">
                <li iconCls="icon-cog"><a href="javascript:void(0)" data-icon="icon-cog" onclick="exit();">退出系统</a></li>
            </ul>
        </div>
    </div>
</div>
<!-- end of sidebar -->
<!-- begin of main -->
<%--<div class="wu-main" data-options="region:'center'">
        <div id="wu-tabs" class="easyui-tabs" data-options="border:false,fit:true">
            <div title="首页" data-options="href:'temp/layout-1.html',closable:false,iconCls:'icon-tip',cls:'pd3'"></div>
        </div>
    </div>--%>
<div data-options="region:'center',title:'主要信息'" style="padding:5px;background:#eee;">
    <div id="tt" class="easyui-tabs" data-options="fit:true" style="width:500px;height:250px;">
        <div title="系统介绍" style="padding:20px;">这里可以写系统或公司的相关介绍等等 </div>
    </div>
</div>
<div id="win" ></div>
<!-- end of main -->
<!-- begin of footer -->
<div class="wu-footer" data-options="region:'south',border:true,split:true">
    &copy; 2017 胡飞版权，侵权必究
</div>
<!-- end of footer -->
<script type="text/javascript">

    $(function(){
        $('.wu-side-tree a').bind("click",function(){
            var title = $(this).text();
            var url = $(this).attr('href');
            var iconCls = $(this).attr('data-icon');
            var iframe = $(this).attr('iframe')==1?true:false;
            addTab(title,url,iconCls,iframe);
        });
    })

    /**
     * Name 载入树形菜单
     */
    $('#wu-side-tree').tree({
        url:'temp/menu.php',
        cache:false,
        onClick:function(node){
            var url = node.attributes['url'];
            if(url==null || url == ""){
                return false;
            }
            else{
                addTab(node.text, url, '', node.attributes['iframe']);
            }
        }
    });

    /**
     * Name 选项卡初始化
     */
    $('#wu-tabs').tabs({
        tools:[{
            iconCls:'icon-reload',
            border:false,
            handler:function(){
                $('#wu-datagrid').datagrid('reload');
            }
        }]
    });

    /**
     * Name 添加菜单选项
     * Param title 名称
     * Param href 链接
     * Param iconCls 图标样式
     * Param iframe 链接跳转方式（true为iframe，false为href）
     */
    function addTab(title, href, iconCls, iframe){
        var tabPanel = $('#wu-tabs');
        if(!tabPanel.tabs('exists',title)){
            var content = '<iframe scrolling="auto" frameborder="0"  src="'+ href +'" style="width:100%;height:100%;"></iframe>';
            if(iframe){
                tabPanel.tabs('add',{
                    title:title,
                    content:content,
                    iconCls:iconCls,
                    fit:true,
                    cls:'pd3',
                    closable:true
                });
            }
            else{
                tabPanel.tabs('add',{
                    title:title,
                    href:href,
                    iconCls:iconCls,
                    fit:true,
                    cls:'pd3',
                    closable:true
                });
            }
        }
        else
        {
            tabPanel.tabs('select',title);
        }
    }

    /*退出系统*/
    function exit() {
        $.messager.confirm("操作提示","确定要退出系统吗？",function(data){
            if(data){
                window.location.href="/scm1/servlet/LoginOutServlet";
            }else{
                console.log("false");
            }
        });
    }
</script>
</body>
</html>

