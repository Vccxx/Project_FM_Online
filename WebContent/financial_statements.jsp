<%@ page contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" import="java.util.*"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/financial_statements.js"></script>
<link rel="stylesheet" type="text/css" href="css/financial_statements.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" />
</head>
<body>
<div class="container">
<div class="row">
<section>
<div class="wizard">
<div class="wizard-inner">
<div class="connecting-line"></div>
<ul class="nav nav-tabs" role="tablist">
<li role="presentation" class="active">
<a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="日报表">
<span class="round-tab">
日
</span>
</a>
</li>

                <li role="presentation" class="disabled">
                    <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" title="月报表">
                        <span class="round-tab">
                                月
                        </span>
                    </a>
                </li>

                <li role="presentation" class="disabled">
                    <a href="#complete" data-toggle="tab" aria-controls="complete" role="tab" title="年报表">
                        <span class="round-tab">
                                年
                        </span>
                    </a>
                </li>
            </ul>
        </div>

        <form role="form">
            <div class="tab-content">
                <div class="tab-pane active" role="tabpanel" id="step1">
                    <h3>欢迎查看2017年01月01日利润表</h3>
                    <table class="table">
                    <thead>
                        <tr>
                            <th>
                                项目
                            </th>
                            <th>
                                行次
                            </th>
                            <th>
                                本日数
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                    <tr class="success">
                            <td>
                                一、收入
                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                    <% 
                    String driver = "com.mysql.jdbc.Driver";
                    String url = "jdbc:mysql://w.rdc.sae.sina.com.cn:3306/app_fmanager";
                    String user = "o25w1j0kwk";
                    String password = "2mk0mkl22jkz214ikx11w0imy3k5yikmy115xwlw";
                    List<String> ll =new ArrayList<String>();
                    try {
                    Class.forName(driver);
                    Connection conn = DriverManager.getConnection(url, user, password);
                    Statement statement = conn.createStatement();
                    String sql = "select * from day_lirun where day=\"2017-1-1\"";
                    ResultSet rs = statement.executeQuery(sql);
                    String temp = null;
                    while (rs.next()) { 
                        temp = rs.getString("number");
                        ll.add(temp);
                    }
                    out.print("<tr>");
                    out.print("<td >" + "主营业务收入" + "</td>");
                    out.print("<td >" + "1" + "</td>");
                    out.print("<td >" + ll.get(0) + "</td>");
                    out.print("</tr> ");
                    out.print("<tr >");
                    out.print("<td >" + "投资收益" + "</td>");
                    out.print("<td >" + "2" + "</td>");
                    out.print("<td >" + ll.get(1) + "</td>");
                    out.print("</tr> ");
                    out.print("<tr>");
                    out.print("<td >" + "营业外收入" + "</td>");
                    out.print("<td >" + "3" + "</td>");
                    out.print("<td >" + ll.get(2) + "</td>");
                    out.print("</tr> ");
                    out.print("<tr>");
                    out.print("<td >" + "收入合计" + "</td>");
                    out.print("<td >" + "</td>");
                    out.print("<td >" + ll.get(3) + "</td>");
                    out.print("</tr> ");
                    out.print("<tr class='success'>");
                    out.print("<td >" + "二、费用" + "</td>");
                    out.print("<td >" + "</td>");
                    out.print("<td >" + "</td>");
                    out.print("</tr> ");
                    out.print("<tr>");
                    out.print("<td >" + "营业成本" + "</td>");
                    out.print("<td >" + "1" + "</td>");
                    out.print("<td >" + ll.get(4) + "</td>");
                    out.print("</tr> ");
                    out.print("<tr>");
                    out.print("<td >" + "管理费用" + "</td>");
                    out.print("<td >" + "2" + "</td>");
                    out.print("<td >" + ll.get(5) + "</td>");
                    out.print("</tr> ");
                    out.print("<tr>");
                    out.print("<td >" + "财务费用" + "</td>");
                    out.print("<td >" + "3" + "</td>");
                    out.print("<td >" + ll.get(6) + "</td>");
                    out.print("</tr> ");
                    out.print("<tr>");
                    out.print("<td >" + "营业外支出" + "</td>");
                    out.print("<td >" + "4" + "</td>");
                    out.print("<td >" + ll.get(7) + "</td>");
                    out.print("</tr> ");
                    out.print("<tr>");
                    out.print("<td >" + "所得税" + "</td>");
                    out.print("<td >" + "5" + "</td>");
                    out.print("<td >" + ll.get(8) + "</td>");
                    out.print("</tr> ");
                    out.print("<tr>");
                    out.print("<td >" + "费用合计" + "</td>");
                    out.print("<td >" + "</td>");
                    out.print("<td >" + ll.get(9) + "</td>");
                    out.print("</tr> ");
                    out.print("<tr class='success'>");
                    out.print("<td >" + "三、净利润" + "</td>");
                    out.print("<td >" + "</td>");
                    out.print("<td >" + ll.get(10) + "</td>");
                    out.print("</tr> ");
                    rs.close();
                    conn.close();
                    } catch (ClassNotFoundException e) {
                    System.out.println("Sorry,can`t find the Driver!");
                    e.printStackTrace();
                    } catch (SQLException e) {
                    e.printStackTrace();
                    } catch (Exception e) {
                    e.printStackTrace();
                    }
                    %>
                    </tbody>
                </table>
                <ul class="list-inline pull-right">
                    <li><button type="button" class="btn btn-primary next-step">continue</button></li>
                </ul>
                </div>

                <div class="tab-pane" role="tabpanel" id="step3">
                    <h3>月报表</h3>
                    <div class="container" style="margin-top: 10px">
                        <div class="row">
                            <div class="col col-sm-2">
                                <ul class="nav nav-tabs nav-stacked text-center" role="tablist">
                                    <li role="presentation" class="active"><a href="#home2" aria-controls="home" role="tab" data-toggle="tab">利润表</a></li> 
                                    <li role="presentation"><a href="#messages2" aria-controls="messages" role="tab" data-toggle="tab">现金流量表</a></li>
                                </ul>
                            </div>
                            <div class="col col-sm-8">
                                <div class="row tab-content">
                                    <div role="tabpanel" class="tab-pane fade active in" id="home2">
                                    <h3>欢迎查看2017年01月利润表</h3>
                                        <table class="table">
                                        <thead>
                                            <tr>
                                                <th>
                                                    项目
                                                </th>
                                                <th>
                                                    行次
                                                </th>
                                                <th>
                                                    本月数
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr class="success">
                            <td>
                                一、收入
                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                            <% 
                            String driver1 = "com.mysql.jdbc.Driver";
                            String url1 = "jdbc:mysql://w.rdc.sae.sina.com.cn:3306/app_fmanager";
                            String user1 = "o25w1j0kwk";
                            String password1 = "2mk0mkl22jkz214ikx11w0imy3k5yikmy115xwlw";
                            List<String> ll1 =new ArrayList<String>();
                            try {
                            Class.forName(driver1);
                            Connection conn = DriverManager.getConnection(url1, user1, password1);
                            Statement statement = conn.createStatement();
                            String sql = "select * from month_lirun where month=\"2017-1\"";
                            ResultSet rs = statement.executeQuery(sql);
                            String temp = null;
                            while (rs.next()) { 
                                temp = rs.getString("number");
                                ll1.add(temp);
                            }
                            out.print("<tr>");
                            out.print("<td >" + "主营业务收入" + "</td>");
                            out.print("<td >" + "1" + "</td>");
                            out.print("<td >" + ll1.get(0) + "</td>");
                            out.print("</tr> ");
                            out.print("<tr >");
                            out.print("<td >" + "投资收益" + "</td>");
                            out.print("<td >" + "2" + "</td>");
                            out.print("<td >" + ll1.get(1) + "</td>");
                            out.print("</tr> ");
                            out.print("<tr>");
                            out.print("<td >" + "营业外收入" + "</td>");
                            out.print("<td >" + "3" + "</td>");
                            out.print("<td >" + ll1.get(2) + "</td>");
                            out.print("</tr> ");
                            out.print("<tr>");
                            out.print("<td >" + "收入合计" + "</td>");
                            out.print("<td >" + "</td>");
                            out.print("<td >" + ll1.get(3) + "</td>");
                            out.print("</tr> ");
                            out.print("<tr class='success'>");
                            out.print("<td >" + "二、费用" + "</td>");
                            out.print("<td >" + "</td>");
                            out.print("<td >" + "</td>");
                            out.print("</tr> ");
                            out.print("<tr>");
                            out.print("<td >" + "营业成本" + "</td>");
                            out.print("<td >" + "1" + "</td>");
                            out.print("<td >" + ll1.get(4) + "</td>");
                            out.print("</tr> ");
                            out.print("<tr>");
                            out.print("<td >" + "管理费用" + "</td>");
                            out.print("<td >" + "2" + "</td>");
                            out.print("<td >" + ll1.get(5) + "</td>");
                            out.print("</tr> ");
                            out.print("<tr>");
                            out.print("<td >" + "财务费用" + "</td>");
                            out.print("<td >" + "3" + "</td>");
                            out.print("<td >" + ll1.get(6) + "</td>");
                            out.print("</tr> ");
                            out.print("<tr>");
                            out.print("<td >" + "营业外支出" + "</td>");
                            out.print("<td >" + "4" + "</td>");
                            out.print("<td >" + ll1.get(7) + "</td>");
                            out.print("</tr> ");
                            out.print("<tr>");
                            out.print("<td >" + "所得税" + "</td>");
                            out.print("<td >" + "5" + "</td>");
                            out.print("<td >" + ll1.get(8) + "</td>");
                            out.print("</tr> ");
                            out.print("<tr>");
                            out.print("<td >" + "费用合计" + "</td>");
                            out.print("<td >" + "</td>");
                            out.print("<td >" + ll1.get(9) + "</td>");
                            out.print("</tr> ");
                            out.print("<tr class='success'>");
                            out.print("<td >" + "三、净利润" + "</td>");
                            out.print("<td >" + "</td>");
                            out.print("<td >" + ll1.get(10) + "</td>");
                            out.print("</tr> ");
                            rs.close();
                            conn.close();
                            } catch (ClassNotFoundException e) {
                            System.out.println("Sorry,can`t find the Driver!");
                            e.printStackTrace();
                            } catch (SQLException e) {
                            e.printStackTrace();
                            } catch (Exception e) {
                            e.printStackTrace();
                            }
                            %>
                                </tbody>
                            </table>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade" id="messages2">
                                     <h3>欢迎查看2017年1月现金流量表</h3>
                                        <table class="table">

                                        <thead>
                                            <tr>
                                                <th>
                                                    项目
                                                </th>
                                                <th>
                                                    行次
                                                </th>
                                                <th>
                                                    本月数
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr class="success">
                                                <td>
                                                    一、经营活动活动产生的现金流量：
                                                </td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <% 
                                            String driver3 = "com.mysql.jdbc.Driver";
                                            String url3 = "jdbc:mysql://w.rdc.sae.sina.com.cn:3306/app_fmanager";
                                            String user3 = "o25w1j0kwk";
                                            String password3 = "2mk0mkl22jkz214ikx11w0imy3k5yikmy115xwlw";
                                            List<String> ll3 =new ArrayList<String>();
                                            try {
                                            Class.forName(driver3);
                                            Connection conn = DriverManager.getConnection(url3, user3, password3);
                                            Statement statement = conn.createStatement();
                                            String sql = "select * from month_cash where thismonth=\"2017-1\"";
                                            ResultSet rs = statement.executeQuery(sql);
                                            String temp = null;
                                            while (rs.next()) { 
                                                temp = rs.getString("number");
                                                ll3.add(temp);
                                            }
                                            out.print("<tr>");
                                            out.print("<td >" + "收取利息、手续费及佣金的现金" + "</td>");
                                            out.print("<td >" + "1" + "</td>");
                                            out.print("<td >" + ll3.get(0) + "</td>");
                                            out.print("</tr> ");
                                            out.print("<tr>");
                                            out.print("<td >" + "收到其他与经营活动有关的现金" + "</td>");
                                            out.print("<td >" + "2" + "</td>");
                                            out.print("<td >" + ll3.get(1) + "</td>");
                                            out.print("</tr> ");
                                            out.print("<tr>");
                                            out.print("<td >" + "经营活动现金流入小计" + "</td>");
                                            out.print("<td >" + "3" + "</td>");
                                            out.print("<td >" + ll3.get(2) + "</td>");
                                            out.print("</tr> ");
                                            out.print("<tr>");
                                            out.print("<td >" + "支付利息、手续费及佣金的现金" + "</td>");
                                            out.print("<td >" + "4" + "</td>");
                                            out.print("<td >" + ll3.get(3) + "</td>");
                                            out.print("</tr> ");
                                            out.print("<tr>");
                                            out.print("<td >" + "支付给职工以及为职工支付的现金" + "</td>");
                                            out.print("<td >" + "5" + "</td>");
                                            out.print("<td >" + ll3.get(4) + "</td>");
                                            out.print("</tr> ");
                                            out.print("<tr>");
                                            out.print("<td >" + "支付的各项税款" + "</td>");
                                            out.print("<td >" + "6" + "</td>");
                                            out.print("<td >" + ll3.get(5) + "</td>");
                                            out.print("</tr> ");
                                            out.print("<tr>");
                                            out.print("<td >" + "支付其他与经营活动有关的现金" + "</td>");
                                            out.print("<td >" + "7" + "</td>");
                                            out.print("<td >" + ll3.get(6) + "</td>");
                                            out.print("</tr> ");
                                            out.print("<tr>");
                                            out.print("<td >" + "经营活动产生的现金流量净额" + "</td>");
                                            out.print("<td >" + "9" + "</td>");
                                            out.print("<td >" + ll3.get(8) + "</td>");
                                            out.print("</tr> ");
                                            out.print("<tr class='success'>");
                                            out.print("<td >" + "二、投资活动产生的现金流量：" + "</td>");
                                            out.print("<td >" + "</td>");
                                            out.print("<td >" + "</td>");
                                            out.print("</tr> ");
                                            out.print("<tr>");
                                            out.print("<td >" + "收回投资收到的现金" + "</td>");
                                            out.print("<td >" + "1" + "</td>");
                                            out.print("<td >" + ll3.get(9) + "</td>");
                                            out.print("</tr> ");
                                            out.print("<tr>");
                                            out.print("<td >" + "取得投资收益收到的现金" + "</td>");
                                            out.print("<td >" + "2" + "</td>");
                                            out.print("<td >" + ll3.get(10) + "</td>");
                                            out.print("</tr> ");
                                            out.print("<tr>");
                                            out.print("<td >" + "投资支付的现金" + "</td>");
                                            out.print("<td >" + "3" + "</td>");
                                            out.print("<td >" + ll3.get(11) + "</td>");
                                            out.print("</tr> ");
                                            out.print("<tr>");
                                            out.print("<td >" + "投资活动产生的现金流量净额" + "</td>");
                                            out.print("<td >" + "4" + "</td>");
                                            out.print("<td >" + ll3.get(12) + "</td>");
                                            out.print("</tr> ");
                                            out.print("<tr class='success'>");
                                            out.print("<td >" + "三、筹资活动产生的现金流量" + "</td>");
                                            out.print("<td >" + "</td>");
                                            out.print("<td >" + "</td>");
                                            out.print("</tr> ");
                                            out.print("<tr>");
                                            out.print("<td >" + "吸收投资收到的现金" + "</td>");
                                            out.print("<td >" + "1" + "</td>");
                                            out.print("<td >" + ll3.get(13) + "</td>");
                                            out.print("</tr> ");
                                            out.print("<tr>");
                                            out.print("<td >" + "发行债券收到的现金" + "</td>");
                                            out.print("<td >" + "2" + "</td>");
                                            out.print("<td >" + ll3.get(14) + "</td>");
                                            out.print("</tr> ");
                                            out.print("<tr>");
                                            out.print("<td >" + "偿还债务支付的现金" + "</td>");
                                            out.print("<td >" + "3" + "</td>");
                                            out.print("<td >" + ll3.get(15) + "</td>");
                                            out.print("</tr> ");
                                            out.print("<tr>");
                                            out.print("<td >" + "分配股利、利润或偿付利息支付的现金" + "</td>");
                                            out.print("<td >" + "4" + "</td>");
                                            out.print("<td >" + ll3.get(16) + "</td>");
                                            out.print("</tr> ");
                                            out.print("<tr>");
                                            out.print("<td >" + "筹资活动产生的现金流量净额" + "</td>");
                                            out.print("<td >" + "5" + "</td>");
                                            out.print("<td >" + ll3.get(17) + "</td>");
                                            out.print("</tr> ");
                                            out.print("<tr>");
                                            out.print("<td >" + "筹资活动产生的现金流量净额" + "</td>");
                                            out.print("<td >" + "5" + "</td>");
                                            out.print("<td >" + ll3.get(17) + "</td>");
                                            out.print("</tr> ");
                                            rs.close();
                                            conn.close();
                                            } catch (ClassNotFoundException e) {
                                            System.out.println("Sorry,can`t find the Driver!");
                                            e.printStackTrace();
                                            } catch (SQLException e) {
                                            e.printStackTrace();
                                            } catch (Exception e) {
                                            e.printStackTrace();
                                            }
                                            %>
                                        </tbody>
                                    </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                      <div class="col-md-4 col-md-offset-4">
                        <div class="material-button-anim">
                          <ul class="list-inline" id="options">
                            <li class="option">
                              <button class="material-button option1" type="button" onclick="javascript:window.location.href='createWord.action'">
                                <span class="fa fa-file-word-o" aria-hidden="true"></span>
                              </button>
                            </li>
                            <li class="option">
                              <button class="material-button option2" type="button">
                                <span class="fa fa-vine" aria-hidden="true"></span>
                              </button>
                            </li>
                            <li class="option">
                              <button class="material-button option3" type="button" action="PieDataset">
                                <span class="fa fa-circle" aria-hidden="true"></span>
                              </button>
                            </li>
                          </ul>
                          <button class="material-button material-button-toggle" type="button">
                            <span class="fa fa-plus" aria-hidden="true"></span>
                          </button>
                        </div>
                      </div>
                    </div>
                    <ul class="list-inline pull-right">
                        <li><button type="button" class="btn btn-default prev-step">Previous</button></li>
                        <li><button type="button" class="btn btn-default next-step">Skip</button></li>
                        <li><button type="button" class="btn btn-primary btn-info-full next-step">continue</button></li>
                    </ul>
                </div>
                <div class="tab-pane" role="tabpanel" id="complete">
                    <h3>年报表</h3>
                    <div class="container" style="margin-top: 10px">
                        <div class="row">
                            <div class="col col-sm-2">
                                <ul class="nav nav-tabs nav-stacked text-center" role="tablist">
                                    <li role="presentation" class="active"><a href="#home3" aria-controls="home" role="tab" data-toggle="tab">资产负债表</a></li>
                                    <li role="presentation"><a href="#profile3" aria-controls="profile" role="tab" data-toggle="tab">利润表</a></li>
                                    <li role="presentation"><a href="#messages3" aria-controls="messages" role="tab" data-toggle="tab">现金流量表</a></li>
                                </ul>
                            </div>
                            <div class="col col-sm-8">
                                <div class="row tab-content">
                                    <div role="tabpanel" class="tab-pane fade active in" id="home3">
                                    <h3>欢迎查看2017年资产负债表</h3>
                                     <div class="panel panel-default panel-table">
                                          <div class="panel-body">
                                          <form class="navbar-form navbar-center" role="form" action=#>
                                            <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>
                                                        资产
                                                    </th>
                                                    <th>
                                                        行次
                                                    </th>
                                                    <th>
                                                        本年数
                                                    </th>
                                                    <th>
                                                        负债及所有者权益
                                                    </th>
                                                    <th>
                                                        行次
                                                    </th>
                                                    <th>
                                                        本年数
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr class="success">
                                                    <td>
                                                        流动资产：
                                                    </td>
                                                    <td></td>
                                                    <td></td>
                                                    <td>
                                                        流动负债：
                                                    </td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <% 
                                                    String driver5 = "com.mysql.jdbc.Driver";
                                                    String url5 = "jdbc:mysql://w.rdc.sae.sina.com.cn:3306/app_fmanager";
                                                    String user5 = "o25w1j0kwk";
                                                    String password5 = "2mk0mkl22jkz214ikx11w0imy3k5yikmy115xwlw";
                                                    List<String> ll5 =new ArrayList<String>();
                                                    List<String> ll6 =new ArrayList<String>();
                                                    try {
                                                    Class.forName(driver5);
                                                    Connection conn = DriverManager.getConnection(url5, user5, password5);
                                                    Statement statement = conn.createStatement();
                                                    String sql = "select * from assets where year=\"2017\"";
                                                    ResultSet rs = statement.executeQuery(sql);
                                                    String temp1 = null;
                                                    String temp2 = null;
                                                    while (rs.next()) { 
                                                        temp1 = rs.getString("bennian1");
                                                        temp2 = rs.getString("bennian2");
                                                        ll5.add(temp1);
                                                        ll6.add(temp2);
                                                    }
                                                    out.print("<tr>");
                                                    out.print("<td >" + "货币资金" + "</td>");
                                                    out.print("<td >" + "1" + "</td>");
                                                    out.print("<td >" + ll5.get(0) + "</td>");
                                                    out.print("<td >" + "短期负债" + "</td>");
                                                    out.print("<td >" + "1" + "</td>");
                                                    out.print("<td >" + ll6.get(0) + "</td>");
                                                    out.print("</tr> ");

                                                    out.print("<tr>");
                                                    out.print("<td >" + "应收账款" + "</td>");
                                                    out.print("<td >" + "2" + "</td>");
                                                    out.print("<td >" + ll5.get(1) + "</td>");
                                                    out.print("<td >" + "应付账款" + "</td>");
                                                    out.print("<td >" + "2" + "</td>");
                                                    out.print("<td >" + ll6.get(1) + "</td>");
                                                    out.print("</tr> ");

                                                    out.print("<tr>");
                                                    out.print("<td >" + "坏账准备" + "</td>");
                                                    out.print("<td >" + "3" + "</td>");
                                                    out.print("<td >" + ll5.get(2) + "</td>");
                                                    out.print("<td >" + "应交税金" + "</td>");
                                                    out.print("<td >" + "3" + "</td>");
                                                    out.print("<td >" + ll6.get(2) + "</td>");
                                                    out.print("</tr> ");

                                                    out.print("<tr>");
                                                    out.print("<td >" + "流动资产合计" + "</td>");
                                                    out.print("<td >" + "</td>");
                                                    out.print("<td >" + ll5.get(3) + "</td>");
                                                    out.print("<td >" + "流动负债合计" + "</td>");
                                                    out.print("<td >" + "</td>");
                                                    out.print("<td >" + ll6.get(3) + "</td>");
                                                    out.print("</tr> ");

                                                    out.print("<tr class='success'>");
                                                                                                        out.print("<td >" + "固定资产：" + "</td>");
                                                    out.print("<td >" + "</td>");
                                                    out.print("<td >" + "</td>");
                                                    out.print("<td >" + "所有者权益：" + "</td>");
                                                    out.print("<td >" + "</td>");
                                                    out.print("<td >" + "</td>");
                                                    out.print("</tr> ");

                                                    out.print("<tr>");
                                                    out.print("<td >" + "固定资产原值" + "</td>");
                                                    out.print("<td >" + "1" + "</td>");
                                                    out.print("<td >" + ll5.get(4) + "</td>");
                                                    out.print("<td >" + "实收资本" + "</td>");
                                                    out.print("<td >" + "1" + "</td>");
                                                    out.print("<td >" + ll6.get(4) + "</td>");
                                                    out.print("</tr> ");

                                                    out.print("<tr>");
                                                    out.print("<td >" + "累计折旧" + "</td>");
                                                    out.print("<td >" + "2" + "</td>");
                                                    out.print("<td >" + ll5.get(5) + "</td>");
                                                    out.print("<td >" + "盈余公积" + "</td>");
                                                    out.print("<td >" + "2" + "</td>");
                                                    out.print("<td >" + ll6.get(5) + "</td>");
                                                    out.print("</tr> ");

                                                    out.print("<tr>");
                                                    out.print("<td >" + "固定资产净值" + "</td>");
                                                    out.print("<td >" + "3" + "</td>");
                                                    out.print("<td >" + ll5.get(6) + "</td>");
                                                    out.print("<td >" + "未分配利润" + "</td>");
                                                    out.print("<td >" + "3" + "</td>");
                                                    out.print("<td >" + ll6.get(6) + "</td>");
                                                    out.print("</tr> ");

                                                    out.print("<tr>");
                                                    out.print("<td >" + "</td>");
                                                    out.print("<td >" + "</td>");
                                                    out.print("<td >" + "</td>");
                                                    out.print("<td >" + "所有者权益合计" + "</td>");
                                                    out.print("<td >" + "4" + "</td>");
                                                    out.print("<td >" + ll6.get(7) + "</td>");
                                                    out.print("</tr> ");

                                                    out.print("<tr class='success'>");
                                                    out.print("<td >" + "资产合计：" + "</td>");
                                                    out.print("<td >" + "</td>");
                                                    out.print("<td >" + ll5.get(8)+ "</td>");
                                                    out.print("<td >" + "负债及所有者权益合计" + "</td>");
                                                    out.print("<td >" + "</td>");
                                                    out.print("<td >" + ll6.get(8)+ "</td>");
                                                    out.print("</tr> ");

                                                    rs.close();
                                                    conn.close();
                                                    } catch (ClassNotFoundException e) {
                                                    System.out.println("Sorry,can`t find the Driver!");
                                                    e.printStackTrace();
                                                    } catch (SQLException e) {
                                                    e.printStackTrace();
                                                    } catch (Exception e) {
                                                    e.printStackTrace();
                                                    }
                                                    %>
                                            </tbody>
                                        </table>
                                            </form>
                                          </div>
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade" id="profile3">
                                    <h3>欢迎查看2017年利润表</h3>
                                        <div class="panel panel-default panel-table">
                                          <div class="panel-body">
                                        <table class="table">
                                        <thead>
                                            <tr>
                                                <th>
                                                    项目
                                                </th>
                                                <th>
                                                    行次
                                                </th>
                                                <th>
                                                    本年数
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <tr class="success">
                                        <td>
                                            一、收入
                                        </td>
                                        <td></td>
                                        <td></td>
                                        </tr>
                                        <% 
                                        String driver2 = "com.mysql.jdbc.Driver";
                                        String url2 = "jdbc:mysql://w.rdc.sae.sina.com.cn:3306/app_fmanager";
                                        String user2 = "o25w1j0kwk";
                                        String password2 = "2mk0mkl22jkz214ikx11w0imy3k5yikmy115xwlw";
                                        List<String> ll2 =new ArrayList<String>();
                                        try {
                                        Class.forName(driver2);
                                        Connection conn = DriverManager.getConnection(url2, user2, password2);
                                        Statement statement = conn.createStatement();
                                        String sql = "select * from year_lirun where year=\"2017\"";
                                        ResultSet rs = statement.executeQuery(sql);
                                        String temp = null;
                                        while (rs.next()) { 
                                            temp = rs.getString("number");
                                            ll2.add(temp);
                                        }
                                        out.print("<tr>");
                                        out.print("<td >" + "主营业务收入" + "</td>");
                                        out.print("<td >" + "1" + "</td>");
                                        out.print("<td >" + ll2.get(0) + "</td>");
                                        out.print("</tr> ");
                                        out.print("<tr >");
                                        out.print("<td >" + "投资收益" + "</td>");
                                        out.print("<td >" + "2" + "</td>");
                                        out.print("<td >" + ll2.get(1) + "</td>");
                                        out.print("</tr> ");
                                        out.print("<tr>");
                                        out.print("<td >" + "营业外收入" + "</td>");
                                        out.print("<td >" + "3" + "</td>");
                                        out.print("<td >" + ll2.get(2) + "</td>");
                                        out.print("</tr> ");
                                        out.print("<tr>");
                                        out.print("<td >" + "收入合计" + "</td>");
                                        out.print("<td >" + "</td>");
                                        out.print("<td >" + ll2.get(3) + "</td>");
                                        out.print("</tr> ");
                                        out.print("<tr class='success'>");
                                        out.print("<td >" + "二、费用" + "</td>");
                                        out.print("<td >" + "</td>");
                                        out.print("<td >" + "</td>");
                                        out.print("</tr> ");
                                        out.print("<tr>");
                                        out.print("<td >" + "营业成本" + "</td>");
                                        out.print("<td >" + "1" + "</td>");
                                        out.print("<td >" + ll2.get(4) + "</td>");
                                        out.print("</tr> ");
                                        out.print("<tr>");
                                        out.print("<td >" + "管理费用" + "</td>");
                                        out.print("<td >" + "2" + "</td>");
                                        out.print("<td >" + ll2.get(5) + "</td>");
                                        out.print("</tr> ");
                                        out.print("<tr>");
                                        out.print("<td >" + "财务费用" + "</td>");
                                        out.print("<td >" + "3" + "</td>");
                                        out.print("<td >" + ll2.get(6) + "</td>");
                                        out.print("</tr> ");
                                        out.print("<tr>");
                                        out.print("<td >" + "营业外支出" + "</td>");
                                        out.print("<td >" + "4" + "</td>");
                                        out.print("<td >" + ll2.get(7) + "</td>");
                                        out.print("</tr> ");
                                        out.print("<tr>");
                                        out.print("<td >" + "所得税" + "</td>");
                                        out.print("<td >" + "5" + "</td>");
                                        out.print("<td >" + ll2.get(8) + "</td>");
                                        out.print("</tr> ");
                                        out.print("<tr>");
                                        out.print("<td >" + "费用合计" + "</td>");
                                        out.print("<td >" + "</td>");
                                        out.print("<td >" + ll2.get(9) + "</td>");
                                        out.print("</tr> ");
                                        out.print("<tr class='success'>");
                                        out.print("<td >" + "三、净利润" + "</td>");
                                        out.print("<td >" + "</td>");
                                        out.print("<td >" + ll2.get(10) + "</td>");
                                        out.print("</tr> ");
                                        rs.close();
                                        conn.close();
                                        } catch (ClassNotFoundException e) {
                                        System.out.println("Sorry,can`t find the Driver!");
                                        e.printStackTrace();
                                        } catch (SQLException e) {
                                        e.printStackTrace();
                                        } catch (Exception e) {
                                        e.printStackTrace();
                                        }
                                        %>
                                        </tbody>
                                    </table>
                                        </div>
                                    </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade" id="messages3">
                                        <h3>欢迎查看2017年现金流量表</h3>
                                        <div class="panel panel-default panel-table">
                                          <div class="panel-body">
                                            <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>
                                                        项目
                                                    </th>
                                                    <th>
                                                        行次
                                                    </th>
                                                    <th>
                                                        本年数
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <tr class="success">
                                                <td>
                                                    一、经营活动活动产生的现金流量：
                                                </td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <% 
                                            String driver4 = "com.mysql.jdbc.Driver";
                                            String url4 = "jdbc:mysql://w.rdc.sae.sina.com.cn:3306/app_fmanager";
                                            String user4 = "o25w1j0kwk";
                                            String password4 = "2mk0mkl22jkz214ikx11w0imy3k5yikmy115xwlw";
                                            List<String> ll4 =new ArrayList<String>();
                                            try {
                                            Class.forName(driver4);
                                            Connection conn = DriverManager.getConnection(url4, user4, password4);
                                            Statement statement = conn.createStatement();
                                            String sql = "select * from year_cash where thisyear=\"2017\"";
                                            ResultSet rs = statement.executeQuery(sql);
                                            String temp = null;
                                            while (rs.next()) { 
                                                temp = rs.getString("number");
                                                ll4.add(temp);
                                            }
                                            out.print("<tr>");
                                            out.print("<td >" + "收取利息、手续费及佣金的现金" + "</td>");
                                            out.print("<td >" + "1" + "</td>");
                                            out.print("<td >" + ll4.get(0) + "</td>");
                                            out.print("</tr> ");
                                            out.print("<tr>");
                                            out.print("<td >" + "收到其他与经营活动有关的现金" + "</td>");
                                            out.print("<td >" + "2" + "</td>");
                                            out.print("<td >" + ll4.get(1) + "</td>");
                                            out.print("</tr> ");
                                            out.print("<tr>");
                                            out.print("<td >" + "经营活动现金流入小计" + "</td>");
                                            out.print("<td >" + "3" + "</td>");
                                            out.print("<td >" + ll4.get(2) + "</td>");
                                            out.print("</tr> ");
                                            out.print("<tr>");
                                            out.print("<td >" + "支付利息、手续费及佣金的现金" + "</td>");
                                            out.print("<td >" + "4" + "</td>");
                                            out.print("<td >" + ll4.get(3) + "</td>");
                                            out.print("</tr> ");
                                            out.print("<tr>");
                                            out.print("<td >" + "支付给职工以及为职工支付的现金" + "</td>");
                                            out.print("<td >" + "5" + "</td>");
                                            out.print("<td >" + ll4.get(4) + "</td>");
                                            out.print("</tr> ");
                                            out.print("<tr>");
                                            out.print("<td >" + "支付的各项税款" + "</td>");
                                            out.print("<td >" + "6" + "</td>");
                                            out.print("<td >" + ll4.get(5) + "</td>");
                                            out.print("</tr> ");
                                            out.print("<tr>");
                                            out.print("<td >" + "支付其他与经营活动有关的现金" + "</td>");
                                            out.print("<td >" + "7" + "</td>");
                                            out.print("<td >" + ll4.get(6) + "</td>");
                                            out.print("</tr> ");
                                            out.print("<tr>");
                                            out.print("<td >" + "经营活动产生的现金流量净额" + "</td>");
                                            out.print("<td >" + "9" + "</td>");
                                            out.print("<td >" + ll4.get(8) + "</td>");
                                            out.print("</tr> ");
                                            out.print("<tr class='success'>");
                                            out.print("<td >" + "二、投资活动产生的现金流量：" + "</td>");
                                            out.print("<td >" + "</td>");
                                            out.print("<td >" + "</td>");
                                            out.print("</tr> ");
                                            out.print("<tr>");
                                            out.print("<td >" + "收回投资收到的现金" + "</td>");
                                            out.print("<td >" + "1" + "</td>");
                                            out.print("<td >" + ll4.get(9) + "</td>");
                                            out.print("</tr> ");
                                            out.print("<tr>");
                                            out.print("<td >" + "取得投资收益收到的现金" + "</td>");
                                            out.print("<td >" + "2" + "</td>");
                                            out.print("<td >" + ll4.get(10) + "</td>");
                                            out.print("</tr> ");
                                            out.print("<tr>");
                                            out.print("<td >" + "投资支付的现金" + "</td>");
                                            out.print("<td >" + "3" + "</td>");
                                            out.print("<td >" + ll4.get(11) + "</td>");
                                            out.print("</tr> ");
                                            out.print("<tr>");
                                            out.print("<td >" + "投资活动产生的现金流量净额" + "</td>");
                                            out.print("<td >" + "4" + "</td>");
                                            out.print("<td >" + ll4.get(12) + "</td>");
                                            out.print("</tr> ");
                                            out.print("<tr class='success'>");
                                            out.print("<td >" + "三、筹资活动产生的现金流量" + "</td>");
                                            out.print("<td >" + "</td>");
                                            out.print("<td >" + "</td>");
                                            out.print("</tr> ");
                                            out.print("<tr>");
                                            out.print("<td >" + "吸收投资收到的现金" + "</td>");
                                            out.print("<td >" + "1" + "</td>");
                                            out.print("<td >" + ll4.get(13) + "</td>");
                                            out.print("</tr> ");
                                            out.print("<tr>");
                                            out.print("<td >" + "发行债券收到的现金" + "</td>");
                                            out.print("<td >" + "2" + "</td>");
                                            out.print("<td >" + ll4.get(14) + "</td>");
                                            out.print("</tr> ");
                                            out.print("<tr>");
                                            out.print("<td >" + "偿还债务支付的现金" + "</td>");
                                            out.print("<td >" + "3" + "</td>");
                                            out.print("<td >" + ll4.get(15) + "</td>");
                                            out.print("</tr> ");
                                            out.print("<tr>");
                                            out.print("<td >" + "分配股利、利润或偿付利息支付的现金" + "</td>");
                                            out.print("<td >" + "4" + "</td>");
                                            out.print("<td >" + ll4.get(16) + "</td>");
                                            out.print("</tr> ");
                                            out.print("<tr>");
                                            out.print("<td >" + "筹资活动产生的现金流量净额" + "</td>");
                                            out.print("<td >" + "5" + "</td>");
                                            out.print("<td >" + ll4.get(17) + "</td>");
                                            out.print("</tr> ");
                                            out.print("<tr>");
                                            out.print("<td >" + "筹资活动产生的现金流量净额" + "</td>");
                                            out.print("<td >" + "5" + "</td>");
                                            out.print("<td >" + ll4.get(17) + "</td>");
                                            out.print("</tr> ");
                                            rs.close();
                                            conn.close();
                                            } catch (ClassNotFoundException e) {
                                            System.out.println("Sorry,can`t find the Driver!");
                                            e.printStackTrace();
                                            } catch (SQLException e) {
                                            e.printStackTrace();
                                            } catch (Exception e) {
                                            e.printStackTrace();
                                            }
                                            %>
                                            </tbody>
                                        </table>
                                          </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                              <div class="col-md-4 col-md-offset-4">
                                <div class="material-button-anim">
                                  <ul class="list-inline" id="options">
                                    <li class="option">
                                      <button class="material-button option1" type="button">
                                        <span class="fa fa-file-word-o" aria-hidden="true"></span>
                                      </button>
                                    </li>
                                    <li class="option">
                                      <button class="material-button option2" type="button">
                                        <span class="fa fa-circle" aria-hidden="true"></span>
                                      </button>
                                    </li>
                                    <li class="option">
                                      <button class="material-button option3" type="button">
                                        <span class="fa fa-bar-chart-o" aria-hidden="true"></span>
                                      </button>
                                    </li>
                                  </ul>
                                  <button class="material-button material-button-toggle" type="button">
                                    <span class="fa fa-plus" aria-hidden="true"></span>
                                  </button>
                                </div>
                              </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </form>
    </div>
</section>

</div>
</div>
</body>
</html>
                                                    