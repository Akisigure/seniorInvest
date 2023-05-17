package com.invest.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.invest.config.SecurityUser;
import com.invest.user.dto.UserAccountInfo;
import com.invest.user.service.AccountBalanceService;

@Controller
public class AccountBalanceController {
	
	@Autowired
	AccountBalanceService accountBalanceService;
	

	@GetMapping("/Mypage")    
	public String MyPage(@AuthenticationPrincipal SecurityUser user, Model m) {
	//	System.out.println(user.getUsers().getAccountid());
		
	   UserAccountInfo info =  accountBalanceService.getUserBalance(user.getUsers().getAccountid());
	 
	   m.addAttribute("Balance", info);
	   
		return "mypage/Mypage";

	}
	
	
}