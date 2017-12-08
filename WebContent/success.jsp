<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Success!</title>
	<link rel="stylesheet" type="text/css" href="css/fail.css">
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<% response.setHeader("Refresh","3;URL="+request.getHeader("Referer"));%>
<div class="container content">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="testimonials">
            	<div class="active item">
                  <blockquote><p><%=request.getAttribute("error")%></p></blockquote>
                  <div class="carousel-info">
                    <img alt="" src="img/failLogo.jpg" class="pull-left">
                    <div class="pull-left">
                      <span class="testimonials-name">输入成功</span>
                      <strong>3 秒后返回</strong>
                    </div>
                  </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>