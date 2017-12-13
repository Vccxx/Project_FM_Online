package lab2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import lab2.User;
import lab2.Tex;
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
			    res.close();
			    List<List<userDetail>> userList = new ArrayList<List<userDetail>>();
			    for(int k = 0;k < section.size();k++) {
			    	String sql_query_section_user = "select * from userDetial where belong=\""+section.get(k).name+"\"";
			    	ResultSet res1 = this.conn.prepareStatement(sql_query_section_user).executeQuery();//循环使用ResultSet 获取executeQuery的值时，最好在循环中声明循环变量，否则可能查询出错
			    	System.out.println(sql_query_section_user);
			    	List<userDetail> user1 = new ArrayList<userDetail>();
			    	while(res1.next()) {
			    		userDetail tmpUser1 = new userDetail();
			    		tmpUser1.name = (String)res1.getString("name");
			    		tmpUser1.account = (String)res1.getString("account");
			    		tmpUser1.scw = (String)res1.getString("scw");
			    		tmpUser1.ycw = (String)res1.getString("ycw");
			    		tmpUser1.mcw = (String)res1.getString("mcw");
			    		user1.add(tmpUser1);
			    	}
			    	userList.add(user1);
			    	res1.close();
			    }
		    	ActionContext.getContext().put("sectionLL",userList);
			    
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				ActionContext.getContext().put("error", e);
				return "error";
			}
		 	
			return "success";
	}
	public String showParma() {
		 String sql_query_section = "select * from sectionInfo";
		 String sql_query_parma = "select * from financialParma";
		 List<sectionInfo> section = new ArrayList<sectionInfo>();
		 ResultSet res;
		 try {
				res = this.conn.prepareStatement(sql_query_section).executeQuery();
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
			    ResultSet res1 = this.conn.prepareStatement(sql_query_parma).executeQuery();
			    List<Tex> texList = new ArrayList<Tex>();
			    while(res1.next()) {
			    	  Tex tmpParma = new Tex();
				      tmpParma.enterpriseTexRate = (String)res1.getString("enterpriseTexRate");
				      tmpParma.lt1500 = (String)res1.getString("lt1500");
				      tmpParma.lt4500 = (String)res1.getString("lt4500");
				      tmpParma.lt9000 = (String)res1.getString("lt9000");
				      tmpParma.lt35000 = (String)res1.getString("lt35000");
				      tmpParma.lt55000 = (String)res1.getString("lt55000");
				      tmpParma.lt80000 = (String)res1.getString("lt80000");
				      tmpParma.ltinfinit = (String)res1.getString("ltinfinit");
				      texList.add(tmpParma);
				    }
			    ActionContext.getContext().put("texList",texList);
			    
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				ActionContext.getContext().put("error", e);
				return "error";
			}
		return "success";
	}
}
	
