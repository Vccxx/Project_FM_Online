package lab2;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

public class sectionManage {
	private boolean errorFlag = false;
	private Connection conn = null;
	private String name;
	private String belong;
	public sectionManage() {
		try
		  {
		      Class.forName("com.mysql.jdbc.Driver");
			  String url = "jdbc:mysql://localhost:3306/FManager";
			  String username = "root";
			  String password = "Vccxx2016";
			  this.conn = DriverManager.getConnection(url, username, password);
			  if (this.conn != null) {
				  System.out.print("SQL link success");
				  
			  } else {
				  System.out.print("SQL link failed");
		      }
		  }
		  catch (ClassNotFoundException e)
		  {
		      e.printStackTrace();
		  }
		  catch (SQLException e)
		  {
		      e.printStackTrace();
		  }
	}
	public void setName(String nameChoosed) {
		this.name = nameChoosed;
	}
	public void setBelong(String belongs) {
		this.belong = belongs;
	}
	public String changeSection() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();  
	    PrintWriter writer = response.getWriter();
	    if(this.errorFlag) {
			writer.print("error"); 
	        writer.flush();  
	        writer.close();
			return null;
		}
	    String id = "";
	    
	    String sql_update = "UPDATE userDetial set belong=\""+this.belong+"\" where account=\""+this.name+"\"";
	    System.out.println(sql_update);
	    try
	    {
	      this.conn.prepareStatement(sql_update).execute();
	    }
	    catch (SQLException e)
	    {
			writer.print("error");  
	        writer.flush();  
	        writer.close();
	        return null;
	    }
	    catch (Exception e)
	    {
	    	e.printStackTrace();
			writer.print("error");  
	        writer.flush();  
	        writer.close();
	        return null;
	    }
		writer.print("success");  
        writer.flush();  
        writer.close();
        return null;
	}
}
