package com.invest.user.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.invest.user.dto.Users;
import com.invest.user.service.RegisterService;

import jakarta.validation.Valid;

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
	public String registerPage(Model m) {
		m.addAttribute("Users", new Users());
		return "account/register";
	}
	
	@PostMapping("/register")
	public String register(@Valid Users user, BindingResult bindingResult, Model m) {
		if(bindingResult.hasErrors()) {
			return "account/register";
		}
		
		try {
			regService.registerUser(user);
		}catch (IllegalStateException e) {
			m.addAttribute("errorMessage", e.getMessage());
			return "account/register";
		}
		return "redirect:login";
	}
	
	@PostMapping("/login")
	public String loginSuccess() {
		
		return "redirect:/";
	}
	
	@GetMapping("/idCheck")
    @ResponseBody
    public String idCheck(String userid) {
        String checkid = regService.idCheck(userid);
        return checkid;
    }
	
	@GetMapping("/loginout")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:/";
	}
		
	
}
