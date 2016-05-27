<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2016/2/20
  Time: 16:33
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
    <title></title>
    <script src="resources/common/js/require-config.js"></script>
    <script src="resources/common/js/require.js" data-main="modules/index/js/index"></script>
</head>
<body>
<header>
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#mainnav-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="#" class="navbar-brand"><span class="glyphicon glyphicon-home"></span></a>
            </div>
            <div class="collapse navbar-collapse" id="mainnav-collapse">
                <div class="hidden-xs hidden-sm" style="line-height:20px; padding-top:5px; float:left"><a
                        href="#">Home</a></div>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">About <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#">Overview</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Projects</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">People <span
                                class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#">Overview</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">WTF <span
                                class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#">Sponsorship</a></li>
                        </ul>
                    </li>
                    <li><a href="login/login">Login</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<div class="container">
    <div class="row">
        <div class="col-md-3 col-sm-4 col-xs-12">
            <textarea id="waybillId" class="form-control" rows="3" placeholder="请输入单号:"></textarea>
            <br>
            <a role="button" id="query" class="btn btn-block btn-default btn-xs" href="#">confirm</a>
        </div>
        <div class="col-md-9 col-sm-8 col-xs-12">
            <img src="resources/modules/index/img/hermes_logo.png" alt="Apache Logo"
                 style="max-width: 100%;float: right;">
        </div>
    </div>
</div>

<section class="bg-gray">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h3>起步.</h3>

                <h5 class="no-btm-margin">The Hermes Foundation</h5>

                <p class="small">
                    Hermes初创于2016年，公司致力于民族品牌的建设和发展，不断完善终端网络、中转运输网络和信息网络三网一体的立体运行体系，立足传统快递业务，全面进入电子商务物流领域，以专业的服务和严格的质量管理来推动发展.
                </p>
            </div>
            <div class="col-md-4">
                <h3>创新.</h3>

                <h5 class="no-btm-margin">The Hermes projects are update</h5>

                <p class="small">
                    随着中国快递市场的发展，Hermes快递在提供传统快递服务的同时，也在积极开拓新兴业务，为国内大型C2C、B2C企业提供物流配送、第三方物流和仓储、代收货款、贵重物品通道等服务，在国内建立了庞大的信息采集、市场开发、物流配送、快件收派等业务机构
                </p>
            </div>
            <div class="col-md-4">
                <h3>发展.</h3>

                <h5 class="no-btm-margin">We consider ourselves</h5>

                <p class="small">
                    经过两个多月的发展，Hermes在全国范围内形成了完善、流畅的自营快递网络。截至目前，公司共有独立网点及分公司1家，服务网点及门店1余家，从业人员超过1人
                </p>
            </div>
        </div>
    </div>
</section>
<section class="container">
    <div class="row">
        <div class="col-md-12">
            <h2>Hermes Logistics Company</h2>

            <p>
                在未来，公司将继续致力于民族品牌的建设和发展，继续秉承“用心成就你我”的服务宗旨，加大投入、规范管理，吸纳人才，为社会提供更加优质、安全、便捷的快递服务，不断推动Hermes快递稳步发展，提升企业品牌价值，创造民族快递的奇迹
                <a href="#">烟花三月下扬州</a>
            </p>

            <div class="container">
                <div class="row">
                    <h3>Featured Project<span class="visible-md-inline visible-lg-inline">s</span></h3>

                    <div class="col-md-3 col-sm-12">
                        <!-- tabs left -->
                        <div class="tabbable tabs-left visible-md-inline visible-lg-inline">
                            <ul class="nav nav-tabs">

                                <li class="active">
                                    <a href="#1" data-toggle="tab">仓配一体化</a>
                                </li>

                                <li>
                                    <a href="#2" data-toggle="tab">代收货款</a>
                                </li>

                                <li>
                                    <a href="#3" data-toggle="tab">Hermes易物流</a>
                                </li>

                            </ul>
                        </div>
                    </div>
                    <div class="col-md-9 col-sm-12">
                        <div class="tab-content">

                            <div class="tab-pane fade in active" id="1">
                                <div class="row">
                                    <div class="col-sm-10">
                                        <h4 class="no-btm-margin">
                                            <a href="#">
                                                仓配一体化
                                            </a>
                                        </h4>

                                        <p>
                                            致力成为专业的第三方仓储物流供应链服务商，专注为电子商务行业提供仓储、精细加工及配送管理一站式服务
                                        </p>
                                        <a class="btn btn-default btn-sm" href="#" role="button">Learn More...</a>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane fade in " id="2">
                                <div class="row">
                                    <div class="col-sm-10">
                                        <h4 class="no-btm-margin"><a href="#">代收货款</a></h4>

                                        <p>
                                            Hermes代收货款有效的将物流、资金流、信息流集于一体，让更多商户在享受高效、安全、遍布全国的Hermes网络覆盖的同时，享受以最快的速度回笼资金所带来的资金效率收益。
                                        </p>
                                        <a class="btn btn-default btn-sm" href="#" role="button">Learn More...</a>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane fade in " id="3">
                                <div class="row">
                                    <div class="col-sm-10">
                                        <h4 class="no-btm-margin"><a href="#">Hermes易物流</a></h4>

                                        <p>
                                            Hermes易物流是专注于电商企业提供供应链一体化服务的公司；以科技和人才为推动力，致力于打造成中国仓配一体化的标杆性企业
                                        </p>
                                        <a class="btn btn-default btn-sm" href="#" role="button">Learn More...</a>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="bg-gray">
    <div class="bg-info">
        <div class="container">
            <h2 class="no-btm-margin">Latest News</h2>
            <br>
        </div>
    </div>

    <br>

    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="panel panel-default">
                    <div id="article-list" class="panel-body">

                    </div>
                </div>
            </div>
            <div class="col-md-4">
               
            </div>
        </div>
    </div>
</section>

<footer class="bg-primary">
    <div class="container">
        <hr class="col-lg-12 hr-white">
        <div class="row">
            <div class="col-lg-12">
                <p class="text-center">Copyright © 2016 The Hermes logistics company.</p>
            </div>
        </div>
    </div>
</footer>

</body>
</html>
