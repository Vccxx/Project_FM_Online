package lab2;
import com.opensymphony.xwork2.ActionContext;

import com.opensymphony.xwork2.ActionSupport;

import net.sf.json.JSONObject;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;


public class FMInp extends ActionSupport{
	private boolean errorFlag = false;
	private String concept;
	private String descript;
	private String amount;
	private String status;
	private String date;
	private String data;
	private Connection conn = null;
	public FMInp()
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
	public void setData(String jsonData) {
		this.data = jsonData;
	}

	public String record() {
	    JSONObject json = JSONObject.fromObject(data); 
	    for(int i = 0;i < json.size();i++) {
		    String concept=(String)json.get("concept");  
		    String descript=(String)json.get("descript");  
		    String amount=(String)json.get("amount"); 
		    String status=(String)json.get("status");
		    String date=(String)json.get("date");
			ActionContext.getContext().put("error",concept+descript+amount+status+date);
			String sql_insert_FMinps = "insert into  ";
	    }
		return "error";
	}
}
