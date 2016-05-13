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
    <script src="resources/common/js/require.js" data-main="modules/shiro/js/roleList"></script>
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
                    <div class="panel-heading">
                        <h4>角色列表 <span class="new-role-btn label label-default">New</span></h4>
                    </div>
                    <div class="panel-body">
                        <div id="role-list" class="row">

                        </div>
                    </div>

                </div>
            </div>
        </div>


    </div>

</div>

<div class="add-role-modal modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加角色</h4>
            </div>
            <div class="modal-body row">
                <div class="col-xs-12">
                    <form role="form">
                        <div class="form-group">
                            <label>角色名</label>
                            <input id="role-desc" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>角色标识</label>
                            <input id="role-name" class="form-control">
                            <p class="help-block">建议使用英文,方便系统的维护</p>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary modal-confirm">提交</button>
            </div>
        </div>
    </div>
</div>

</body>

</html>
