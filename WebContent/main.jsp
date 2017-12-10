<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
    <title>Bootstrap Coupons</title>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<style type="text/css">
	body{
		background-image:url(image/acbg.jpg);
		background-size:100% 100%;
	}
</style>
</head>
<body>
<div class="container">
	<h1>
	  <a href="" class="typewrite" data-period="2000" data-type='[ "Hi,<%=request.getAttribute("id")%>","Welcome to Online Finacial Management System", "Any Advice From You Is Important for us", "Thanks and Enjoy!" ]'>
	    <span class="wrap"></span>
	  </a>
	</h1>
    <div class="row"><h1 class="text-center">功能选择</h1>
        <p class="text-center">又是充满干劲的一天呢！</p>
    </div>
	<c:if test='<%=request.getAttribute("userid").equals("1")%>'>
    <div id="quicknav">
        <ul>
            <li><a href="#red" class="btn btn-danger">生成财务报表</a></li>
            <li><a href="#green" class="btn btn-success">输入会计凭证</a></li>
            <li><a href="#lightblue" class="btn btn-info">发票生成和打印</a></li>
            <li><a href="#yellow" class="btn btn-warning">员工工资参数调整</a></li>
        </ul>
    </div>
    </c:if>
   	<c:if test='<%=request.getAttribute("userid").equals("2")%>'>
   		<div id="quicknav">
        	<ul>
        		<li><a href="#blue" class="btn btn-primary">查看财务变更</a></li>
         	</ul>
   		 </div>
       </c:if>

   	<c:if test='<%=request.getAttribute("userid").equals("0")%>'>
   		<div id="quicknav">
        	<ul>
        		<li><a href="#blue" class="btn btn-primary">账户管理</a></li>
         	</ul>
   		 </div>
     </c:if>
    <c:if test='<%=request.getAttribute("userid").equals("1")%>'>
    <div class="row"><h4 class="text-center"><u>会计功能简述</u></h4></div>
    
    <div class="row" id="red">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-danger coupon">
              <div class="panel-heading" id="head">
                <div class="panel-title" id="title">
                    <i class="fa fa-github fa-2x"></i>
                    <span class="hidden-xs">生成财务报表</span>
                    <span class="visible-xs">生成财务报表</span>
                </div>
              </div>
              <div class="panel-body">
                <img src="./image/baobiao.jpg" class="coupon-img img-rounded">
                <div class="col-md-9">
                    <ul class="items">
                        <li>你可以在此处提交和生成财务报表，包括：</li>
                        <li>日报表、月报表、年报表</li>
                        <li>现金流量表</li>
                        <li>利润表</li>
                        <li>资产负债表</li>
                    </ul>
                </div>
                <div class="col-md-3">
                    <div class="offer text-danger">
                        <span class="number">01</span>
                    </div>
                </div>
              </div>
              <div class="panel-footer">
                <div class="coupon-code">
                    <span class="print">
                        <a href="financial_statements.jsp" class="btn btn-link">使用</a>
                    </span>
                </div>
                <div class="exp"> &nbsp</div>
                <div class="exp"> &nbsp </div>
              </div>
            </div>
    	</div>
    </div>
    
    <div class="row" id="green">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-success coupon">
              <div class="panel-heading" id="head">
                <div class="panel-title" id="title">
                    <i class="fa fa-github fa-2x"></i>
                    <span class="hidden-xs">输入会计凭证</span>
                    <span class="visible-xs">输入会计凭证</span>
                </div>
              </div>
              <div class="panel-body">
                <img src="./image/pingzheng.jpg" class="coupon-img img-rounded">
                <div class="col-md-9">
                    <ul class="items">
                        <li>记录每笔收入</li>
                        <li>此功能的输入作为生成各项财务报表</li>
                        <li>以及统计和计算收支情况的重要依据</li>
                        <li>如要定制凭证内容，请联系系统管理员：17745604023</li>
                    </ul>
                </div>
                <div class="col-md-3">
                    <div class="offer text-success">
                        <span class="number">02</span>
                    </div>
                </div>
              </div>
              <div class="panel-footer">
                <div class="coupon-code">
                    <span class="print">
                        <a href="FMInp.jsp" class="btn btn-link"> 使用</a>
                    </span>
                </div>
               <div class="exp"> &nbsp</div>
                <div class="exp"> &nbsp </div>
              </div>
            </div>
        </div>
    </div>
    
    <div class="row" id="lightblue">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-info coupon">
              <div class="panel-heading" id="head">
                <div class="panel-title" id="title">
                    <i class="fa fa-github fa-2x"></i>
                    <span class="hidden-xs">发票生成和打印</span>
                    <span class="visible-xs">发票生成和打印</span>
                </div>
              </div>
              <div class="panel-body">
                <img src="./image/fapiao.jpg" class="coupon-img img-rounded">
                <div class="col-md-9">
                    <ul class="items">
                        <li>按以下步骤生成和打印发票：</li>
                        <li>1.填写发票信息</li>
                        <li>2.点击生成发票</li>
                        <li>3.可选择保存电子版发票或者打印发票</li>
                    </ul>
                </div>
                <div class="col-md-3">
                    <div class="offer text-info">
                        <span class="number">03</span>
                    </div>
                </div>
              </div>
              <div class="panel-footer">
                <div class="coupon-code">
                    <span class="print">
                        <a href="#" class="btn btn-link">使用</a>
                    </span>
                </div>
               <div class="exp"> &nbsp</div>
                <div class="exp"> &nbsp </div>
              </div>
            </div>
        </div>
    </div>
    
    <div class="row" id="yellow">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-warning coupon">
              <div class="panel-heading" id="head">
                <div class="panel-title" id="title">
                    <i class="fa fa-github fa-2x"></i>
                    <span class="hidden-xs">员工工资参数调整</span>
                    <span class="visible-xs">员工工资参数调整</span>
                </div>
              </div>
              <div class="panel-body">
                <img src="./image/canshu.jpg" class="coupon-img img-rounded">
                <div class="col-md-9">
                    <ul class="items">
                        <li>这里可以设置你厂员工的工资参数</li>
                        <li>包括税率，工资发放时间等</li>
                    </ul>
                </div>
                <div class="col-md-3 text-warning">
                    <div class="offer">
                        <span class="number">04</span>
                    </div>
                </div>
              </div>
              <div class="panel-footer">
                <div class="coupon-code">
                    <span class="print">
                        <a href="#" class="btn btn-link">使用</a>
                    </span>
                </div>
               <div class="exp"> &nbsp</div>
                <div class="exp"> &nbsp </div>
              </div>
            </div>
        </div>
    </div>
    </c:if>
    <c:if test='<%=request.getAttribute("userid").equals("2")%>'>
    <div class="row"><h4 class="text-center"><u>经理功能简述</u></h4></div>
    <div class="row" id="blue">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-primary coupon">
              <div class="panel-heading" id="head">
                <div class="panel-title" id="title">
                    <i class="fa fa-github fa-2x"></i>
                    <span class="hidden-xs">查看财务变更</span>
                    <span class="visible-xs">查看财务变更</span>
                </div>
              </div>
              <div class="panel-body">
                <img src="http://i.imgur.com/e07tg8R.png" class="coupon-img img-rounded">
                <div class="col-md-9">
                    <ul class="items">
                        <li>任何财务更改都将在这里被记录</li>
                    </ul>
                </div>
                <div class="col-md-3">
                    <div class="offer text-primary">
                        <span class="number">01</span>
                    </div>
                </div>
              </div>
              <div class="panel-footer">
                <div class="coupon-code">
                    <span class="print">
                        <a href="#" class="btn btn-link"> 使用</a>
                    </span>
                </div>
               <div class="exp"> &nbsp</div>
                <div class="exp"> &nbsp </div>
              </div>
            </div>
        </div>
    </div>
     </c:if>
   <c:if test='<%=request.getAttribute("userid").equals("0")%>'>
    <div class="row">
    <h4 class="text-center"><u>管理员功能简介</u></h4></div>
    <div class="row" id="blue">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-primary coupon">
              <div class="panel-heading" id="head">
                <div class="panel-title" id="title">
                    <i class="fa fa-github fa-2x"></i>
                    <span class="hidden-xs">账户管理</span>
                    <span class="visible-xs">账户管理</span>
                </div>
              </div>
              <div class="panel-body">
                <img src="./image/root.jpg" class="coupon-img img-rounded">
                <div class="col-md-9">
                    <ul class="items">
                        <li>这是管理员专用页面</li>
                        <li>用于管理各账户权限</li>
                        <li>包括增加、修改、删除用户以及修改权限</li>
                    </ul>
                </div>
                <div class="col-md-3">
                    <div class="offer text-primary">
                        <span class="number">01</span>
                    </div>
                </div>
              </div>
              <div class="panel-footer">
                <div class="coupon-code">
                    <span class="print">
                        <a href="showAccount.action" class="btn btn-info">使用</a>
                    </span>
                </div>
                <div class="exp">&nbsp</div>
                <div class="exp"> &nbsp </div>
              </div>
            </div>
        </div>
    </div>
     </c:if>
    <p class="text-center"><a href="#" class="btn btn-default">Back to top <i class="fa fa-chevron-up"></i></a></p>
</div>
</body>