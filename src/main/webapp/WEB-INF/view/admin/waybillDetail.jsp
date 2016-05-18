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
    <script src="resources/common/js/require.js" data-main="modules/admin/js/waybillDetail"></script>
    <title></title>
</head>
<body>
<div id="wrapper">

    <!-- Navigation -->

    <%@include file="navigation.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">运单详情
                </h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <button class="btn btn-danger waybill-arrival-btn" style="display: none;">抵达</button>
                        <div class="alert alert-success waybill-arrival-alert" role="alert" style="display: none;"></div>
                    </div>
                    <div class="panel-body">
                        <div class="row container-fluid" id="dispatch-list">
                            <div class="row">
                                <div class="col-xs-6">
                                    <table id="pg" class="easyui-propertygrid" style="width:300px"
                                                   data-options="showGroup:true,scrollbarSize:0">
                                    </table>
                                </div>
                                <div class="col-xs-6" id="time-panel">

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
