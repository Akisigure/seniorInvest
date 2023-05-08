package com.invest.user.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
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
	public String login(String error) {
		return "account/login";
	}
	
	@GetMapping("/register")
	public String registerPage(Model m) {
		m.addAttribute("Users", new Users());
		return "account/register";
	}
	
	@PostMapping("/register")
	public String register(@Valid Users user,BindingResult result, Model m) throws Exception {
		
		System.out.println(user.toString());
		
		if(result.hasErrors()) {
	           List<ObjectError> errors = result.getAllErrors();
	            for(ObjectError error : errors){
	                System.out.println(error.getDefaultMessage());
		}
	            return "account/register";
		}
		try {
		regService.registerUser(user);
			
		} catch(IllegalStateException e) {
			m.addAttribute("errorMessage", e.getMessage());
			return "account/register";
		}
		
			// regService.registerUser(user);
		return "redirect:login";
	}
	
	@PostMapping("/login")
	public String loginSuccess(Users user) {
		logService.loginUsers(user);
		return "redirect:/";
	}
	
	@GetMapping("/idCheck")
    @ResponseBody
    public String idCheck(String userid) {
        String checkid = regService.idCheck(userid);
        return checkid;
    }
	
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:/";
	}
	
	
}
