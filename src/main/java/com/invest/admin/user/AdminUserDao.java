package com.invest.admin.user;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.invest.user.dto.Users;
@Mapper
public interface AdminUserDao {

	@Select("select * from users order by userid asc limit #{start}, #{count}")
	List<Users> selectUsers(Map<String, Object> m);

	@Select("select count(*) from users")
	int count();

	List<Users> userListSearch(Map<String, Object> m);

	int countUserSearch(Map<String, Object> m);//검색 글 갯수
	
}
