package com.invest.user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.invest.user.dto.Users;


@Mapper
public interface UserDao {
	
	@Select("select * from users where userid = #{userid}")
	Users findById(String userid);
	
	@Insert("insert into users (userid,accountid,password,userName,phoneNumber,email,address,roleid) values(#{userid},#{accountid},#{password},#{userName},#{phoneNumber},#{email},#{address},#{roleid})")
	int registerUsers(Users user);
	
	@Select("select * from users where userid = #{userid} and password = #{password} ")
	Users loginUser(Users user);
	  
	@Insert("insert into user_role(userid,role_id) values(#{userid},#{role_id}")
	int insertPermit(Users user);
	
	@Select("select * from users order by userid asc limit #{start}, #{count}")
	List<Users> selectUsers(Map<String, Object> m);

	@Select("select count(*) from users")
	int count();


	List<Users> userListSearch(Map<String, Object> m);
	

	int countUserSearch(Map<String, Object> m);//검색 글 갯수
	

	
}
