<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2016/2/29
  Time: 9:59
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
    <script src="resources/common/js/require-config.js"></script>
    <script src="resources/common/js/require.js" data-main="modules/admin/js/dispatchDetail"></script>
    <title></title>
</head>
<body>
<div id="wrapper">

    <!-- Navigation -->

    <%@include file="navigation.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">管理调度信息
                </h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <button class="btn btn-primary" id="send-btn" style="display: none;">发车</button>
                        <button class="btn btn-danger" id="arrival-btn" style="display: none;">抵达</button>
                    </div>
                    <div class="panel-body">
                        <div class="row container-fluid" id="dispatch-list">
                            <div class="row">
                                <div class="col-xs-8">
                                    <table id="pg" class="easyui-propertygrid" style="width:300px"
                                           data-options="showGroup:true,scrollbarSize:0">
                                    </table>
                                </div>
                            </div>
                            <div class="row state0" style="display: none;">
                                <div class="col-xs-6">
                                    <table id="dg" class="easyui-datagrid" title="选择要运输的货物"
                                           style="width:450px;height:250px"
                                           data-options="singleSelect:false">
                                        <thead>
                                        <tr>
                                            <th data-options="field:'ck',checkbox:true"></th>
                                            <th data-options="field:'id',width:80">id</th>
                                            <th data-options="field:'itemName',width:100">名称</th>
                                            <th data-options="field:'originPlace',width:80,align:'right'">始发地</th>
                                            <th data-options="field:'destination',width:80,align:'right'">目的地</th>
                                            <th data-options="field:'weight',width:80">重量</th>
                                        </tr>
                                        </thead>
                                    </table>
                                    <button class="btn btn-primary" id="add-dispatch">确认</button>

                                </div>

                                <div class="col-xs-6">
                                    <table id="delete-dg" class="easyui-datagrid" title="选择要删除的货物"
                                           style="width:450px;height:250px"
                                           data-options="singleSelect:false">
                                        <thead>
                                        <tr>
                                            <th data-options="field:'ck',checkbox:true"></th>
                                            <th data-options="field:'id',width:80">id</th>
                                            <th data-options="field:'itemName',width:100">名称</th>
                                            <th data-options="field:'originPlace',width:80,align:'right'">始发地</th>
                                            <th data-options="field:'destination',width:80,align:'right'">目的地</th>
                                            <th data-options="field:'weight',width:80">重量</th>
                                        </tr>
                                        </thead>
                                    </table>
                                    <button class="btn btn-primary" id="delete-dispatch">删除</button>

                                </div>
                            </div>
                            <div class="row state1" style="display: none;">
                                <div class="col-xs-6">
                                    <table id="list-dg" class="easyui-datagrid" title="货物列表"
                                           style="width:450px;height:250px"
                                           data-options="singleSelect:false">
                                        <thead>
                                        <tr>
                                            <th data-options="field:'id',width:80">id</th>
                                            <th data-options="field:'itemName',width:100">名称</th>
                                            <th data-options="field:'originPlace',width:80,align:'right'">始发地</th>
                                            <th data-options="field:'destination',width:80,align:'right'">目的地</th>
                                            <th data-options="field:'weight',width:80">重量</th>
                                        </tr>
                                        </thead>
                                    </table>
                                </div>
                            </div>
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
</body>
</html>
