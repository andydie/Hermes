<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2016/2/24
  Time: 11:33
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
    <script src="resources/common/js/require.js" data-main="modules/admin/js/manageVehicle"></script>
    <style type="text/css">
        .navbar-top-links li {
            display: inline-block;
        }
    </style>
    <title></title>
</head>
<body>

<div id="wrapper">

    <!-- Navigation -->

    <%@include file="navigation.jsp"%>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">管理车辆
                </h1>
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

                            <!-- /.col-lg-6 (nested) -->
                            <div class="col-xs-12 table-responsive">
                                <table id="vehicleTable" class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>id</th>
                                        <th>plate number</th>
                                        <th>vehicle type</th>
                                        <th>owner name</th>
                                        <th>owner tel</th>
                                        <th>owner id</th>
                                        <th>owner address</th>
                                        <th>owner remark</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    </tbody>
                                </table>
                            </div>
                            <!-- /.col-lg-6 (nested) -->
                        </div>
                        <!-- /.row (nested) -->
                        <div class="col-xs-4 col-xs-offset-4" style="text-align: center;">
                            <button id="addVehicle" type="button" class="btn btn-primary">ADD</button>
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
    <div class="vehicle-modal modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">添加Vehicle</h4>
                </div>
                <div class="modal-body row">
                    <div class="col-xs-12">
                        <div class="input-group form-group">
                            <span class="input-group-addon">车辆牌号</span>
                            <input type="text" class="form-control plateNumber" >
                        </div>
                        <div class="input-group form-group">
                            <span class="input-group-addon">车辆类型</span>
                            <input type="text" class="form-control vehicleType" >
                        </div>
                        <div class="input-group form-group">
                            <span class="input-group-addon">车主姓名</span>
                            <input type="text" class="form-control ownerName" >
                        </div>
                        <div class="input-group form-group">
                            <span class="input-group-addon">车主电话</span>
                            <input type="tel" class="form-control ownerTel" >
                        </div>

                        <div class="input-group form-group">
                            <span class="input-group-addon">车主身份证</span>
                            <input type="text" class="form-control ownerIdNumber" >
                        </div>

                        <div class="input-group form-group">
                            <span class="input-group-addon">车主住址</span>
                            <input type="text" class="form-control ownerAddress" >
                        </div>
                        <div class="input-group form-group">
                            <span class="input-group-addon">备注</span>
                            <input type="text" class="form-control remark" >
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default modal-close" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary modal-confirm">Save changes</button>
                </div>
            </div>
        </div>
    </div>

    <div class="update-vehicle-modal modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" class="myModalLabel">修改</h4>
                </div>
                <div class="modal-body row">
                    <div class="col-xs-12">
                        <input type="text" class="hidden id">
                        <div class="input-group form-group">
                            <span class="input-group-addon">车辆牌号</span>
                            <input type="text" class="form-control plateNumber" >
                        </div>
                        <div class="input-group form-group">
                            <span class="input-group-addon">车辆类型</span>
                            <input type="text" class="form-control vehicleType" >
                        </div>
                        <div class="input-group form-group">
                            <span class="input-group-addon">车主姓名</span>
                            <input type="text" class="form-control ownerName" >
                        </div>
                        <div class="input-group form-group">
                            <span class="input-group-addon">车主电话</span>
                            <input type="tel" class="form-control ownerTel" >
                        </div>

                        <div class="input-group form-group">
                            <span class="input-group-addon">车主身份证</span>
                            <input type="text" class="form-control ownerIdNumber" >
                        </div>

                        <div class="input-group form-group">
                            <span class="input-group-addon">车主住址</span>
                            <input type="text" class="form-control ownerAddress" >
                        </div>
                        <div class="input-group form-group">
                            <span class="input-group-addon">备注</span>
                            <input type="text" class="form-control remark" >
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default modal-close" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary modal-confirm">Save changes</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /#wrapper -->



</body>

</html>

</body>
</html>
