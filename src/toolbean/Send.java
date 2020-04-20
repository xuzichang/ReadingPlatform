package toolbean;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

/**
 * 发送邮件
 */

public class Send {

    private final String subject;
    private final String to;
    private final String content;

    public Send(String t,String subt,String c) {
        subject=subt;
        to=t;
        content=c;
    }

    public void send() {

        Properties props = new Properties();

        //设置邮件服务器地址，连接超时时限等信息
        props.setProperty("mail.transport.protocol", "SMTP");
        props.setProperty("mail.host", "smtp.qq.com");
        props.setProperty("mail.smtp.auth", "true");// 指定验证为true
        props.put("mail.smtp.ssl.enable", "true");

        //创建缺省的session对象
        Session session = Session.getDefaultInstance(props, null);

        //创建message对象
        Message msg = new MimeMessage(session);

        //设置发件人和收件人
        try{
            InternetAddress addressFrom = new InternetAddress("1927236438@qq.com");
            msg.setFrom(addressFrom);
            InternetAddress addressTo = new InternetAddress(to);

            msg.setRecipient(Message.RecipientType.TO, addressTo);

            //设置邮件
            msg.setSubject(subject);
            msg.setText(content);
            Transport transport   =   session.getTransport( "smtp");
            transport.connect("smtp.qq.com",   "1927236438@qq.com",   "xfgxsemochhqdehj");
            transport.sendMessage(msg,   msg.getAllRecipients());
            transport.close();

        }catch(Exception e) {
            System.out.print(e);
        }

    }
}
