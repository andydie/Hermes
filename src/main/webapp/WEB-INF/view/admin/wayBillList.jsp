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
    <script src="resources/common/js/require.js" data-main="modules/admin/js/wayBillList"></script>
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

    <%@include file="navigation.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-xs-12">
                <br>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Basic Form Elements
                    </div>
                    <div class="panel-body">
                        <div class="row container-fluid waybill-list">

                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- /.row -->
    </div>
    <!-- /#page-wrapper -->
    <div class="vehicle-modal modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">添加Vehicle</h4>
                </div>
                <div class="modal-body row">
                    <div class="col-xs-12">
                        <div class="input-group form-group">
                            <span class="input-group-addon">车辆牌号</span>
                            <input type="text" class="form-control plateNumber">
                        </div>
                        <div class="input-group form-group">
                            <span class="input-group-addon">车辆类型</span>
                            <input type="text" class="form-control vehicleType">
                        </div>
                        <div class="input-group form-group">
                            <span class="input-group-addon">车主姓名</span>
                            <input type="text" class="form-control ownerName">
                        </div>
                        <div class="input-group form-group">
                            <span class="input-group-addon">车主电话</span>
                            <input type="tel" class="form-control ownerTel">
                        </div>

                        <div class="input-group form-group">
                            <span class="input-group-addon">车主身份证</span>
                            <input type="text" class="form-control ownerIdNumber">
                        </div>

                        <div class="input-group form-group">
                            <span class="input-group-addon">车主住址</span>
                            <input type="text" class="form-control ownerAddress">
                        </div>
                        <div class="input-group form-group">
                            <span class="input-group-addon">备注</span>
                            <input type="text" class="form-control remark">
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

    <div class="update-vehicle-modal modal fade" id="myModal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" class="myModalLabel">修改</h4>
                </div>
                <div class="modal-body row">
                    <div class="col-xs-12">
                        <input type="text" class="hidden id">

                        <div class="input-group form-group">
                            <span class="input-group-addon">车辆牌号</span>
                            <input type="text" class="form-control plateNumber">
                        </div>
                        <div class="input-group form-group">
                            <span class="input-group-addon">车辆类型</span>
                            <input type="text" class="form-control vehicleType">
                        </div>
                        <div class="input-group form-group">
                            <span class="input-group-addon">车主姓名</span>
                            <input type="text" class="form-control ownerName">
                        </div>
                        <div class="input-group form-group">
                            <span class="input-group-addon">车主电话</span>
                            <input type="tel" class="form-control ownerTel">
                        </div>

                        <div class="input-group form-group">
                            <span class="input-group-addon">车主身份证</span>
                            <input type="text" class="form-control ownerIdNumber">
                        </div>

                        <div class="input-group form-group">
                            <span class="input-group-addon">车主住址</span>
                            <input type="text" class="form-control ownerAddress">
                        </div>
                        <div class="input-group form-group">
                            <span class="input-group-addon">备注</span>
                            <input type="text" class="form-control remark">
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
