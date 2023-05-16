package com.invest.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.invest.user.dao.UserDao;
import com.invest.user.dto.Role;
import com.invest.user.dto.Users;


@Service
public class UserService {

	@Autowired
	UserDao dao;
	
	@Autowired
	private PasswordEncoder encoder;
	
	public int insertUser(Users users) {
		users.setPassword(encoder.encode(users.getPassword()));
		
		users.setRoleid(Role.ROLE_MEMBER);
		
		int i = dao.insertPermit(users);
		System.out.println(i);
		
		return i;
		
	}
}
