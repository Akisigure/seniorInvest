package com.invest.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.invest.user.dao.AccountBalanceDao;
import com.invest.user.dto.UserAccountInfo;

@Service
public class AccountBalanceService {

	@Autowired
	AccountBalanceDao accountBalnceDao;
	
	 public UserAccountInfo getUserBalance(String accountid) {
		return accountBalnceDao.getUserBalance(accountid);
	 }
	
}