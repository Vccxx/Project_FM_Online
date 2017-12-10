package lab2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import lab2.User;
import com.opensymphony.xwork2.ActionContext;

public class MainPanel {
	private String username;
	private String password;
	private String priv;
	private String realname;
	private boolean errorFlag = false;
	private Connection conn = null;
	public MainPanel() {
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
	public String showAccount(){
		String sql_query = "select * from user";
		 List<User> user = new ArrayList<User>();
	    ResultSet res;
		try {
			res = this.conn.prepareStatement(sql_query).executeQuery();
			 
			    while(res.next()) {
			    	User tmpUser = new User();
			  	  tmpUser.username = (String)res.getString("account");
			  	  tmpUser.password = (String)res.getString("password");
			  	  tmpUser.realname = (String)res.getString("username");
			  	  if(res.getString("id").equals("0")) {
			  		  tmpUser.priv = "root";
			  	  }
			  	  else if(res.getString("id").equals("1")){
			  		  tmpUser.priv = "FM";
			  	  }
			  	  else if(res.getString("id").equals("2")){
			  		  tmpUser.priv = "Manager";
			  	  }
			  	  else if(res.getString("id").equals("3")){
			  		  tmpUser.priv = "Staff";
			  	  }
			  	  user.add(tmpUser);
			    }
			    ActionContext.getContext().put("userList",user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			ActionContext.getContext().put("error", e);
			return "error";
		}
		return "success";
	}
}
	
