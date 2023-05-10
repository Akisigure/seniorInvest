package com.invest.user.service;


import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.invest.user.dao.UserDao;
import com.invest.user.dto.Role;
import com.invest.user.dto.Users;

@Service
public class RegisterService {

	@Autowired
	UserDao dao;
	
	@Autowired
	private PasswordEncoder encoder; 

	@Transactional
	public int registerUser(Users user) {
		user.setPassword(encoder.encode(user.getPassword()));
		
		user.setRoleid(Role.ROLE_MEMBER);
		
		user.setAccountid(randomAccount());
		
		int i = dao.registerUsers(user);
		System.out.println(i);
		
		return i;
	}
	
	public String idCheck(String userid) {
        return dao.idCheck(userid);
    } 
	
	public String emailCheck(String email) {
		return dao.emailCheck(email);
	}
	
	private String randomAccount() {
		
		Random r = new Random();
		String number = "";
		for(int i = 0;i< 12; i++) {
			number += r.nextInt(10);
		}
		System.out.println("number : "+number);
		return number;
	}

	
}
