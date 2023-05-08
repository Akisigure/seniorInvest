package com.invest.config;

import java.io.IOException;
import java.net.URLEncoder;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Configuration
public class AuthFailureHandler extends SimpleUrlAuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		String errorMessage = null;
		
		if(exception instanceof BadCredentialsException) {
			errorMessage = "아이디와 비밀번호를 확인해 주세요.";
		}else if(exception instanceof InternalAuthenticationServiceException) {
			errorMessage = "내부 시스템 문제로 로그인할 수 없습니다. 관리자에게 문의하세요";
		}else if(exception instanceof UsernameNotFoundException) {
			errorMessage = "존재하지 않는 계정입니다.";
		}else {
			errorMessage = "알 수 없는 오류입니다.";
		}
		
		errorMessage = URLEncoder.encode(errorMessage, "UTF-8");
		setDefaultFailureUrl("/login?error=" + errorMessage);
		
		
		super.onAuthenticationFailure(request, response, exception);
	}


	
}
