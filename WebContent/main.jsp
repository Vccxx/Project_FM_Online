<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Welcome!</title>  
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="js/main.js"></script>
	<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
	<div class="container">
		<h1>
		  <a href="" class="typewrite" data-period="2000" data-type='[ "Hi,<%=request.getAttribute("id")%>","Welcome to Online Finacial Management System", "Any Advice From You Is Important for us", "Thanks and Enjoy!" ]'>
		    <span class="wrap"></span>
		  </a>
		</h1>
            <div class="col-sm-12">
            <c:if test='<%=request.getAttribute("userid").equals("1")%>'>
                <div class="bs-calltoaction bs-calltoaction-warning">
                    <div class="row">
                        <div class="col-md-9 cta-contents">
                            <h1 class="cta-title">生成财务报表</h1>
                            <div class="cta-desc">
                             	<p>你可以在此处提交和生成财务报表，包括：</p>
                                <p>日报表、月报表、年报表</p>
                                <p>现金流量表</p>
                                <p>利润表</p>
                                <p>资产负债表</p>
                            </div>
                        </div>
                        <div class="col-md-3 cta-button">
                            <a href="#" class="btn btn-lg btn-block btn-warning">使用此功能</a>
                        </div>
                     </div>
                </div>
			</c:if>
			<c:if test='<%=request.getAttribute("userid").equals("2") || request.getAttribute("id").equals("3")%>'>
                <div class="bs-calltoaction bs-calltoaction-info">
                    <div class="row">
                        <div class="col-md-9 cta-contents">
                            <h1 class="cta-title">查看财务变更</h1>
                            <div class="cta-desc">
                                <p>任何财务更改都将在这里被记录</p>
                            </div>
                        </div>
                        <div class="col-md-3 cta-button">
                            <a href="#" class="btn btn-lg btn-block btn-info">使用此功能</a>
                        </div>
                     </div>
                </div>
			</c:if>
			<c:if test='<%=request.getAttribute("userid").equals("1")%>'>
                <div class="bs-calltoaction bs-calltoaction-success">
                    <div class="row">
                        <div class="col-md-9 cta-contents">
                            <h1 class="cta-title">发票生成和打印</h1>
                            <div class="cta-desc">
                                <p>1.填写发票信息</p>
                                <p>2.生成发票</p>
                                <p>3.打印发票</p>
                            </div>
                        </div>
                        <div class="col-md-3 cta-button">
                            <a href="#" class="btn btn-lg btn-block btn-success">使用此功能</a>
                        </div>
                     </div>
                </div>
			</c:if>	
			<c:if test='<%=request.getAttribute("userid").equals("1")%>'>
                <div class="bs-calltoaction bs-calltoaction-warning">
                    <div class="row">
                        <div class="col-md-9 cta-contents">
                            <h1 class="cta-title">员工工资发放和参数调整</h1>
                            <div class="cta-desc">
                                <p>这里可以设置你厂员工的工资参数</p>
                                <p>包括税率，工资发放时间等</p>
                            </div>
                        </div>
                        <div class="col-md-3 cta-button">
                            <a href="#" class="btn btn-lg btn-block btn-warning">使用此功能</a>
                        </div>
                     </div>
                </div>
			</c:if>	
			<c:if test='<%=request.getAttribute("userid").equals("0")%>'>
                <div class="bs-calltoaction bs-calltoaction-danger">
                    <div class="row">
                        <div class="col-md-9 cta-contents">
                            <h1 class="cta-title">账户管理</h1>
                            <div class="cta-desc">
                                <p>这是管理员专用页面</p>
                                <p> 用于管理各账户权限</p>
                                <p>包括增加、修改、删除用户以及修改权限</p>
                            </div>
                        </div>
                        <div class="col-md-3 cta-button">
                            <a href="#" class="btn btn-lg btn-block btn-danger">使用此功能</a>
                        </div>
                     </div>
                </div>
			</c:if>	
            </div>
        </div>
    </body>