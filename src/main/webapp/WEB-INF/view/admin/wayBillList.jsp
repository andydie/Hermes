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
                       运单列表
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



</div>
<!-- /#wrapper -->


</body>

</html>

</body>
</html>
