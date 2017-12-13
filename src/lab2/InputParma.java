package lab2;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

public class InputParma {
	private String inp1;
	private String inp2;
	private String inp3;
	private String inp4;
	private String inp5;
	private String inp6;
	private String inp7;
	private String inp8;
	private String inp9;
	private String inp10;
	private String inp11;
	private String inp12;
	private String inp13;
	private String inp14;
	private String inp15;
	private String inp16;
	private String inp17;
	private String inp18;
	private String inp19;
	private String inp20;
	private String inp21;
	private String inp22;
	private boolean errorFlag = false;
	private Connection conn = null;
	public InputParma() {
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
	public void setInp1(String inpp) {
		this.inp1=inpp;
	}
	public void setInp2(String inpp) {
		this.inp2=inpp;
	}
	public void setInp3(String inpp) {
		this.inp3=inpp;
	}
	public void setInp4(String inpp) {
		this.inp4=inpp;
	}
	public void setInp5(String inpp) {
		this.inp5=inpp;
	}
	public void setInp6(String inpp) {
		this.inp6=inpp;
	}
	public void setInp7(String inpp) {
		this.inp7=inpp;
	}
	public void setInp8(String inpp) {
		this.inp8=inpp;
	}
	public void setInp9(String inpp) {
		this.inp9=inpp;
	}
	public void setInp10(String inpp) {
		this.inp10=inpp;
	}
	public void setInp11(String inpp) {
		this.inp11=inpp;
	}
	public void setInp12(String inpp) {
		this.inp12=inpp;
	}
	public void setInp13(String inpp) {
		this.inp13=inpp;
	}
	public void setInp14(String inpp) {
		this.inp14=inpp;
	}
	public void setInp15(String inpp) {
		this.inp15=inpp;
	}
	public void setInp16(String inpp) {
		this.inp16=inpp;
	}
	public void setInp17(String inpp) {
		this.inp17=inpp;
	}
	public void setInp18(String inpp) {
		this.inp18=inpp;
	}
	public void setInp19(String inpp) {
		this.inp19=inpp;
	}
	public void setInp20(String inpp) {
		this.inp20=inpp;
	}
	public void setInp21(String inpp) {
		this.inp21=inpp;
	}
	public void setInp22(String inpp) {
		this.inp22=inpp;
	}
	public String inputParma() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();  
	    PrintWriter writer = response.getWriter();
	    if(this.errorFlag) {
			writer.print("error"); 
	        writer.flush();  
	        writer.close();
			return null;
		}
	    String sql_insert_lirun1 = "update day_lirun set number=\""+this.inp2+"\" where project=\"touzi\"";
	    String sql_insert_lirun2 = "update day_lirun set number=\""+this.inp3+"\" where project='yingyewai'";
	    String sql_insert_lirun3 = "update day_lirun set number=\""+this.inp4+"\" where project='chengben'";
	    String sql_insert_lirun4 = "update day_lirun set number=\""+this.inp5+"\" where project='guanli'";
	    String sql_insert_lirun5 = "update day_lirun set number=\""+this.inp6+"\" where project='yingyewaizhichu'";
	    
	    
	    String sql_insert_cash1 = "update month_cash set number=\""+this.inp7+"\" where project='shouqulixi'";
	    String sql_insert_cash2 = "update month_cash set number=\""+this.inp8+"\" where project='shouquqita'";
	    String sql_insert_cash3 = "update month_cash set number=\""+this.inp9+"\" where project='zhifulixi'";
	    String sql_insert_cash4 = "update month_cash set number=\""+this.inp10+"\" where project='zhifujingying'";
	    String sql_insert_cash5 = "update month_cash set number=\""+this.inp11+"\" where project='jingyingxianjin'";
	    String sql_insert_cash6 = "update month_cash set number=\""+this.inp12+"\" where project='zhifujingying'";
	    String sql_insert_cash7 = "update month_cash set number=\""+this.inp13+"\" where project='qude'";
	    String sql_insert_cash8 = "update month_cash set number=\""+this.inp14+"\" where project='xishou'";
	    String sql_insert_cash9 = "update month_cash set number=\""+this.inp15+"\" where project='faxing'";
	    String sql_insert_cash10 = "update month_cash set number=\""+this.inp16+"\" where project='changhuan'";
	    String sql_insert_cash11 = "update month_cash set number=\""+this.inp17+"\" where project='fenpei'";
	    
	    String sql_insert_assets1 = "update assets set bennian1=\""+this.inp18+"\" where zichan='huaizhang'";
	    String sql_insert_assets2 = "update assets set bennian1=\""+this.inp19+"\" where zichan='duanqi'";
	    String sql_insert_assets3 = "update assets set bennian1=\""+this.inp20+"\" where zichan='yingfu'";
	    String sql_insert_assets4 = "update assets set bennian1=\""+this.inp21+"\" where zichan='gudingyuan'";
	    String sql_insert_assets5 = "update assets set bennian1=\""+this.inp22+"\" where zichan='leiji'";
	   
	    System.out.println(sql_insert_assets5);
	    try
	    {
	      //this.conn.prepareStatement(sql_insert_lirun).execute();
	      this.conn.prepareStatement(sql_insert_lirun1).execute();
	      this.conn.prepareStatement(sql_insert_lirun2).execute();
	      this.conn.prepareStatement(sql_insert_lirun3).execute();
	      this.conn.prepareStatement(sql_insert_lirun4).execute();
	      this.conn.prepareStatement(sql_insert_lirun5).execute();
	      
	      this.conn.prepareStatement(sql_insert_cash1).execute();
	      this.conn.prepareStatement(sql_insert_cash2).execute();
	      this.conn.prepareStatement(sql_insert_cash3).execute();
	      this.conn.prepareStatement(sql_insert_cash4).execute();
	      this.conn.prepareStatement(sql_insert_cash5).execute();
	      this.conn.prepareStatement(sql_insert_cash6).execute();
	      this.conn.prepareStatement(sql_insert_cash7).execute();
	      this.conn.prepareStatement(sql_insert_cash8).execute();
	      this.conn.prepareStatement(sql_insert_cash9).execute();
	      this.conn.prepareStatement(sql_insert_cash10).execute();
	      this.conn.prepareStatement(sql_insert_cash11).execute();
	      
	      this.conn.prepareStatement(sql_insert_assets1).execute();
	      this.conn.prepareStatement(sql_insert_assets2).execute();
	      this.conn.prepareStatement(sql_insert_assets3).execute();
	      this.conn.prepareStatement(sql_insert_assets4).execute();
	      this.conn.prepareStatement(sql_insert_assets5).execute();
	    }
	    catch (SQLException e)
	    {
	    	e.printStackTrace();
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
