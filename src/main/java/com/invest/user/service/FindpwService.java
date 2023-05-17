package com.invest.user.service;


import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.invest.user.dao.UserDao;
import com.invest.user.dto.Findpwd;
import com.invest.user.dto.Users;

@Service
public class FindpwService {
	
	@Autowired
	private UserDao dao;
	private int rowsAffected;
	
	@Autowired
	private PasswordEncoder encoder;
	
	public String emailCheck(String email) {
        // 이메일 주소가 DB에 저장되어 있는지 확인하는 로직 구현
        String savedEmail = dao.emailCheck(email);
        if(savedEmail != null) { // 이메일 주소가 DB에 저장되어 있다면
            // 인증번호 생성 및 이메일 전송 로직 구현
            return "true";
        } else { // 이메일 주소가 DB에 저장되어 있지 않다면
            return "fail";
        }
    }
	
	public boolean findPassword(@Param("email")String email,@Param("userName") String userName) {
		return dao.findPassword(email);
	}
	
	public Users findByEmail(String email) {
		return dao.findByEmail(email);
	}
	
	public int updatePassword(String email, String newPassword) {
			Findpwd findpwd = new Findpwd();
			findpwd.setEmail(email);
			
			findpwd.setPassword(newPassword);
						
			int isUpdated = dao.updatePassword(findpwd);
			
			System.out.println(isUpdated);
		return rowsAffected;
	}

	public void updatePassword(Users user) {
		
		
	}
	
}
