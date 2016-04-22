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
                        <br>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-6">
                                <form role="form">
                                    <label>车辆编号</label>
                                    <div class="form-group form-inline">
                                        <input type="text" class="form-control"  placeholder="请选择" readonly>
                                        <button type="submit" class="btn btn-primary choose-vehicle">
                                            选择车辆
                                        </button>
                                    </div>
                                    <label>司机编号</label>
                                    <div class="form-group form-inline">
                                        <input id="originPlace" class="form-control" placeholder="请选择" readonly>
                                        <button type="submit" class="btn btn-primary choose-driver">
                                            选择司机
                                        </button>
                                    </div>
                                </form>
                            </div>
                            <!-- /.col-lg-6 (nested) -->
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>始发地</label>
                                    <input id="sender" class="form-control">
                                    <p class="help-block">具体到区县</p>
                                </div>
                                <div class="form-group">
                                    <label>目的地</label>
                                    <input id="receiver" class="form-control">
                                    <p class="help-block">具体到区县</p>
                                </div>
                            </div>

                            <div class="col-xs-4 col-xs-offset-4" style="text-align: center;">
                                <button id="commitWayBill" type="button" class="btn btn-primary">提交</button>
                            </div>
                            <!-- /.col-lg-6 (nested) -->
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

<div class="choose-vehicle-modal modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">选择Vehicle</h4>
            </div>
            <div class="modal-body row">
                <div class="col-xs-12">

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
