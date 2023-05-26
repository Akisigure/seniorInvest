package com.invest.admin.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.invest.user.dto.Users;
@Service
public class AdminUserService {
	@Autowired
	AdminUserDao dao;
	
	public List<Users> getUserList(String searchn, String search, int start){
		Map<String, Object> m = new HashMap<>();
		m.put("start", start);
		m.put("count", 10);
		m.put("searchn",searchn);
		m.put("search", search);
		
		if(searchn == null) {
			return dao.selectUsers(m);
		}else {
			return dao.userListSearch(m);
			
		}
	
		}


	public int count() {
		return dao.count();
	}
	
	//검색
	public List<Users> userListSearch(String searchn, String search, int start){
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("count", 10);
		return dao.userListSearch(m);
	}
	public int countUserSearch(String searchn, String search) {
		//System.out.println(searchn+search);
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		if(searchn == null) {
			return dao.count();
		}else {
			return dao.countUserSearch(m);
			
		}
		
		
	}
}
