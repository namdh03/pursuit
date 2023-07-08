/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pursuit.utils;

import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author namdh
 */
public class Email {
    // Email: namdhse172173@fpt.edu.vn
    // Password: trymqxmuikyxmhgw

    private static final String EMAIL = "namdhse172173@fpt.edu.vn";
    private static final String PASSWORD = "CC9FC4CD257B434AD5C2567EB48AE27E4EF4";
    private static final String HOST = "smtp.elasticemail.com";
    private static final int PORT = 2525;

    public static boolean sendEmail(String to, String title, String content) {
        String from = EMAIL;
        String password = PASSWORD;
        // Properties : khai báo các thuộc tính
        Properties props = System.getProperties();
        props.put("mail.smtp.host", HOST); // SMTP HOST
        props.put("mail.smtp.port", String.valueOf(PORT)); // TLS 587 SSL 465
        props.put("mail.smtp.auth", "true");
        props.setProperty("mail.smtp.user", from);
        props.setProperty("mail.smtp.password", password);
        props.put("mail.smtp.starttls.enable", "true");

        // create Authenticator
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                // TODO Auto-generated method stub
                return new PasswordAuthentication(from, password);
            }
        };

        // Phiên làm việc
        Session session = Session.getInstance(props, auth);

        // Tạo một tin nhắn
        MimeMessage msg = new MimeMessage(session);

        try {
            // Kiểu nội dung
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");

            // Người gửi
            msg.setFrom(new InternetAddress(from));

            // Người nhận
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            // Tiêu đề email
            msg.setSubject(title);

            // Quy đinh ngày gửi
            msg.setSentDate(new Date());

            // Quy định email nhận phản hồi
            // msg.setReplyTo(InternetAddress.parse(from, false))
            // Nội dung
            msg.setContent(content, "text/HTML; charset=UTF-8");

            // Gửi email
            Transport.send(msg);
            System.out.println("Gửi email thành công");
            return true;
        } catch (MessagingException e) {
            System.out.println("Gặp lỗi trong quá trình gửi email");
            e.printStackTrace();
            return false;
        }
    }

    public static String templateEmail(String rootPath, String username, String code) {
        return "<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n"
                + "    <head>\n"
                + "        <meta charset=\"UTF-8\" />\n"
                + "        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n"
                + "        <title>Pursuit</title>\n"
                + "    </head>\n"
                + "    <body>\n"
                + "        <a href=" + rootPath + "/MainController?action=Verify&username=" + username + "&code=" + code + ">\n"
                + "            Click here to verify your account!\n"
                + "        </a>\n"
                + "    </body>\n"
                + "</html>";
    }
}
