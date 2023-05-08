package com.invest.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.invest.user.dao.UserDao;
import com.invest.user.dto.Users;

@Service
public class LoginService {
	
	@Autowired
	UserDao dao;
	
	public Users loginUsers(Users user) {
		return dao.loginUser(user);
	}
}
