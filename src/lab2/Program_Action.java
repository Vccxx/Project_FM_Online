package lab2;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Program_Action extends ActionSupport{
	private boolean errorFlag = false;
	private String userName;
	private String passWord;
	private String account;
	private Connection conn = null;
	public Program_Action()
	{
	  try
	  {
	      Class.forName("com.mysql.jdbc.Driver");
		  String url = "jdbc:mysql://localhost:3306/FManager";
		  String username = "root";
		  String password = "Yuan199694";
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
}
