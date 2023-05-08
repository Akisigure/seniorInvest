package com.invest.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.invest.user.dao.UserDao;
import com.invest.user.dto.Role;
import com.invest.user.dto.Users;

@Service
public class RegisterService {

	@Autowired
	UserDao dao;
	
	@Autowired
	private PasswordEncoder encoder; 

	public int registerUser(Users user) {
		user.setPassword(encoder.encode(user.getPassword()));
		
		user.setRole_id(Role.ROLE_MEMBER);
		
		return dao.registerUsers(user);
	}
	
	public String idCheck(String userid) {
		return dao.idCheck(userid);
	}
	
	
}
