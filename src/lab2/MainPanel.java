package lab2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import lab2.User;
import lab2.sectionInfo;
import lab2.userDetail;
import com.opensymphony.xwork2.ActionContext;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import java.util.List;
import java.util.ArrayList;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

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
	public String showSectionInfo() {
		String sql_query = "select * from sectionInfo";
		String sql_query_detail = "select * from userDetial";
		 List<sectionInfo> section = new ArrayList<sectionInfo>();
		 ResultSet res;
		 try {
				res = this.conn.prepareStatement(sql_query).executeQuery();
			    while(res.next()) {
			      sectionInfo tmpSection = new sectionInfo();
			  	  tmpSection.name = (String)res.getString("name");
			  	  tmpSection.money = (String)res.getString("money");
			  	  tmpSection.number = (String)res.getString("number");
			  	  tmpSection.belong = (String)res.getString("belong");
			  	  tmpSection.note = (String)res.getString("note");
			  	  section.add(tmpSection);
			    }
			    ActionContext.getContext().put("sectionInfo",section);
			    res.close();
			    res = this.conn.prepareStatement(sql_query_detail).executeQuery();
			    List<userDetail> userdetail = new ArrayList<userDetail>();
			    while(res.next()) {
			    	userDetail tmpDetail = new userDetail();
			    	tmpDetail.name = (String)res.getString("name");
			    	tmpDetail.account = (String)res.getString("account");
			    	tmpDetail.belong = (String)res.getString("belong");
			    	userdetail.add(tmpDetail);
			    }
			    ActionContext.getContext().put("userDetail",userdetail);
			    String sql_query_section = "select * from sectionInfo";
			    res = this.conn.prepareStatement(sql_query_section).executeQuery();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				ActionContext.getContext().put("error", e);
				return "error";
			}
			return "success";
	}
}
	
