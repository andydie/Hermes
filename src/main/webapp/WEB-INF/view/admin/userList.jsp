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
    <script src="resources/common/js/require.js" data-main="modules/admin/js/userList"></script>
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
        <br>

        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <br>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div id="cabeza">
                                <%--<div class="media">
                                    <div class="media-left">
                                        <span class="user-icon glyphicon glyphicon-user" aria-hidden="true"></span>
                                    </div>
                                    <div class="media-body">
                                        <h4 class="media-heading">Media heading</h4>
                                        ...
                                    </div>
                                    <div class="media-right">
                                        <span class="user-icon glyphicon glyphicon-user" aria-hidden="true"></span>
                                    </div>
                                </div>
                                <div class="media">
                                    <div class="media-left">
                                        <span class="user-icon glyphicon glyphicon-user" aria-hidden="true"></span>
                                    </div>
                                    <div class="media-body">
                                        <h4 class="media-heading">Media heading</h4>
                                        ...
                                    </div>
                                </div>
                                <div class="media">
                                    <div class="media-left">
                                        <span class="user-icon glyphicon glyphicon-user" aria-hidden="true"></span>
                                    </div>
                                    <div class="media-body">
                                        <h4 class="media-heading">Media heading</h4>
                                        ...
                                    </div>
                                </div>--%>
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
