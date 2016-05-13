<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2016/2/21
  Time: 22:08
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
    <script src="resources/common/js/require.js" data-main="modules/shiro/js/roleEdit"></script>
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

    <%@include file="../admin/navigation.jsp" %>

    <div id="page-wrapper">
        <br>

        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading role-name">
                        修改权限
                    </div>
                    <div class="panel-body">

                            <div class="easyui-panel" style="padding:5px">
                                <ul id="tt" class="easyui-tree"></ul>
                            </div>

                    </div>
                    <p>&nbsp;</p>
                    <div class="col-xs-4 col-xs-offset-4" style="text-align: center;">
                        <button id="save-permission" type="button" class="btn btn-primary">保存</button>
                    </div>

                </div>
            </div>
        </div>


    </div>

</div>

</body>

</html>
