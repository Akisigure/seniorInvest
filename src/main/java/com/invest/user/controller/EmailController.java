package com.invest.user.controller;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.invest.user.dto.EmailVo;
import com.invest.user.service.EmailService;


@RestController
public class EmailController {

	@Autowired
	private EmailService emailService;

	@RequestMapping("/send")
	public String[] sendMail(String emailAddress) throws Exception {
		
		EmailVo email = new EmailVo();
		
		String receiver = emailAddress;
		
		String subject = "Email 제목";
		
		String number = makeRandom();
		
		String content = "인증번호는 "+number+"입니다.";
		
		email.setReceiver(receiver);
		email.setSubject(subject);
		email.setContent(content);
		
		Boolean result = emailService.sendMail(email);
		
		return new String[] {number,result.toString()};
		
	}

	private String makeRandom() {
		
		Random r = new Random();
		String number = "";
		for(int i = 0;i< 6; i++) {
			number += r.nextInt(10);
		}
		System.out.println("number : "+number);
		return number;
	}






}
