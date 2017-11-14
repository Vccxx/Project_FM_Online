package lab2;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Index extends ActionSupport{
	private boolean errorFlag = false;
	private String userName;
	private String passWord;
	private String account;
	private Connection conn = null;
	public Index()
	{
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
	public void setAccount(String username) {
	    try
	    {
	      this.account = new String(username.getBytes("ISO-8859-1"), "UTF-8");
	    }
	    catch (UnsupportedEncodingException e)
	    {
	      e.printStackTrace();
	      ActionContext.getContext().put("error", e.toString());
	      this.errorFlag = true;
	    }
	}
	public void setPassWord(String password) {
	    try
	    {
	      this.passWord = new String(password.getBytes("ISO-8859-1"), "UTF-8");
	    }
	    catch (UnsupportedEncodingException e)
	    {
	      e.printStackTrace();
	      ActionContext.getContext().put("error", e.toString());
	      this.errorFlag = true;
	    }
	}
	public String check() {
		int userid;
		if(this.errorFlag) {
			return "error";
		}
		String sql_get_name = "select username,password,id from user where account=\""+this.account+"\"";//weakness:sql inject
		try
	    {
	      ResultSet rs = this.conn.prepareStatement(sql_get_name).executeQuery();
	      if (!rs.next()) {
	    	ActionContext.getContext().put("error","No such Username or Wrong password");
	    	this.errorFlag = true;
	        return "error";
	      }
	      
	      String password = rs.getString("password");
	      userid = rs.getInt("id");
	      this.userName = rs.getString("username");
	      
	      if(!password.equals(this.passWord)) {
	    	this.errorFlag = true;
	    	ActionContext.getContext().put("error","No such Username or Wrong password");
	      }
	      if(userid == 0) {
	    	  ActionContext.getContext().put("id","System Manager:"+this.userName);
	      }
	      else if(userid == 1) {
	    	  ActionContext.getContext().put("id","Fincial Manger:"+this.userName);
	      }else if(userid == 2){
	    	  ActionContext.getContext().put("id","Department Manager:"+this.userName);
	      }
	      else {
	    	  this.errorFlag = true;
	    	  ActionContext.getContext().put("error","No such userid");
	      }
	      rs.close();
	      this.conn.close();
		  if(this.errorFlag) {
			return "error";
		  }
	      ActionContext.getContext().put("userid",Integer.toString(userid));
	    }
	    catch (SQLException e)
	    {
	      e.printStackTrace();
	      ActionContext.getContext().put("error", e.toString());
	      return "error";
	    }
	    catch (Exception e)
	    {
	      e.printStackTrace();
	      ActionContext.getContext().put("error", e.toString());
	      return "error";
	    }
	    return "id="+Integer.toString(userid);
	}
}
