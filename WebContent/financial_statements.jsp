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
</head>
   <style type="text/css">
	body { 
	  background: url(image/fsbg.jpg) no-repeat center center fixed; 
	  -webkit-background-size: cover;
	  -moz-background-size: cover;
	  -o-background-size: cover;
	  background-size: cover;
	}
</style>
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
                                <i class="glyphicon glyphicon-folder-open"></i>
                            </span>
                        </a>
                    </li>

                    <li role="presentation" class="disabled">
                        <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" title="月报表">
                            <span class="round-tab">
                                <i class="glyphicon glyphicon-picture"></i>
                            </span>
                        </a>
                    </li>

                    <li role="presentation" class="disabled">
                        <a href="#complete" data-toggle="tab" aria-controls="complete" role="tab" title="年报表">
                            <span class="round-tab">
                                <i class="glyphicon glyphicon-ok"></i>
                            </span>
                        </a>
                    </li>
                </ul>
            </div>

            <form role="form">
                <div class="tab-content">
                    <div class="tab-pane active" role="tabpanel" id="step1">
                        <h3>日报表</h3>
                        <div class="container" style="margin-top: 10px">
							<div class="row">
								<div class="col col-sm-2">
						    	    <ul class="nav nav-tabs nav-stacked text-center" role="tablist">
						                <li role="presentation" class="active"><a href="#home1" aria-controls="home" role="tab" data-toggle="tab">资产负债表</a></li>
						                <li role="presentation"><a href="#profile1" aria-controls="profile" role="tab" data-toggle="tab">利润表</a></li>
						                <li role="presentation"><a href="#messages1" aria-controls="messages" role="tab" data-toggle="tab">现金流量表</a></li>
						            </ul>
								</div>
						        <div class="col col-sm-8">
						            <div class="row tab-content">
						                <div role="tabpanel" class="tab-pane fade active in" id="home1">

						                </div>
						                <div role="tabpanel" class="tab-pane fade" id="profile1">
						                    Lorem Ipsum2
						                </div>
						                <div role="tabpanel" class="tab-pane fade" id="messages1">
						                    Lorem Ipsum3
						                </div>
						            </div>
								</div>
							</div>
						</div>
                        <ul class="list-inline pull-right">
                            <li><button type="button" class="btn btn-primary next-step">Save and continue</button></li>
                        </ul>
                    </div>
                    
                    <div class="tab-pane" role="tabpanel" id="step3">
                        <h3>月报表</h3>
                        <div class="container" style="margin-top: 10px">
							<div class="row">
								<div class="col col-sm-2">
						    	    <ul class="nav nav-tabs nav-stacked text-center" role="tablist">
						                <li role="presentation" class="active"><a href="#home2" aria-controls="home" role="tab" data-toggle="tab">资产负债表</a></li>
						                <li role="presentation"><a href="#profile2" aria-controls="profile" role="tab" data-toggle="tab">利润表</a></li>
						                <li role="presentation"><a href="#messages2" aria-controls="messages" role="tab" data-toggle="tab">现金流量表</a></li>
						            </ul>
								</div>
						        <div class="col col-sm-8">
						            <div class="row tab-content">
						                <div role="tabpanel" class="tab-pane fade active in" id="home2">
						                    Lorem Ipsum1
						                </div>
						                <div role="tabpanel" class="tab-pane fade" id="profile2">
						                    Lorem Ipsum2
						                </div>
						                <div role="tabpanel" class="tab-pane fade" id="messages2">
						                    Lorem Ipsum3
						                </div>
						            </div>
								</div>
							</div>
						</div>
                        <ul class="list-inline pull-right">
                            <li><button type="button" class="btn btn-default prev-step">Previous</button></li>
                            <li><button type="button" class="btn btn-default next-step">Skip</button></li>
                            <li><button type="button" class="btn btn-primary btn-info-full next-step">Save and continue</button></li>
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
						                    						                    <div class="panel panel-default panel-table">
								              <div class="panel-heading">
								                <div class="row">
								                  <div class="col col-xs-6">
								                    <h3 class="panel-title">资产负债表</h3>
								                  </div>
								                </div>
								              </div>
								              <div class="panel-body">
								                <table class="table table-striped table-bordered table-list">
								                  <thead>
								                    <tr>
								                        <th>资产</th>
								                        <th>行次</th>
								                        <th>年初数</th>
								                        <th>期末数</th>
								                        <th>项目</th>
								                        <th>行次</th>
								                        <th>年初数</th>
								                        <th>期末数</th>
								                    </tr> 
								                  </thead>
								                  <tbody>
						                            <% 
														String driver = "com.mysql.jdbc.Driver";
														String url = "jdbc:mysql://127.0.0.1:3306/FManager";
														String user = "root";
														String password = "Vccxx2016";
														try {
														Class.forName(driver);
														Connection conn = DriverManager.getConnection(url, user, password);
														Statement statement = conn.createStatement();
														String sql = "select * from assets where year=\"2017\"";
														ResultSet rs = statement.executeQuery(sql);
														String zichang = null;
														String hangci1=null;
														String nianchushu1=null;
														String qimoshu1=null;
														String xiangmu=null;
														String hangci2=null;
														String nianchushu2=null;
														String qimoshu2=null;
														while (rs.next()) { 
															zichang = rs.getString("asset"); 
															hangci1 = rs.getString("line1"); 
															nianchushu1 = rs.getString("begin1"); 
															qimoshu1 = rs.getString("last1"); 
															xiangmu = rs.getString("project");
															hangci2 = rs.getString("line2");
															nianchushu2 = rs.getString("begin2");
															qimoshu2 = rs.getString("last2");
															out.print("<tr class='success'>");
															out.print("<td >" + zichang + "</td>");
															out.print("<td >" + hangci1 + "</td>");
															out.print("<td >" + nianchushu1 + "</td>");
															out.print("<td >" + qimoshu1 + "</td>");
															out.print("<td >" + xiangmu + "</td>");
															out.print("<td >" + hangci2 + "</td>");
															out.print("<td >" + nianchushu2 + "</td>");
															out.print("<td >" + qimoshu2 + "</td>");
															out.print("</tr> ");
														}
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
						                <div role="tabpanel" class="tab-pane fade" id="profile3">
						                    <div class="panel panel-default panel-table">
								              <div class="panel-heading">
								                <div class="row">
								                  <div class="col col-xs-6">
								                    <h3 class="panel-title">利润表</h3>
								                  </div>
								                </div>
								              </div>
								              <div class="panel-body">
								                <table class="table table-striped table-bordered table-list">
								                  <thead>
								                    <tr>
								                        <th>项目</th>
								                        <th>本年累计数</th>
								                    </tr> 
								                  </thead>
								                  <tbody>
								                    	<% 
														String driver1 = "com.mysql.jdbc.Driver";
														String url1 = "jdbc:mysql://127.0.0.1:3306/FManager";
														String user1 = "root";
														String password1 = "Vccxx2016";
														try {
														Class.forName(driver1);
														Connection conn = DriverManager.getConnection(url1, user1, password1);
														Statement statement = conn.createStatement();
														String sql = "select * from profit where year=\"2017\"";
														ResultSet rs = statement.executeQuery(sql);
														String xiangmu = null;
														String nianleiji=null;
														while (rs.next()) { 
															xiangmu = rs.getString("project"); 
															nianleiji = rs.getString("Accumulated"); 
															out.print("<tr class='success'>");
															out.print("<td >" + xiangmu + "</td>");
															out.print("<td >" + nianleiji + "</td>");
															out.print("</tr> ");
														}
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
						                    <div class="panel panel-default panel-table">
								              <div class="panel-heading">
								                <div class="row">
								                  <div class="col col-xs-6">
								                    <h3 class="panel-title">现金流量表</h3>
								                  </div>
								                </div>
								              </div>
								              <div class="panel-body">
								                <table class="table table-striped table-bordered table-list">
								                  <thead>
								                    <tr>
								                        <th>项目</th>
								                        <th class="hidden-xs">本期金额</th>
								                        <th>上期金额</th>
								                    </tr> 
								                  </thead>
								                  <tbody>
								                        <% 
														String driver2 = "com.mysql.jdbc.Driver";
														String url2 = "jdbc:mysql://127.0.0.1:3306/FManager";
														String user2 = "root";
														String password2 = "Vccxx2016";
														try {
														Class.forName(driver2);
														Connection conn = DriverManager.getConnection(url2, user2, password2);
														Statement statement = conn.createStatement();
														String sql = "select * from cash_flow where year=\"2017\"";
														ResultSet rs = statement.executeQuery(sql);
														String xiangmu = null;
														String benqi=null;
														String shangqi=null;
														while (rs.next()) { 
															xiangmu = rs.getString("project"); 
															benqi = rs.getString("now");
															shangqi = rs.getString("previous");
															out.print("<tr class='success'>");
															out.print("<td >" + xiangmu + "</td>");
															out.print("<td >" + benqi + "</td>");
															out.print("<td >" + shangqi + "</td>");
															out.print("</tr> ");
														}
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