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
    <script src="resources/common/js/require.js" data-main="modules/display/js/articleList"></script>
    <style type="text/css">
        .pull-right .label{
            cursor: pointer;
        }
    </style>
    <title></title>
</head>
<body>
<div id="wrapper">

    <!-- Navigation -->

    <%@include file="../admin/navigation.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
               <br>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-10">
                <ul class="list-group" id="article-list">

                </ul>
            </div>
        </div>
    </div>


</div>
</body>
</html>
