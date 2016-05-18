<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2016/2/29
  Time: 15:57
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
    <script src="resources/common/js/require.js" data-main="modules/admin/js/addDispatch"></script>
    <title></title>
</head>
<body>
<div id="wrapper">

    <!-- Navigation -->

    <%@include file="navigation.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">添加调度信息
                </h1>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <br>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-6">
                                <label>车辆编号</label>

                                <div class="form-group form-inline">
                                    <input type="text" class="form-control choose-vehicle-input" placeholder="请选择" readonly>
                                    <button class="btn btn-primary choose-vehicle">
                                        选择车辆
                                    </button>
                                </div>
                                <label>司机编号</label>

                                <div class="form-group form-inline">
                                    <input class="form-control choose-driver-input" placeholder="请选择" readonly>
                                    <button class="btn btn-primary choose-driver">
                                        选择司机
                                    </button>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>始发地</label>
                                    <input id="origin-place" class="form-control">

                                    <p class="help-block">具体到区县</p>
                                </div>
                                <div class="form-group">
                                    <label>目的地</label>
                                    <input id="destination" class="form-control">

                                    <p class="help-block">具体到区县</p>
                                </div>
                            </div>
                            <div class="col-xs-4 col-xs-offset-4" style="text-align: center;">
                                <button id="commitDispatch" type="button" class="btn btn-primary">提交</button>
                            </div>

                        </div>
                        <div class="row">
                            <div class="alert alert-danger dispatch-alter" style="display: none;" role="alert">
                                信息不完整
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</div>
<div id="vehicle-modal" style="display: none;" class="easyui-window" title="Modal Window" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:430px;height:380px;padding:10px;">
    <table id="dg-vehicle" class="easyui-datagrid"
           style="width:405px;height:250px"
           data-options="singleSelect:false">
        <thead>
        <tr>
            <th data-options="field:'ck',checkbox:true"></th>
            <th data-options="field:'id',width:80">id</th>
            <th data-options="field:'plateNumber',width:100">车牌</th>
            <th data-options="field:'vehicleType',width:80,align:'right'">车辆类型</th>
            <th data-options="field:'ownerName',width:80,align:'right'">车主</th>
        </tr>
        </thead>
    </table>
    <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
        <a class="easyui-linkbutton dlg-confirm" data-options="iconCls:'icon-ok'" style="width:80px">Ok</a>
    </div>
</div>

<div id="driver-modal" style="display: none;" class="easyui-window" title="Modal Window" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:430px;height:380px;padding:10px;">
    <table id="dg-driver" class="easyui-datagrid"
           style="width:405px;height:250px"
           data-options="singleSelect:false">
        <thead>
        <tr>
            <th data-options="field:'ck',checkbox:true"></th>
            <th data-options="field:'id',width:80">id</th>
            <th data-options="field:'name',width:100">姓名</th>
            <th data-options="field:'driverLicenceType',width:80,align:'right'">驾照类型</th>
            <th data-options="field:'driverYears',width:80,align:'right'">驾龄</th>
        </tr>
        </thead>
    </table>
    <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
        <a class="easyui-linkbutton dlg-confirm" data-options="iconCls:'icon-ok'" style="width:80px">Ok</a>
    </div>
</div>
</body>
</html>
