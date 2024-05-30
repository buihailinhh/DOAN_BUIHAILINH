package DOANTT.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class HomeSevice {
    @Autowired
    private JavaMailSender javaMailSender;
    
	public void sendVerificationEmail(String yourName, String email, String message) {
        SimpleMailMessage messageMailMessage = new SimpleMailMessage();
        messageMailMessage.setTo(email);
        messageMailMessage.setSubject("Cám ơn bạn đã liên hệ với chúng tôi!");
        messageMailMessage.setText("Chào " + yourName + ", chúng tôi thấy bạn đã liên hệ với chúng tôi! Bạn có vấn đề gì không?");

        javaMailSender.send(messageMailMessage);
    }
}
