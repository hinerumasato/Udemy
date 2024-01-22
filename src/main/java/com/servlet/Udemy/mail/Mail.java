package com.servlet.Udemy.mail;

import java.io.File;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import com.servlet.Udemy.constants.Constants;
import com.servlet.Udemy.context.AppContext;
import com.servlet.Udemy.utils.FileUtil;
import com.servlet.Udemy.utils.StringUtil;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Mail {

    private String emailTemplate;
    private Map<String, String> map;

    public void sendMail(String from, String to, String subject, String text) {
        Properties properties = FileUtil.getAppProperties();
        String host = properties.getProperty("mail.smtp.host");
        String port = properties.getProperty("mail.smtp.port");
        String username = properties.getProperty("mail.smtp.username");
        String password = properties.getProperty("mail.smtp.password");
        String address = properties.getProperty("mail.smtp.address");

        Properties props = new Properties();
        props.setProperty("mail.smtp.host", host);
        props.setProperty("mail.smtp.port", port);
        props.setProperty("mail.smtp.auth", "true");
        props.setProperty("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);    
            }
        });
        

        try {
            AppContext context = AppContext.getInstance();
            Message message = new MimeMessage(session);
            Multipart multipart = new MimeMultipart();
            File file = new File(context.getAppRealPath() + File.separator + Constants.TEMPLATE_PATH + this.emailTemplate);
            BodyPart bodyPart = new MimeBodyPart();
            String htmlContent = FileUtil.readFileToString(file);
            htmlContent = StringUtil.replaceHTMLKeys(htmlContent, map);
            bodyPart.setContent(htmlContent, "text/html; charset=UTF8");
            multipart.addBodyPart(bodyPart);
            message.setFrom(new InternetAddress(address));
            message.setSubject(subject);
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setContent(multipart);
            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}