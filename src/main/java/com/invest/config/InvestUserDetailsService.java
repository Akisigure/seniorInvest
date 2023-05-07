package com.invest.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.invest.user.dao.UserDao;
import com.invest.user.dto.Users;

@Service
public class InvestUserDetailsService implements UserDetailsService {

	@Autowired
	private UserDao userDao;
	
	@Override
	public UserDetails loadUserByUsername(String userid) throws UsernameNotFoundException {
		Users user = userDao.findById(userid);
		if(user == null) {  
			throw new UsernameNotFoundException(userid + "사용자 없음");
		} else {
			return new SecurityUser(user);
		}
	}
}
