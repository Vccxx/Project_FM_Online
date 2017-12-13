package lab2;
import com.opensymphony.xwork2.ActionContext;

import com.opensymphony.xwork2.ActionSupport;

import net.sf.json.JSONArray;
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
	public void setData(String jsonData) {
		this.data = jsonData;
	}

	public String record() {
		JSONArray array = JSONArray.fromObject(this.data);
		if(array.size()>0){
		  for(int i=0;i<array.size();i++){
		    JSONObject asset = array.getJSONObject(i);  // 遍历 jsonarray 数组，把每一个对象转成 json 对象
		    String concept = (String)asset.get("concept");
		    String description = (String) asset.get("description");
		    String amount = (String) asset.get("amount");
		    String status = (String) asset.get("status");
		    String date = (String) asset.get("date");
		    String sqlInsert = "INSERT INTO FMInput (concept,description,amount,status,date) VALUES('"+concept+"','"+description+"','"+amount+"','"+status+"','"+date+"')";
		    try {
				conn.prepareStatement(sqlInsert).execute();
				return "success";
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				ActionContext.getContext().put("error",e);
			}
		  }
		}
		return "error";
	}
}
