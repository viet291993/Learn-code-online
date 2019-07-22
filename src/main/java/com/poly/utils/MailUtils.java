package com.poly.utils;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailUtils {

    public static void sendMail(String propFilePath, String propAccountPath,
            String toMail, String subject, String content) throws Exception {
        try {
            InputStream input = new FileInputStream(propFilePath);
            Properties props = new Properties();
            props.load(input);
            input = new FileInputStream(propAccountPath);
            final Properties accountProp = new Properties();
            accountProp.load(input);
            Session session = Session.getDefaultInstance(props,
                    new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(accountProp.getProperty("support.mail.smtp"), accountProp.getProperty("support.password"));
                }
            });

            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(accountProp.getProperty("support.mail.from")));
            message.setRecipients(MimeMessage.RecipientType.TO,
                    InternetAddress.parse(toMail));
            message.setSubject(subject);
            message.setContent(content, "text/html; charset=utf-8");
            Transport.send(message);
        } catch (Exception ex) {
            throw ex;
        }
        
    }
}
