<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import= "java.util.Collections" %>
<%@page import= "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/NewTable.css">
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <style type="text/css">
	body{
		background-image:url(timg.jpg);
		background-size:100% 100%;
		}
	</style>
<title>Insert title here</title>
</head>

<body>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>



<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<p>
				<font size="10">你好 xx 经理<font size="6">————请进行财务变更记录审查</font></font>
			</p>
		</div>
	</div>
</div>


<div class="container">
    <div class="row">
    <p></p>
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
                      <% 
					    Connection con;
					    Class.forName("com.mysql.jdbc.Driver");
						con = DriverManager.getConnection("jdbc:mysql://localhost:3306/FManager","root","Yuan199694");
						Statement sql;
						ResultSet rs;
						int line=0;
						int[] typenum = new int[4];
						String type[] = {"add","delete","change","search"};
						for(int i=0;i<4;i++)
						{
							typenum[i]=0;
						}
						try
						{
							sql=con.createStatement();
							rs=sql.executeQuery("SELECT * FROM financial_changes");
							while(rs.next())
							{
								out.print("<tr>");
								out.print("<td>"+rs.getString("ID")+"</td>");
								out.print("<td>"+rs.getString("Operator")+"</td>");
								out.print("<td>"+rs.getString("Details")+"</td>");
								out.print("<td>"+rs.getString("Date")+"</td>");
								out.print("<td>"+rs.getString("Type")+"</td>");
								for(int j=0;j<4;j++)
								{
									if(rs.getString("Type").equals(type[j]))
									{
										typenum[j]++;
									}
								}
								out.print("</tr>");
							}
						}
						catch(SQLException e1)
						{
							out.print(e1.toString());
						}
					  %>
                          
                  </tbody>
                </table>
              </div>
            </div>
		  </div>
	</div>
</div> 

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
						<% out.print("<td>"+(typenum[0]/(typenum[0]+typenum[1]+typenum[2]+typenum[3]))*100+"%"+"</td>"); %>
					</tr>
					<tr class="success">
						<td>删</td>
						<% out.print("<td>"+(typenum[1]/(typenum[0]+typenum[1]+typenum[2]+typenum[3]))*100+"%"+"</td>"); %>
					</tr>
					<tr class="error">
						<td>改</td>
						<% out.print("<td>"+(typenum[2]/(typenum[0]+typenum[1]+typenum[2]+typenum[3]))*100+"%"+"</td>"); %>
					</tr>
					<tr class="warning">
						<td>查</td>
						<% out.print("<td>"+(typenum[3]/(typenum[0]+typenum[1]+typenum[2]+typenum[3]))*100+"%"+"</td>"); %>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>