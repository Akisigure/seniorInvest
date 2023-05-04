package com.invest.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.invest.user.dao.UserDao;
import com.invest.user.dto.Users;

@Service
public class RegisterService {

	@Autowired
	UserDao dao;

	public int registerUser(Users user) {
		return dao.registerUsers(user);
	}
	
	
}
