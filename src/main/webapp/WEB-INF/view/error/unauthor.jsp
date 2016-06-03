<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2016-05-28
  Time: 14:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title></title>
    <link href="resources/common/css/error.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="full-scene">
    <div class="center">
        <shiro:user>
            <h1><shiro:principal/>,您没有相应权限。</h1>

            <h2>
                <a href="javascript:history.go(-1);">
                    返回上一页
                </a>
            </h2>
        </shiro:user>
        <shiro:guest>
            <h1>登录已过期</h1>
            <h2><a href="login/login">
                登录
            </a></h2>
        </shiro:guest>
    </div>
</div>
</body>
</html>
