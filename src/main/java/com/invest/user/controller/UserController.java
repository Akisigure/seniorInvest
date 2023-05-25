package com.invest.user.controller;


import java.security.Principal;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.invest.user.dao.UserDao;
import com.invest.user.dto.Findpwd;
import com.invest.user.dto.Users;
import com.invest.user.service.RegisterService;


import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

import com.invest.user.service.FindpwService;
import com.invest.user.service.LoginService;

@Controller
public class UserController {
	
	@Autowired
	RegisterService regService;
	
	@Autowired
	LoginService logService;
	
	@Autowired
	FindpwService findpwService;
	
	
	@Autowired
	private PasswordEncoder encoder; 
	
	
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
	public String register(@Validated Users user,BindingResult result, Model m) throws Exception {
	
		 String accountid = regService.randomAccount();//계좌
		
		System.out.println(user.toString());
		
		if(result.hasErrors()) {
	           List<ObjectError> errors = result.getAllErrors();
	            for(ObjectError error : errors){
	                System.out.println(error.getDefaultMessage());
		}
	            return "account/register";
		}
		
		try {
			user.setAccountid(accountid);
			regService.registerUser(user);
		
			
		} catch(IllegalStateException e) {
			e.printStackTrace();
			m.addAttribute("errorMessage", e.getMessage());
			return "account/register";
		}
		return "redirect:/login";
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

	@GetMapping("/emailCheck")
	@ResponseBody
	public String emailCheck(String email) {
		String checkEmail = regService.emailCheck(email);
		return checkEmail;
	}
	
	
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:/";
	}
	
	@GetMapping("/findPassword")
	public String findPasswordPage(Model m) {
		return "account/findPassword";
	}
	
	 @PostMapping("/findPassword")
	  public String findPassword(@RequestParam("email") String email, Model model) {
	    // 이메일을 통해 사용자 정보를 조회합니다.
	    Users user = findpwService.findByEmail(email);
	    
	    System.out.println(user);
	    
	    if (user == null) {
	      model.addAttribute("error", "해당 이메일로 등록된 사용자가 없습니다.");
	      return "findPassword"; // 비밀번호 찾기 페이지로 이동
	    }
	    
	    // 비밀번호 초기화 로직을 수행합니다.
	    String temporaryPassword = generateTemporaryPassword();
	    findpwService.temPassword(email, encoder.encode(temporaryPassword));
	    

	    model.addAttribute("temporaryPassword",temporaryPassword);
	    
	    return "account/temPassword"; 
	  }
	  
	  public String generateTemporaryPassword() {
		  
		  int length = 8;
		  String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		  StringBuilder sb = new StringBuilder();
		  
		  Random random = new Random();
		  for(int i = 0; i <length; i++) {
			  int index = random.nextInt(characters.length());
			  char randomChar = characters.charAt(index);
			  sb.append(randomChar);
		  }
		  return sb.toString();
	  }
	  
	  private String encryptPassword(String password) {
	    // 비밀번호 암호화 로직을 구현합니다.
	    // 예: BCrypt 등의 암호화 알고리즘을 사용하여 비밀번호를 암호화합니다.
	    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	    return passwordEncoder.encode(password);
	  }
	  
	  private String sendTemporaryPasswordEmail(String email, String temporaryPassword) {
		  // 이메일 전송을 위한 설정
		  Properties properties = new Properties();

		  String senderEmail = "mailniaad@gmail.com"; // 발신자 이메일
		  String senderPassword = "afqjtduixoapdytb"; // 임시 발급 비밀번

		  // 세션 생성
		  Session session = Session.getInstance(properties, new Authenticator() {
		    protected PasswordAuthentication getPasswordAuthentication() {
		      return new PasswordAuthentication(senderEmail, senderPassword);
		    }
		  });

		 return temporaryPassword;
		}
	  
		
	@GetMapping("/saveEmailCheck")
	@ResponseBody
	public String saveEmailCheck(String email) {
		String savecheckEmail = findpwService.emailCheck(email);
		return savecheckEmail;
	}

	@PostMapping("/temPassword")
	public String temPassword(Users user) {
		
		return "redirect:/login";
		
	}
			
	@GetMapping("/updatePassword")
	public String updatePasswordPage(Users user) {
		
		return "account/updatePassword";
	}
	
	@PostMapping("/updatePassword")
	public String updatePassword(String password, Principal principal ) {
		Authentication authentication = (Authentication) principal;
		String userid = authentication.getName();
		
		System.out.println(userid);
		String encryptedPassword = "{bcrypt}" + passwordEncoder.encode(password);
		
		findpwService.updatePassword(userid, encryptedPassword);
		System.out.println(password);
		
		return "redirect:/";
		    
	 
	}
	
	private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	
}
