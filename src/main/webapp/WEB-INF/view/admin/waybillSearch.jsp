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
    <script src="resources/common/js/require.js" data-main="modules/admin/js/waybillSearch"></script>
    <title></title>
</head>
<body>
<div id="wrapper">

    <!-- Navigation -->

    <%@include file="navigation.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">

            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-xs-6">
                                <div class="panel panel-primary query-waybill-id">
                                    <div class="panel-heading">根据运单号查询</div>
                                    <div class="panel-body">
                                        <div class="form-group form-inline">
                                            <input type="text" class="form-control" placeholder="Search">
                                            <button type="submit" class="btn btn-default">查询</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="panel panel-primary query-waybill-item-name">
                                    <div class="panel-heading">根据商品名称查询</div>
                                    <div class="panel-body">
                                        <div class="form-group form-inline">
                                            <input type="text" class="form-control" placeholder="Search">
                                            <button type="submit" class="btn btn-default">查询</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="panel panel-info query-waybill-origin-place">
                                    <div class="panel-heading">根据发货地查询</div>
                                    <div class="panel-body">
                                        <div class="form-group form-inline">
                                            <input type="text" class="form-control" placeholder="Search">
                                            <button type="submit" class="btn btn-default">查询</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="panel panel-info query-waybill-destination">
                                    <div class="panel-heading">根据收货地查询</div>
                                    <div class="panel-body">
                                        <div class="form-group form-inline">
                                            <input type="text" class="form-control" placeholder="Search">
                                            <button type="submit" class="btn btn-default">查询</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="panel panel-success query-waybill-limit-time">
                                    <div class="panel-heading">根据到货时间查询</div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-xs-3">
                                                <label>设置起始时间</label>
                                                <input id="begin-time" class="easyui-datebox"
                                                       data-options="formatter:myformatter,parser:parser">
                                            </div>
                                            <div class="col-xs-3">
                                                <label>设置结束时间</label>
                                                <input id="end-time" class="easyui-datebox"
                                                       data-options="formatter:myformatter,parser:parser">
                                            </div>
                                            <div clas="col-xs-3">
                                                <button type="submit" class="btn btn-default">查询</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row query-alert" style="display: none;">
                            <div class="alert alert-danger" role="alert">
                                查询条件不得为空
                            </div>
                        </div>
                        <div class="row alert-empty"  style="display: none;">
                            <div class="alert alert-warning" role="alert">
                                查询结果为空
                            </div>
                        </div>
                        <div class="row waybill-list">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</div>
</body>
</html>
