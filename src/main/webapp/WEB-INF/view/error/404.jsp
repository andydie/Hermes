<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2016-05-23
  Time: 22:52
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
    <title>error</title>
    <link rel="stylesheet" href="my.css">
    <style type="text/css">
        #back{
            color:white;
            font-size:35px;
        }
        #back:hover{
            color:orange;
        }

    </style>
</head>
<body>
<header class="intro-header">
    <div class="container">
        <div class="row" >
            <div>
                <div class="site-heading" style="width:90%;">
                    <h1 style="margin-top: 100px;">出错了</h1>
                    <a  href="list.do" id="back">返回首页</a>
                    <!-- <hr class="small">
                    <span class="subheading">Zxs</span> -->
                </div>
            </div>
        </div>
    </div>
</header>
</body>
</html>
