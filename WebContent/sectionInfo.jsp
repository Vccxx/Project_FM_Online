<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Section Information Display</title>
	<style type="text/css">
		body{
			background-image:url(image/secInfo.jpg);
			background-size:100% 100%;
		}
	</style>
	  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="js/jquery3.2.1.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="./css/sectionInfo.css" rel="stylesheet" type="text/css">
	<script src="./js/sectionInfo.js"></script>
	<link href="https://cdn.bootcss.com/toastr.js/latest/css/toastr.min.css" rel="stylesheet">
	<script src="https://cdn.bootcss.com/toastr.js/latest/js/toastr.min.js"></script>
</head>
<body>
<div class="modal fade" id="change_modal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">
						更改部门
					</h4>
				</div>
				<div class="modal-body">
			<form role="form">
				<label for="exampleInputPassword1">选择部门</label>
				<select class="form-control" onchange="selectOnchang(this)">
				<c:forEach var="section" items="${sectionInfo}">
						<option>${section.name}</option>
				</c:forEach>
				</select>
			</form>
				</div>
				<div class="modal-footer">
					<input type="hidden" id="name_to_change"  value="">
					<input type="hidden" id="id_to_change"  value="">
					 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> 
					 <button type="button" class="btn btn-primary" onclick="change_confirm(this)">确认调动</button>
				</div>
			</div>
		</div>
	</div>
<div class="container">
    <div class="row">
		<div class="col-md-12">
			<h3>部门信息管理</h3>
			<div class="tabbable-panel">
				<div class="tabbable-line">
					<ul id="firstSection" class="nav nav-tabs ">
						<li class="active">
							<a href="#tab_default_1" data-toggle="tab">
							所有员工 </a>
						</li>
						<% int i = 2; %>
						<c:forEach var="section" items="${sectionInfo}">
							<li>
								<a href=<%="#tab_default_"+String.valueOf(i)%> data-toggle="tab">${section.name}</a>
								<% i++; %>
							</li>
						</c:forEach>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="tab_default_1">
						    	<div class="row">
									<div class="col-md-6">
										<div class="panel panel-primary">
											<div class="panel-heading">
												<h3 class="panel-title">员工信息</h3>
												<div class="pull-right">
													<span class="clickable filter" data-toggle="tooltip" title="Toggle table filter" data-container="body">
														<i class="glyphicon glyphicon-filter"></i>
													</span>
												</div>
											</div>
											<div class="panel-body">
												<input type="text" class="form-control" id="dev-table-filter" data-action="filter" data-filters="#dev-table" placeholder="Filter Developers" />
											</div>
											<table class="table table-hover" id="dev-table">
												<thead>
												
													<tr>
														<th>#</th>
														<th>员工姓名</th>
														<th>所属部门</th>
														<th>员工账号</th>
														<th>人员调动</th>
													</tr>
												</thead>
												<tbody>
													<%int j = 1;%>
													<c:forEach var="userDet" items="${userDetail}">
													<tr>
														<td><%=j++ %></td>
														<td>${userDet.name}</td>
														<td id=<%="s"+ String.valueOf(j)%>>${userDet.belong}</td>
														<td>${userDet.account}</td>
														<td><button class="btn btn-success" data-toggle="modal" data-target="#change_modal" onclick="edit(this)">编辑</button></td>
													</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
						</div>
						<%int k = 2; %>
						 <%int m = 0; %>
						<c:forEach var="sectionDetail" items="${sectionInfo}">
						<div class="tab-pane" id="<%="tab_default_" +String.valueOf(k++) %>">
							 <div class="method">
							        <div class="row margin-0 list-header hidden-sm hidden-xs">
							            <div class="col-md-2"><div class="header">部门名称</div></div>
							            <div class="col-md-2"><div class="header">部门资金</div></div>
							            <div class="col-md-2"><div class="header">部门人数</div></div>
							            <div class="col-md-2"><div class="header">上属部门</div></div>
							            <div class="col-md-4"><div class="header">部门功能备注</div></div>
							        </div>
									
							        <div class="row margin-0">
							            <div class="col-md-2">
							                <div class="cell">
							                    <div class="propertyname">
							                        ${sectionDetail.name} <span class="mobile-isrequired"></span>
							                    </div>
							                </div>
							            </div>
							            <div class="col-md-2">
							                <div class="cell">
							                    <div class="type">
							                        <code>${sectionDetail.money} </code>
							                    </div>
							                </div>
							            </div>
							            <div class="col-md-2">
							                <div class="cell">
							                    <div class="isrequired">
							                        ${sectionDetail.number} 
							                    </div>
							                </div>
							            </div>
							            <div class="col-md-2">
							                <div class="cell">
							                    <div class="description">
							                         ${sectionDetail.belong} 
							                    </div>
							                </div>
							            </div>
							          	<div class="col-md-4">
							                <div class="cell">
							                    <div class="description">
							                         ${sectionDetail.note}
							                    </div>
							                </div>
							            </div>
							        </div>
							      	<div class="row margin-0 list-header hidden-sm hidden-xs">
							            <div class="col-md-4"><div class="header">员工姓名</div></div>
							            <div class="col-md-4"><div class="header">员工账号</div></div>
							            <div class="col-md-4"><div class="header">员工评分(关系员工审核工资)</div></div>
							        </div>
							        <c:set var='count' value="<%=String.valueOf(m)%>" scope="page"/>
							        <c:forEach var="userDet1" items="${sectionLL[count]}">
								        <div class="row margin-0">
								          	<div class="col-md-4">
								                <div class="cell">
								                    <div class="description">
								                         ${userDet1.name}
								                    </div>
								                </div>
								            </div>
								            								          	<div class="col-md-4">
								            <div class="cell">
								                    <div class="description">
								                         ${userDet1.account}
								                    </div>
								                </div>
								            </div>
								            								          	<div class="col-md-4">
								            <div class="cell">
								                    <div class="description">
								                         0
								                    </div>
								                </div>
								            </div>
								        </div>
							       	</c:forEach>
							       	<% m++; %>
							    </div>  
							</div>
						</c:forEach>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
<script type="text/javascript">
var choice;
var self = this
function selectOnchang(obj){ 
	//获取被选中的option标签选项 
	self.choice = obj.value
}
function edit(clickobj){
	document.getElementById("name_to_change").value = $(clickobj).parent().parent().find("td").eq(3).text()
	document.getElementById("id_to_change").value = $(clickobj).parent().parent().find("td").eq(2).attr("id")
	console.log(document.getElementById("id_to_change").value)
}
function change_confirm(clickobj){
	var id_to_change = $(clickobj).parent().find("input").eq(1).val()
	if(choice == undefined){
		choice = $("#firstSection").find("li").eq(1).find("a").eq(0).text()
	}
	var data = {
		"name": $(clickobj).parent().find("input").val(),
		"belong":self.choice
	}
	$.post("changeSection.action",data,function(data,status,xhr){
		if(data == "success"){
			 $("#change_modal").modal("hide");
			 toastr.success("调动成功"); 
			 $("#"+id_to_change).text(self.choice)
		 }
		 else{
			 $("#change_modal").modal("hide");
			 toastr.error("调动失败"); 
		 }
	})
}
</script>
</body>
</html>