<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/NewTable.css">
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>



<body>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>

<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<p>
				<font size="10">你好 xx 经理</font>
			</p>
		</div>
	</div>
</div>


<div class="container">
    <div class="row">
    
    <p></p>
    <h1>请进行记录财务变更</h1>
    <p></p><p></p>
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default panel-table">
              <div class="panel-heading">
                <div class="row">
                  <div class="col col-xs-6">
                    <h3 class="panel-title">Panel Heading</h3>
                  </div>
                  <div class="col col-xs-6 text-right">
                    <button type="button" class="btn btn-sm btn-primary btn-create">Create New</button>
                  </div>
                </div>
              </div>
              <div class="panel-body">
                <table class="table table-striped table-bordered table-list">
                  <thead>
                    <tr>
                        <!-- <th><em class="fa fa-cog"></em></th> -->
                        <th class="hidden-xs">编号</th>

                        <th>操作人姓名</th>
                        <th>操作内容</th>
                        <th>操作时间</th>
                        <th>操作类型(增/删/改/查)</th>
                    </tr> 
                  </thead>
                  <tbody>
                          <tr>
                            <!-- <td align="center"> -->
                            <!-- <a class="btn btn-default"><em class="fa fa-pencil"></em></a> -->
                            <!-- <a class="btn btn-danger"><em class="fa fa-trash"></em></a> -->
                            <td class="hidden-xs">1</td>
                            <td>Chris</td>
                            <td>xx部门员工xx工资由xx改为</td>
                            <td>2017-10-05</td>
                            <td>改</td>
                          </tr>
                          <tr>
                            <td>2</td>
                            <td>Tom</td>
                            <td>将xx员工工资添加到数据库</td>
                            <td>2017-11-11</td>
                            <td>增</td>
                          </tr>
                  </tbody>
                </table>
            
              </div>
              <div class="panel-footer">
                <div class="row">
                  <div class="col col-xs-4">Page 1 of 5
                  </div>
                  <div class="col col-xs-8">
                    <ul class="pagination hidden-xs pull-right">
                      <li><a href="#">1</a></li>
                      <li><a href="#">2</a></li>
                      <li><a href="#">3</a></li>
                      <li><a href="#">4</a></li>
                      <li><a href="#">5</a></li>
                    </ul>
                    <ul class="pagination visible-xs pull-right">
                        <li><a href="#">«</a></li>
                        <li><a href="#">»</a></li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
</div></div></div> 

<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<table class="table">
				<thead>
					<tr>
						<th>操作</th>
						<th>分布比例</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>增</td>
						<td>TB - Monthly</td>
					</tr>
					<tr class="success">
						<td>删</td>
						<td>TB - Monthly</td>
					</tr>
					<tr class="error">
						<td>改</td>
						<td>TB - Monthly</td>
					</tr>
					<tr class="warning">
						<td>查</td>
						<td>TB - Monthly</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>