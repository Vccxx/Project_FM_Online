package lab2;
import com.opensymphony.xwork2.ActionContext;

import com.opensymphony.xwork2.ActionSupport;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
public class accountCharge extends ActionSupport{
	private String username;
	private String password;
	private String priv;
	private String realname;
	private boolean errorFlag = false;
	private Connection conn = null;
	public accountCharge() {
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
	public void setUsername(String username) {
		try {
			this.username = new String(username.getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			ActionContext.getContext().put("error", e.toString());
			this.errorFlag = true;
		}
	}
	public void setPassword(String password) {
		try {
			this.password = new String(password.getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			ActionContext.getContext().put("error", e.toString());
			this.errorFlag = true;
		}
	}
	public void setPriv(String priv) {
		try {
			this.priv = new String(priv.getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			ActionContext.getContext().put("error", e.toString());
			this.errorFlag = true;
		}
		
	}
	public void setRealname(String realname) {
		try {
			this.realname = new String(realname.getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			ActionContext.getContext().put("error", e.toString());
			this.errorFlag = true;
		}
	}
    public String ajaxAdd() throws IOException {
    	HttpServletResponse response = ServletActionContext.getResponse();  
	    PrintWriter writer = response.getWriter();  
    	System.out.println("username:"+this.username + "\nrealname:" + this.realname+"\npassword:"+this.password  + "\npriv:" + this.priv);
		if(this.errorFlag) {
			writer.print("error");  
	        writer.flush();  
	        writer.close();
			return null;
		}
		String id = null;
		if(this.priv.equals("FM")) {
			id = "1";
		}
		else if(this.priv.equals("root")) {
			id = "0";
		}
		else if(this.priv.equals("Manager")) {
			id = "2";
		}
		else if(this.priv.equals("Staff")) {
			id = "3";
		}
		String sql_insert_user = "insert into user (id,username,account,password) VALUE(\""
								+id+"\",\""+this.realname+"\",\""+this.username + "\",\""
								+this.password + "\")";
		System.out.println(sql_insert_user);
		try
	    {
	      this.conn.prepareStatement(sql_insert_user).execute();
	      
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

