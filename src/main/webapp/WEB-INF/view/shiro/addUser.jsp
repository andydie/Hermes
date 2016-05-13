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
    <script src="resources/common/js/require.js" data-main="modules/shiro/js/addUser"></script>
    <style type="text/css">
        .navbar-top-links li {
            display: inline-block;
        }
    </style>
    <script>
        hi.data=1;
        function addCookie(a,b,c){

            console.log(a,b,c);
            alert('11111');
            hi.data=2;
        }
    </script>
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
                        <br>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-xs-6 col-xs-offset-3">
                                <form role="form">
                                    <div class="form-group">
                                        <label>用户名</label>
                                        <input id="user-name" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>密码</label>
                                        <input id="password" type="password" class="form-control">
                                        <p class="help-block">密码不宜太简单</p>
                                    </div>
                                    <div class="form-group">
                                        <label>选择角色</label>
                                        <select class="form-control" id="user-role">

                                        </select>
                                    </div>
                                    <div class="alert alert-success hide" role="alert">
                                        创建成功!
                                    </div>
                                    <div class="alert alert-danger hide" role="alert">
                                        创建失败,未知原因!
                                    </div>
                                    <a href="admin/addWayBill"><img src="images/ZY-A.png" name="0" style="display:block" onclick="addCookie('carname','0',1);">11</a>
                                </form>
                            </div>
                            <div class="col-xs-4 col-xs-offset-4" style="text-align: center;">
                                <button id="add-user" type="button" class="btn btn-primary">提交</button>
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
