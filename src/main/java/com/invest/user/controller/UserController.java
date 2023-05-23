package com.invest.user.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;



import com.invest.user.dto.Users;
import com.invest.user.service.RegisterService;
import com.invest.user.service.UserService;

import jakarta.validation.Valid;

import com.invest.user.service.LoginService;

@Controller
public class UserController {
	
	@Autowired
	RegisterService regService;
	
	@Autowired
	LoginService logService;
	
	@Autowired
	UserService userService;
	
	@GetMapping("/login")
	public String login() {
		return "account/login";
	}
	
	@GetMapping("/register")
	public String registerPage() {
		return "account/register";
	}
	
	@PostMapping("/register")
	public String register(@Valid Users user, Errors errors, Model m) {
		
		regService.registerUser(user);
		return "redirect:login";
	}
	
	@GetMapping("/loginSuccess")
	public String loginSuccess() {
		return "account/loginSuccess";
	}
	
	@GetMapping("/admin/userList")
	public String getUserList(String searchn, String search,@RequestParam(name = "p", defaultValue = "1") int page, Model m) {
		int count = userService.countUserSearch(searchn, search ); 
		System.out.println(count+"count");
		if (count > 0) {

			int perPage = 10; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage;

			List<Users> userList = userService.getUserList(searchn, search, startRow);
			m.addAttribute("start", startRow+1);
			m.addAttribute("uList", userList);

			int pageNum = 5;
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // 전체 페이지 수

			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum - 1;
			if (end > totalPages) {
				end = totalPages;
			}
			m.addAttribute("begin", begin);
			m.addAttribute("end", end);
			m.addAttribute("pageNum", pageNum);
			m.addAttribute("totalPages", totalPages);
		}
		m.addAttribute("count", count);
		
		return "admin/userList";
	}
	
	
		
	
}
