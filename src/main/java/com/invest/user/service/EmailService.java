package com.invest.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.invest.user.dto.EmailVo;

import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.MimeMessage.RecipientType;



@Service("emailService")
public class EmailService {
	@Autowired
	protected JavaMailSender mailSender;

	public boolean sendMail(EmailVo email) throws Exception {
		
	try {
		
		MimeMessage msg = mailSender.createMimeMessage();
	
		msg.setSubject(email.getSubject());   
		
		//일반 텍스트만 전송하려는 경우
		msg.setText(email.getContent());
		
		// HTML 컨텐츠를 전송하려면.
		// msg.setContent("<a href='https://www.naver.com/'>클릭</a>",
		// "text/html;charset=utf-8");
		
		msg.setRecipient(RecipientType.TO, new InternetAddress(email.getReceiver()));
		
		mailSender.send(msg);
		
		return true;
		
	} catch (Exception e) {
		e.printStackTrace();
	
		return false;
		}	
	}
}
