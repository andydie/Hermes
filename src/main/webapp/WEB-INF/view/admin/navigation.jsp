<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2016/2/23
  Time: 22:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="index.html">Admin Page</a>
    </div>
    <!-- /.navbar-header -->

    <ul class="nav navbar-top-links navbar-right">

        <!-- /.dropdown -->
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li><a href="/hermes"><i class="fa fa-gear fa-fw"></i>回到首页</a>
                </li>
                <li class="divider"></li>
                <li><a href="logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                </li>
            </ul>
            <!-- /.dropdown-user -->
        </li>
        <!-- /.dropdown -->
    </ul>
    <!-- /.navbar-top-links -->

    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">


                <shiro:lacksRole name="guest">
                    <li>
                        <a href="#"><i class="fa fa-table fa-fw"></i>用户与权限管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#">用户管理<span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <shiro:hasPermission name="user:read">
                                        <li>
                                            <a href="shiro/user/list">用户管理</a>
                                        </li>
                                    </shiro:hasPermission>
                                    <shiro:hasPermission name="user:create">
                                        <li>
                                            <a href="shiro/user/add">新增用户</a>
                                        </li>
                                    </shiro:hasPermission>
                                </ul>
                            </li>
                            <shiro:hasPermission name="role:read">
                                <li>
                                    <a href="shiro/role/list">权限管理</a>
                                </li>
                            </shiro:hasPermission>
                        </ul>
                    </li>
                </shiro:lacksRole>
                <li>
                    <a href="#"><i class="fa fa-edit fa-fw"></i> 运单<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <shiro:hasPermission name="waybill:create">
                            <li>
                                <a href="admin/addWayBill">
                                    创建运单
                                </a>
                            </li>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="waybill:update">
                            <li>
                                <a href="admin/wayBillList">运单列表</a>
                            </li>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="waybill:read">
                            <li>
                                <a href="admin/waybill/search">运单查询</a>
                            </li>
                        </shiro:hasPermission>
                    </ul>
                </li>
                <shiro:lacksRole name="guest">
                    <shiro:hasPermission name="vehicle:read">
                        <li>
                            <a href="admin/manageVehicle">
                                <i class="fa fa-wrench fa-fw testha"></i>车辆管理
                            </a>
                        </li>
                    </shiro:hasPermission>
                </shiro:lacksRole>
                <shiro:lacksRole name="guest">
                    <shiro:hasPermission name="driver:read">
                        <li>
                            <a href="admin/manageDriver"><i class="fa fa-sitemap fa-fw"></i> 驾驶员管理</a>
                        </li>
                    </shiro:hasPermission>
                </shiro:lacksRole>
                <shiro:lacksRole name="guest">
                    <li>
                        <a href="#"><i class="fa fa-files-o fa-fw"></i>调度管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <shiro:hasPermission name="dispatch:read">
                                <li>
                                    <a href="admin/manageDispatch">调度列表</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="dispatch:read">
                                <li>
                                    <a href="admin/dispatch/list">调度列表2</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="dispatch:create">
                                <li>
                                    <a href="admin/addDispatch">新增调度信息</a>
                                </li>
                            </shiro:hasPermission>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                </shiro:lacksRole>
                <shiro:lacksRole name="guest">
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>公告管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <shiro:hasPermission name="article:create">
                                <li>
                                    <a href="display/article/create">新增公告</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="article:read">
                                <li>
                                    <a href="display/article/list">公告列表</a>
                                </li>
                            </shiro:hasPermission>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                </shiro:lacksRole>
            </ul>
        </div>
        <!-- /.sidebar-collapse -->
    </div>
    <!-- /.navbar-static-side -->
</nav>
