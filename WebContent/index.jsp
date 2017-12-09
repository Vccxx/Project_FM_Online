<!DOCTYPE html>  
<html>  
    <head>  
        <meta charset="utf-8" />  
        <title>Financial Manager</title>  
        <link rel="stylesheet" type="text/css" href="css/login.css">
        <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="http://cdn.bootcss.com/blueimp-md5/1.1.0/js/md5.min.js"></script>  
        <link href="https://cdn.bootcss.com/toastr.js/latest/css/toastr.min.css" rel="stylesheet">
        <script src="https://cdn.bootcss.com/toastr.js/latest/js/toastr.min.js"></script>
    </head> 
    <body> 
     <div class="container">

    <div class="row">
        <div class="col-md-4 col-md-offset-7">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-lock"></span> Login Panel</div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form" action="Login" name = "loginform"> 
         
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-3 control-label">
                            Account</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="account" placeholder="Account" name="Account" required maxlength="50">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-3 control-label">
                            Password</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" id="password" name="PassWord" placeholder="Password" required maxlength="50">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-9">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox"/>
                                    remember me
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group last">
                        <div class="col-sm-offset-3 col-sm-9">
                            <button type="button" class="btn btn-success btn-sm" onclick="check()">
                                login</button>
                                 <button type="reset" class="btn btn-default btn-sm">
                                reset</button>
                        </div>
                    </div>
                    </form>
                </div>
        </div>
    </div>
</div>
<script>
function check(){
	 document.getElementById("password").value = md5(document.getElementById("password").value).toUpperCase()
     document.loginform.submit();  //fm为form表单name  
}

</script>
    </body>  
</html>