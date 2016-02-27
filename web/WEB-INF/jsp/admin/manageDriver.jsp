<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2016/2/26
  Time: 14:29
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
    <script src="resources/common/js/require.js" data-main="modules/admin/js/manageDriver"></script>
    <title></title>
    <style type="text/css">
        .navbar-top-links li {
            display: inline-block;
        }
    </style>
</head>
<body>
<div id="wrapper">

    <!-- Navigation -->

    <%@include file="navigation.jsp"%>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">管理司机
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
                                        <th>姓名</th>
                                        <th>性别</th>
                                        <th>驾照号码</th>
                                        <th>驾照类型</th>
                                        <th>驾龄</th>
                                        <th>身份证号</th>
                                        <th>联系电话</th>
                                        <th>联系地址</th>
                                        <th>备注</th>
                                        <th>更多</th>
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
                            <button id="addDriver" type="button" class="btn btn-primary">ADD</button>
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


<div class="add-driver-modal modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">添加Vehicle</h4>
            </div>
            <div class="modal-body row">
                <div class="col-xs-12">
                    <div class="input-group form-group">
                        <span class="input-group-addon">姓名</span>
                        <input type="text" class="form-control name" >
                    </div>
                    <div class="input-group form-group">
                        <span class="input-group-addon">性别</span>
                        <input type="text" class="form-control sex" >
                    </div>
                    <div class="input-group form-group">
                        <span class="input-group-addon">驾照类型</span>
                        <input type="text" class="form-control driverLicenceType" >
                    </div>
                    <div class="input-group form-group">
                        <span class="input-group-addon">驾照号</span>
                        <input type="tel" class="form-control driverLicenceNumber" >
                    </div>

                    <div class="input-group form-group">
                        <span class="input-group-addon">驾龄</span>
                        <input type="text" class="form-control driverYears" >
                    </div>

                    <div class="input-group form-group">
                        <span class="input-group-addon">身份证号</span>
                        <input type="text" class="form-control idNumber" >
                    </div>
                    <div class="input-group form-group">
                        <span class="input-group-addon">联系电话</span>
                        <input type="text" class="form-control tel" >
                    </div>
                    <div class="input-group form-group">
                        <span class="input-group-addon">联系地址</span>
                        <input type="text" class="form-control address" >
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
<div class="update-driver-modal modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">添加Vehicle</h4>
            </div>
            <div class="modal-body row">
                <input type="text" class="hidden id">
                <div class="col-xs-12">
                    <div class="input-group form-group">
                        <span class="input-group-addon">姓名</span>
                        <input type="text" class="form-control name" >
                    </div>
                    <div class="input-group form-group">
                        <span class="input-group-addon">性别</span>
                        <input type="text" class="form-control sex" >
                    </div>
                    <div class="input-group form-group">
                        <span class="input-group-addon">驾照类型</span>
                        <input type="text" class="form-control driverLicenceType" >
                    </div>
                    <div class="input-group form-group">
                        <span class="input-group-addon">驾照号</span>
                        <input type="tel" class="form-control driverLicenceNumber" >
                    </div>

                    <div class="input-group form-group">
                        <span class="input-group-addon">驾龄</span>
                        <input type="text" class="form-control driverYears" >
                    </div>

                    <div class="input-group form-group">
                        <span class="input-group-addon">身份证号</span>
                        <input type="text" class="form-control idNumber" >
                    </div>
                    <div class="input-group form-group">
                        <span class="input-group-addon">联系电话</span>
                        <input type="text" class="form-control tel" >
                    </div>
                    <div class="input-group form-group">
                        <span class="input-group-addon">联系地址</span>
                        <input type="text" class="form-control address" >
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
</body>
</html>
