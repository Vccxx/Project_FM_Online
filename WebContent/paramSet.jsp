<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>财务参数调整</title>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="https://cdn.bootcss.com/toastr.js/latest/css/toastr.min.css" rel="stylesheet">
	<script src="https://cdn.bootcss.com/toastr.js/latest/js/toastr.min.js"></script>
</head>
<body>

<div class="container">
	<div class="row">
        <div class="col-md-12">
        <h2>财务参数调整</h2>
        <div class="table-responsive">
              <table id="mytable" class="table table-bordred table-striped">
              <h4>个人所得税税率调整</h4> 
                 <thead> 
						<th>(0,1500]</th>
						<th>(1500,4500]</th>
						<th>(4500,9000]</th>
						<th>(9000,35000]</th>
						<th>(35000,55000]</th>
						<th>(55000,80000]</th>
						<th>(80000,正无穷]</th>
                 </thead> 
    			<tbody>
    			<% int k = 0;%>
    			<c:forEach var="texInfo" items="${texList}">
					<tr>
					    <td>${texInfo.lt1500}</td>
					    <td>${texInfo.lt4500}</td>
					    <td>${texInfo.lt9000}</td>
					    <td>${texInfo.lt35000}</td>
					    <td>${texInfo.lt55000}</td>
					    <td>${texInfo.lt80000}</td>
					    <td>${texInfo.ltinfinit}</td>
					    <td>
					    	<p data-placement="top" data-toggle="tooltip" title="Edit">
					    		<button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit_personTex" >
					    			<span class="glyphicon glyphicon-pencil"></span>
					    		</button>
					    	</p>
					    </td>
					  </tr>
				</c:forEach>
			   	</tbody>
        
			</table>
        </div>
                <div class="table-responsive">
              <table id="mytable" class="table table-bordred table-striped">
              <h4>企业所得税税率调整</h4> 
                 <thead> 
						<th>现行税率</th>
                 </thead>
    			<tbody>
    				<td>${texList[0].enterpriseTexRate}</td>
    				 <td>
					    	<p data-placement="top" data-toggle="tooltip" title="Edit">
					    		<button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit_enterpriseTex" >
					    			<span class="glyphicon glyphicon-pencil"></span>
					    		</button>
					    	</p>
					    </td>
			   	</tbody>
        
			</table>
        </div>
	</div>
        <div class="col-md-12">
        <h2>财务参数调整</h2>
        <div class="table-responsive">
              <table id="mytable" class="table table-bordred table-striped">
              <h4>部门资金调整</h4> 
                 <thead> 
						<th>部门名称</th>
						<th>部门资金</th>
						<th>部门描述</th>
						<th>部门评分</th>
						<th>调整</th>
                 </thead>
                 

			    <%  
			            int a = (int)Math.random()*10 +80; 
			    %>  
    			<tbody>
    			<% int m = 0;%>
    			<c:forEach var="section" items="${sectionInfo}">
					<tr>
					    <td>${section.name}</td>
					    <td id="<%=m++%>">${section.money}</td>
					    <td>${section.note}</td>
					    <td><%=a%></td>
					    <td>
					    	<p data-placement="top" data-toggle="tooltip" title="Edit">
					    		<button onclick="passSection(this)" class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" >
					    			<span class="glyphicon glyphicon-pencil"></span>
					    		</button>
					    	</p>
					    </td>
					  </tr>
				</c:forEach>
			   	</tbody>
        
			</table>
        </div>
	</div>
</div>


<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
		        <h4 class="modal-title custom_align" id="Heading">部门资金分配</h4>
      	  </div>
          <div class="modal-body">
	          <div class="form-group">
	          		<label>部门资金</label>
	        		<input class="form-control" name="parma" type="number" required maxlength="50">
	        	</div>
      		</div>
	      <div class="modal-footer ">
	        <button type="button" class="btn btn-warning btn-lg" style="width: 100%;" onclick="confirm_update(this)">
	        	<span class="glyphicon glyphicon-ok-sign"></span> 
	        	确认更新
	        </button>
	      </div>
        </div>
    <!-- /.modal-content --> 
  	</div>
      <!-- /.modal-dialog --> 
</div>

<div class="modal fade" id="edit_personTex" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
		        <h4 class="modal-title custom_align" id="Heading">个人所得税调整分配</h4>
      	  </div>
          <div class="modal-body">
	          <div class="form-group">
	          		<label>(0,1500]</label>
	        		<input class="form-control" name="parma1" type="number" required maxlength="50">
	        	</div>
	        	<div class="form-group">
	          		<label>(1500,4500]</label>
	        		<input class="form-control" name="parma2" type="number" required maxlength="50">
	        	</div>
	        	<div class="form-group">
	          		<label>(9000,35000]</label>
	        		<input class="form-control" name="parma3" type="number" required maxlength="50">
	        	</div>
	      	    <div class="form-group">
	          		<label>(35000,55000]</label>
	        		<input class="form-control" name="parma4" type="number" required maxlength="50">
	        	</div>
	        	 <div class="form-group">
	          		<label>(55000,80000]</label>
	        		<input class="form-control" name="parma5" type="number" required maxlength="50">
	        	</div>
	        	<div class="form-group">
	          		<label>80000,正无穷]</label>
	        		<input class="form-control" name="parma6" type="number" required maxlength="50">
	        	</div>
      		</div>
	      <div class="modal-footer ">
	        <button type="button" class="btn btn-warning btn-lg" style="width: 100%;" onclick="confirm_update(this)">
	        	<span class="glyphicon glyphicon-ok-sign"></span> 
	        	确认修改
	        </button>
	      </div>
        </div>
    <!-- /.modal-content --> 
  	</div>
      <!-- /.modal-dialog --> 
</div>
<div class="modal fade" id="edit_enterpriseTex" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
		        <h4 class="modal-title custom_align" id="Heading">企业所得税调整</h4>
      	  </div>
          <div class="modal-body">
	          <div class="form-group">
	          		<label>企业所得税</label>
	        		<input class="form-control" name="parma7" type="number" required maxlength="50">
	        	</div>
      		</div>
	      <div class="modal-footer ">
	        <button type="button" class="btn btn-warning btn-lg" style="width: 100%;" onclick="confirm_update(this)">
	        	<span class="glyphicon glyphicon-ok-sign"></span> 
	        	确认调整
	        </button>
	      </div>
        </div>
    <!-- /.modal-content --> 
  	</div>
      <!-- /.modal-dialog --> 
</div>
<script type="text/javascript">
var section_to_update;
var id_to_update;
var value;
function passSection(clickObj){
	section_to_update = $(clickObj).parent().parent().parent().find("td").eq(0).text()
	id_to_update = $(clickObj).parent().parent().parent().find("td").eq(1).attr("id")
}
function confirm_update(clickObj){
	var data = {
			"name" : section_to_update,
			"money":$(clickObj).parent().parent().find("input").val()
	}
	value = $(clickObj).parent().parent().find("input").val()
	$.post("ParmaSet.action",data,function(data,status){
		if (data == "success"){
			$("#edit").modal("hide");
			$("#"+id_to_update).text(value);
			toastr.success("修改成功"); 
		}
		else{
			$("#edit").modal("hide");
			toastr.error("修改失败"); 
		}
	})
}
</script>
</body>
</html>