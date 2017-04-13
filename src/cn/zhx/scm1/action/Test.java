package cn.zhx.scm1.action;


/*import java.io.BufferedReader;  
import java.io.IOException;  
import java.io.InputStreamReader;  
import java.io.UnsupportedEncodingException;  
import java.net.HttpURLConnection;  
import java.net.MalformedURLException;  
import java.net.URL;  
import java.net.URLEncoder;  
  
public class Test {  
  
    private Integer x_eid = 0;//会员企业ID号,个人用户为0  
    private String x_uid = "yourname";//会员账号  
    private String x_pwd_md5 = "e10adc3949ba59abbe56e057f20f883e";//登陆密码的MD5值32位  
    private Integer x_gate_id = 300;//发送短信时通道ID，通道发送失败可以切换其它通道，无该值系统使用默认通道  
      
    public String SendSms(String mobile, String content) throws UnsupportedEncodingException{  
          
        Integer x_ac = 10;//发送信息  
        HttpURLConnection httpconn = null;  
        String x_memo = content.trim();//发送短信内容  
        StringBuilder sb = new StringBuilder();  
          
        sb.append("http://gateway.woxp.cn:6630/utf8/web_api/?x_eid=");  
        sb.append(x_eid);  
        sb.append("&x_uid=").append(x_uid);  
        sb.append("&x_pwd_md5=").append(x_pwd_md5);  
        sb.append("&x_ac=").append(x_ac);  
        sb.append("&x_gate_id=").append(x_gate_id);  
        sb.append("&x_target_no=").append(mobile);  
        sb.append("&x_memo=").append(URLEncoder.encode(x_memo, "utf-8"));  
          
        String result = "-20";  
        System.out.println(sb.toString());  
        try {  
            URL url = new URL(sb.toString());  
            httpconn = (HttpURLConnection) url.openConnection();  
            BufferedReader rd = new BufferedReader(new InputStreamReader(httpconn.getInputStream()));  
            result = rd.readLine();  
            rd.close();  
        } catch (MalformedURLException e) {  
            e.printStackTrace();  
        } catch (IOException e) {  
            e.printStackTrace();  
        } finally{  
            if(httpconn != null){  
                httpconn.disconnect();  
                httpconn = null;  
            }  
        }  
        return result;  
    }  
      
    public static void main(String[] args) {  
        String mobile="15551300515";  
        String content="Hello";  
        try {  
            String result = new Test().SendSms(mobile, content);  
            System.out.println(result);  
        } catch (UnsupportedEncodingException e) {  
            e.printStackTrace();  
        }  
    }  
}  */

import java.text.SimpleDateFormat;
import java.util.Date;

public class Test {

	
	public static void main(String[] args) {
		//Date d = new Date();
        // 给定模式
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        // public final String format(Date date)
        @SuppressWarnings("deprecation")
		String s = sdf.format(new Date("Wed Apr 12 00:00:00 CST 2017"));
        System.out.println(s);
		

		

}
}
