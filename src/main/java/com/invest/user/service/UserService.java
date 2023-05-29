package com.invest.user.service;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.invest.user.dto.Users;

@Service
public class UserService {

	public Users getCurrentUser() {
	    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    if (authentication != null && authentication.getPrincipal() instanceof Users) {
	        return (Users) authentication.getPrincipal();
	    }
	    return null;
	}
}

