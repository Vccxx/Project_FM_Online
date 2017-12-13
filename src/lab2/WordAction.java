package lab2;
import java.io

.File;
import java.io

.FileInputStream;
import java.io

.InputStream;
import java.net

.URLDecoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import lab2.WordUtil;
import com.opensymphony.xwork2.ActionSupport;

/* @Desc：生成word
@Author：陈高德 @Date：2017-12-11下午05:03:19
*/
@SuppressWarnings("serial")
public class WordAction extends ActionSupport{

private String filePath; //文件路径
private String fileName; //文件名称
private String fileOnlyName; //文件唯一名称
private String studentID;
public String getStudentID() {
return studentID;
}
public void setStudentID(String studentID) {
this.studentID = studentID;
}

public String createWord() throws SQLException{
    /** 用于组装word页面需要的数据 */
    Map<String, Object> dataMap = new HashMap<String, Object>();

    /** 组装数据 */
    String driver = "com.mysql.jdbc.Driver";
	  String url = "jdbc:mysql://w.rdc.sae.sina.com.cn:3306/app_fmanager";
	  String username = "o25w1j0kwk";
	  String password = "2mk0mkl22jkz214ikx11w0imy3k5yikmy115xwlw";
    List<String> ll =new ArrayList<String>();
    try {
    Class.forName(driver);
    Connection conn = DriverManager.getConnection(url, username, password);
    Statement statement = conn.createStatement();
    String sql = "select * from month_lirun where month=\"2017-1\"";
    ResultSet rs = statement.executeQuery(sql);

    String temp = null;
    while (rs.next()) { 
        temp = rs.getString("number");
        ll.add(temp);
    }
    rs.close();
    conn.close();
    } catch (ClassNotFoundException e) {
    System.out.println("Sorry,can`t find the Driver!");
    e.printStackTrace();
    } catch (SQLException e) {
    e.printStackTrace();
    } catch (Exception e) {
    e.printStackTrace();
    }

    dataMap.put("first", ll.get(0));
    dataMap.put("second",  ll.get(1));
    dataMap.put("third",  ll.get(2));
    dataMap.put("chengben", ll.get(3));
    dataMap.put("shouruTotal", ll.get(4));
    dataMap.put("guanli", ll.get(5));
    dataMap.put("caiwu", ll.get(6));
    dataMap.put("fifth", ll.get(7));
    dataMap.put("suodeshui", ll.get(8));
    dataMap.put("pay", ll.get(9));
    dataMap.put("total", ll.get(10));


    /** 文件名称，唯一字符串 */
    Random r=new Random();
    SimpleDateFormat sdf1=new SimpleDateFormat("yyyyMMdd_HHmmss_SSS");
    StringBuffer sb=new StringBuffer();
    sb.append(sdf1.format(new Date()));
    sb.append("_");
    sb.append(r.nextInt(100));

    //文件路径
    filePath=ServletActionContext.getServletContext().getRealPath("/")+"upload";
    //System.out.println(filePath);

    //文件唯一名称
    fileOnlyName = "月现金流量表"+sb+".doc";

    //文件名称
    fileName = "月现金流量表" + ".doc";

    WordUtil.createWord(dataMap, "news.ftl", filePath, fileOnlyName);

    return "createWordSuccess";
}
public String dowloadWord() {
try {
//解决中文乱码
filePath = URLDecoder.decode(filePath, "UTF-8");
fileOnlyName = URLDecoder.decode(fileOnlyName, "UTF-8");
fileName = URLDecoder.decode(fileName, "UTF-8");

     //如果文件不存在，则会跳入异常，然后可以进行异常处理

     new FileInputStream(filePath + File.separator +  fileOnlyName);
    } catch (Exception e) {
     e.printStackTrace();
     return "error";
    }
    return "dowloadWord";
}

/**
 * @Desc：下载生成的word文档
 * 该方法是struts.xml文件中的： <param name="inputName">wordFile</param> 中自动对应的get方法，该方法自动调用
 * @Author：陈高德
 * @Date：2017-12-11下午05:03:19
 * @return 返回最终生成的word文档 文件流
 */
public InputStream getWordFile(){
    try {
     //解决中文乱码
     fileName = URLDecoder.decode(fileName, "UTF-8");

        /** 返回最终生成的word文件流  */
        return new FileInputStream(filePath + File.separator + fileOnlyName);
    } catch (Exception e) {
        e.printStackTrace();
        return null;
    }
}

public String getFilePath() {
return filePath;
}

public void setFilePath(String filePath) {
this.filePath = filePath;
}

public String getFileName() {
return fileName;
}

public void setFileName(String fileName) {
this.fileName = fileName;
}

public String getFileOnlyName() {
return fileOnlyName;
}

public void setFileOnlyName(String fileOnlyName) {
this.fileOnlyName = fileOnlyName;
}

}
