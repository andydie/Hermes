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
    <script src="resources/common/js/require.js" data-main="modules/display/js/articleEdit"></script>
    <title></title>
</head>
<body>
<div id="wrapper">

    <!-- Navigation -->

    <%@include file="../admin/navigation.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">编辑公告
                </h1>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                    <div class="row">
                        <div class="input-group col-xs-6">
                            <span class="input-group-addon" id="basic-addon1">标题</span>
                            <input id="edit-title" type="text" class="form-control" aria-describedby="basic-addon1">
                        </div>
                    </div>
                    <br>
                    <div class="row">
                            <textarea id="edit-area" cols="100" rows="8" style="height:300px;visibility:hidden;">

                            </textarea>
                    </div>


                    <div class="row">
                        <button id="confirm-edit" class="btn btn-primary">更新</button>
                    </div>
            </div>
        </div>
    </div>


</div>
</body>
</html>
