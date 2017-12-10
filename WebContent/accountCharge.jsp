<%@ page language="java" import = "lab2.User,java.util.List" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manage all Accounts here!</title>
	<style type="text/css">
		body{
			background-image:url(image/acbg.jpg);
			background-size:100% 100%;
		}
	</style>
	  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="js/jquery3.2.1.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="./css/accountCharge.css" rel="stylesheet" type="text/css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">
	<link href="https://cdn.bootcss.com/toastr.js/latest/css/toastr.min.css" rel="stylesheet">
	<script src="https://cdn.bootcss.com/toastr.js/latest/js/toastr.min.js"></script>
	<script src="http://cdn.bootcss.com/blueimp-md5/1.1.0/js/md5.min.js"></script>  
</head>

<body>
	<div class="modal fade" id="add_account_modal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">
						添加新用户
					</h4>
				</div>
				<div class="modal-body">
					<form role="form">
				<div class="form-group">
					 <label for="exampleInputEmail1">用户名</label><input class="form-control" id="username_add" type="text" required maxlength="50"/>
				</div>
				<div class="form-group">
					 <label for="exampleInputPassword1">密码</label><input class="form-control" id="password_add" type="password" required maxlength="50"/>
				</div>
				<div class="form-group">
					 <label for="exampleInputPassword1">真实姓名</label><input class="form-control" id="realname_add" type="text" required maxlength="50"/>
				</div>
				<label for="exampleInputPassword1">权限设置</label>
				<select class="form-control" onchange="selectOnchang(this)">
						<option>Staff</option>
						<option>Manager</option>
						<option>FM</option>
						<option>root</option>
				</select>
			</form>
				</div>
				<div class="modal-footer">
					 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> 
					 <button type="button" class="btn btn-primary" onclick="submit_form()">保存</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="update_account_modal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">
						更改用户信息
					</h4>
				</div>
				<div class="modal-body">
			<form role="form">
				<div class="form-group">
					<label id="user_to_update"></label>
				</div>
				<div class="form-group">
					 <label for="exampleInputPassword1">密码</label><input class="form-control" id="password_update" type="password" required maxlength="50"/>
				</div>
				<div class="form-group">
					 <label for="exampleInputPassword1">真实姓名</label><input class="form-control" id="realname_update" type="text" required maxlength="50"/>
				</div>
				<label for="exampleInputPassword1">权限设置</label>
				<select class="form-control" onchange="selectOnchang(this)">
						<option>Staff</option>
						<option>Manager</option>
						<option>FM</option>
						<option>root</option>
				</select>
			</form>
				</div>
				<div class="modal-footer">
					<input type="hidden" id="id_to_update"  value="">
					<input type="hidden" id="account_to_update"  value="">
					 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> 
					 <button type="button" class="btn btn-primary" onclick="update_confirm(this)">确认更新</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="delete_account_modal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">
						删除用户
					</h4>
					<div class="modal-body">
						不可逆操作！点击”确认删除“继续。
				</div>
				</div>
				<div class="modal-footer">
					 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> 
					 <input type="hidden" id="username_to_delete"  value="">
					 <input type="hidden" id="id_to_delete"  value="">
					 <button type="button" class="btn btn-danger" onclick="deleteAccount(this)">确定删除</button>
				</div>
			</div>
		</div>
	</div>
<div class="container">
    <div class="row">
    <p></p>
    <h1>账户管理页面</h1>
    <p>管理员可以在这里添加或删除用户</p>
        <div class="col-md-10 col-md-offset-1">

            <div class="panel panel-default panel-table">
              <div class="panel-heading">
                <div class="row">
                  <div class="col col-xs-6">
                    <h3 class="panel-title">用户列表</h3>
                  </div>
                  <div class="col col-xs-6 text-right">
                    <button type="button" class="btn btn-sm btn-primary btn-create" data-toggle="modal" data-target="#add_account_modal">创建新用户</button>
                  </div>
                </div>
              </div>
              <div class="panel-body">
                <table class="table table-striped table-bordered table-list">
                  <thead>
                    <tr>
                        <th><em class="fa fa-cog"></em></th>
                        <th class="hidden-xs">真实姓名</th>
                        <th>用户名</th>
                        <th>密码</th>
                        <th>权限</th>
                    </tr> 
                  </thead>
                  <tbody class="copy">
                        	<%int i = 0; %>
	                         <c:forEach var="userInfo" items="${userList}">
	                         <tr id=<%="account_to_delete"+String.valueOf(i)%>>
	                         <% i++;%>
								<td align="center">
	                             <a class="btn btn-default" data-toggle="modal" data-target="#update_account_modal" onclick="user_to_update(this)"><em class="fa fa-pencil" ></em></a>
	                             <a class="btn btn-danger" data-toggle="modal" data-target="#delete_account_modal" onclick="passUsername(this)"><em class="fa fa-trash"></em></a>
	                           </td>
	
	                           <td class="hidden-xs">${userInfo.realname}</td>
	                           <td>${userInfo.username}</td>
	                           <td>${userInfo.password}</td>
	                           <td>${userInfo.priv}</td>
	                          </tr>
	                        </c:forEach>
                       
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
<script type="text/javascript">
	var hint = "Modifing the Info of Account: ";
	var choice;
	var self = this
	function selectOnchang(obj){ 
		//获取被选中的option标签选项 
		self.choice = obj.value
	}
	function submit_form(){
		if (choice == undefined){
			choice = "Staff"
		}
		var password = md5(document.getElementById("password_add").value).toUpperCase()
		var realname = document.getElementById("realname_add").value
		var username = document.getElementById("username_add").value
	 var data = {
			 "password":password,
			 "realname":realname,
			 "username":username,
			 "priv":choice
		}
	 $.post("ajaxAdd.action",data,function(data,status,xhr){
		 if(data == "success"){
			 $("#add_account_modal").modal("hide");
			 toastr.success("添加成功"); 
			 var htm=$("tbody.copy tr").eq(0).clone();
			 var node = htm.find("td")
			 node.eq(1).html(realname)
			 node.eq(2).html(username)
			 node.eq(3).html(password)
			 node.eq(4).html(choice)
			 $("tbody.copy tr").eq(-1).after(htm);
		 }
		 else{
			 toastr.error("添加失败"); 
		 }
	 })
 	}
	function passUsername(clickObj){
		var username_slot = document.getElementById("username_to_delete")
		var id_to_del = document.getElementById("id_to_delete")
		username_slot.value = $(clickObj).parent().parent().children("td").eq(2).text()
		id_to_del.value = $(clickObj).parent().parent().attr("id")
	}
	function deleteAccount(clickObj){
		username = $(clickObj).parent().find("input").eq(0).val();
		id = $(clickObj).parent().find("input").eq(1).val();
		var data = {
				"username":username
		}
		$.post("deleteAccount.action",data,function(data,status,xhr){
			if(data == "success"){
				 $("#delete_account_modal").modal("hide");
				 toastr.success("删除成功"); 
				 $("#"+id).empty()
			 }
			 else{
				 $("#delete_account_modal").modal("hide");
				 toastr.error("删除失败"); 
			 }
		})
	}
	function user_to_update(clickObj){
		
		var account = document.getElementById("user_to_update") 
		account.innerHTML = hint+$(clickObj).parent().parent().children("td").eq(2).text()
		var id_to_update = document.getElementById("id_to_update")
		var account_to_update = document.getElementById("account_to_update") 
		id_to_update.value =  $(clickObj).parent().parent().attr("id");
		account_to_update.value = account.innerHTML.substring(hint.length,account.innerHTML.length)
	}
	function update_confirm(clickObj){
		id = $(clickObj).parent().find("input").eq(0).val();
		account = $(clickObj).parent().find("input").eq(1).val();
		if (choice == undefined){
			choice = "Staff"
		}
		var realname = document.getElementById("realname_update").value
		var password = md5(document.getElementById("password_update").value).toUpperCase()
		var data = {
				"username":account,
				"priv": choice,
				"realname":realname,
				"password":password
		}
		$.post("updateAccount.action",data,function(data,status,xhr){
			if(data == "success"){
				 $("#update_account_modal").modal("hide");
				 toastr.success("更新成功"); 
				 $("#"+id).find("td").eq(1).text(realname)
				 $("#"+id).find("td").eq(3).text(password)
				 $("#"+id).find("td").eq(4).text(choice) 
			 }
			 else{
				 $("#update_account_modal").modal("hide");
				 toastr.error("更新失败"); 
			 }
		})
	}
</script>
</body>
</html>