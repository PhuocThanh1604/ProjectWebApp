package sample.sendmail;


import java.security.Security;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class SendMail {

    public static void sendEmail(String host, String port,
            final String userName, final String password, String toAddress,
            String name, String message) throws AddressException,
            MessagingException {
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("phuocthanh20cgh@gmail.com", "0933391614t");
            }
        };
        Session session = Session.getInstance(properties, auth);
        Message msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(userName));
        InternetAddress[] toAddresses = { new InternetAddress(toAddress) };
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setSubject(name);
        msg.setSentDate(new Date());
        msg.setText(message);
        Transport.send(msg);
    }
}
