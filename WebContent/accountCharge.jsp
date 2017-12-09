<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                          <tr>
                            <td align="center">
                              <a class="btn btn-default"><em class="fa fa-pencil"></em></a>
                              <a class="btn btn-danger"><em class="fa fa-trash"></em></a>
                            </td>
                            <td class="hidden-xs">1</td>
                            <td>John Doe</td>
                            <td>johndoe@example.com</td>
                            <td>emmmm</td>
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
<script type="text/javascript">
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
	 var data = {
			 "password":md5(document.getElementById("password_add").value),
			 "realname":document.getElementById("realname_add").value,
			 "username":document.getElementById("username_add").value,
			 "priv":choice
		}
	 $.post("ajaxAdd.action",data,function(data,status,xhr){
		 if(data == "success"){
			 $("#add_account_modal").modal("hide");
			 toastr.success("添加成功"); 
			 var htm=$("tbody.copy tr").eq(0).clone();
			 var node = htm.find("td")
			 node.eq(1).html(document.getElementById("realname_add").value)
			 node.eq(2).html(document.getElementById("username_add").value)
			 node.eq(3).html(document.getElementById("password_add").value)
			 $("tbody.copy tr").eq(-1).after(htm);
		 }
		 else{
			 toastr.error("添加失败"); 
		 }
	 })
 	}
</script>
</body>
</html>