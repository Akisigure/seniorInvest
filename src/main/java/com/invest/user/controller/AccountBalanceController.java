package com.invest.user.controller;

import com.invest.user.dto.UserAccountInfo;
import com.invest.user.service.AccountBalanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AccountBalanceController {
	
	/*
	 * @Autowired private AccountBalanceService accountBalanceService;
	 */
    @GetMapping("/account/balance")
    public String getUserAccountInfo() {
        return "mypage/Mypage";
    }
}
