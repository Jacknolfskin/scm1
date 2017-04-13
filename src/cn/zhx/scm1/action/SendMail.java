package cn.zhx.scm1.action;

import java.security.Security;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {

	public static void sendHtmlMail(String emailTitle, String emailContent,String accEmail) throws AddressException, MessagingException {
        String SEND_USER = "1352490133@qq.com";
        String SEND_UNAME = "hufei";
        String SEND_PWD = "********";
        String VALUE_SMTP = "smtp.qq.com";
        Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
        
        Properties props = System.getProperties();
        props.setProperty("mail.smtp.host", "smtp.qq.com");
        props.setProperty("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        final String username = "1352490133";
        final String password = "dyznjtlnyptaidii";
        Session session = Session.getDefaultInstance(props,
                new Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });
 
        // -- Create a new message --
        session.setDebug(true);
        Message msg = new MimeMessage(session);
 
        // -- Set the FROM and TO fields --
        msg.setFrom(new InternetAddress(username + "@qq.com"));
        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(accEmail, false));
        msg.setSubject(emailTitle);
        msg.setContent(emailContent,"text/html;charset=utf-8");
        msg.setSentDate(new Date());
        Transport transport = session.getTransport("smtp");
        // smtp验证，就是你用来发邮件的邮箱用户名密码
        transport.connect(VALUE_SMTP, SEND_UNAME, SEND_PWD);
        // 发送
        transport.sendMessage(msg, msg.getAllRecipients());
        //Transport.send(msg);
        transport.close();
 
        System.out.println("Message sent.");
    }
 
}


	

