package lab2;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

public class ParmaSet {
	private String name;
	private String money;
	private boolean errorFlag = false;
	private Connection conn = null;
	public ParmaSet(){
		 try
		  {
		      Class.forName("com.mysql.jdbc.Driver");
			  String url = "jdbc:mysql://w.rdc.sae.sina.com.cn:3306/app_fmanager";
			  String username = "o25w1j0kwk";
			  String password = "2mk0mkl22jkz214ikx11w0imy3k5yikmy115xwlw";
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
	public void setName(String nameIn) {
		this.name = nameIn;
	}
	public void setMoney(String valueIn) {
		this.money = valueIn;
	}
	public String ParmaSet() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();  
	    PrintWriter writer = response.getWriter();
	    if(this.errorFlag) {
			writer.print("error"); 
	        writer.flush();  
	        writer.close();
			return null;
		}
	    String sql_update = "UPDATE sectionInfo set money=\""+this.money+"\" where name=\""+this.name+"\"";
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
