/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.util.Properties;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author elizabeth
 */
public class MailUtils {
    
    public static void sendActivation( String firstName, String lastName, String email) throws MessagingException{
        
        Properties props = System.getProperties();
        
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        
        Session session = Session.getDefaultInstance(props, null);
        
        MimeMessage message = new MimeMessage(session);
        
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
        
        message.setSubject("Activaton Account");
        
        String body = "Welcome to Odd Jobs "+firstName+","+lastName+"<br> Click <a href='http://localhost:8080/oddJobs/Activation.jsp'>Here</a> to Activate Account";
        
        message.setContent(body, "text/html");
        
        Transport transport = session.getTransport("smtp");
        transport.connect("smtp.gmail.com", "oddjobstest123@gmail.com", "");
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();
        
    }
}
