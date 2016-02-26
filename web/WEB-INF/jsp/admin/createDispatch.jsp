<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2016/2/22
  Time: 20:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title></title>
</head>
<body>

<div id="wrapper">

    <!-- Navigation -->
    <%@include file="navigation.jsp"%>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">创建运单</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Basic Form Elements
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-6">
                                <form role="form">
                                    <div class="form-group">
                                        <label>货物名称</label>
                                        <input id="itemName" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>始发地</label>
                                        <input id="originPlace" class="form-control">
                                        <p class="help-block">具体到区县</p>
                                    </div>
                                    <div class="form-group">
                                        <label>目的地</label>
                                        <input id="destination" class="form-control">
                                        <p class="help-block">具体到区县</p>
                                    </div>
                                    <label>价格</label>
                                    <div class="input-group form-group">
                                        <span class="input-group-addon">￥</span>
                                        <input id="expense" type="number" class="form-control">
                                        <span class="input-group-addon">元</span>
                                    </div>
                                </form>
                            </div>
                            <!-- /.col-lg-6 (nested) -->
                            <div class="col-lg-6">
                                <label>重量</label>
                                <div class="input-group form-group">
                                    <input id="weight" type="number" class="form-control">
                                    <span class="input-group-addon">千克</span>
                                </div>
                                <div class="form-group">
                                    <label>发件人</label>
                                    <input id="sender" class="form-control">
                                    <p class="help-block">Example block-level help text here.</p>
                                </div>
                                <div class="form-group">
                                    <label>收件人</label>
                                    <input id="receiver" class="form-control">
                                    <p class="help-block">Example block-level help text here.</p>
                                </div>
                            </div>
                            <!-- /.col-lg-6 (nested) -->
                        </div>
                        <!-- /.row (nested) -->
                        <div class="col-xs-4 col-xs-offset-4" style="text-align: center;">
                            <button id="commitWayBill" type="button" class="btn btn-primary">提交</button>
                        </div>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>


        <!-- /.row -->
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->



</body
        >
</html>
