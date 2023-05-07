package com.invest.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.invest.user.dto.Users;
import com.invest.user.service.RegisterService;
import com.invest.user.service.LoginService;

@Controller
public class UserController {
	
	@Autowired
	RegisterService regService;
	
	@Autowired
	LoginService logService;
	
	@GetMapping("/login")
	public String login() {
		return "account/login";
	}
	
	@GetMapping("/register")
	public String registerPage() {
		return "account/register";
	}
	
	@PostMapping("/register")
	public String register(Users user) {
		regService.registerUser(user);
		return "redirect:login";
	}
	
	@GetMapping("/loginSuccess")
	public String loginSuccess() {
		return "account/loginSuccess";
	}
		
	
}
