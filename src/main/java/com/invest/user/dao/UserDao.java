package com.invest.user.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.invest.user.dto.Users;


@Mapper
public interface UserDao {
	
	@Select("select * from users where userid = #{userid}")
	Users findById(String userid);
	
	@Insert("insert into users (userid,accountid,password,userName,phoneNumber,email,address,roleid,addressNumber,accountType) values(#{userid},#{accountid},#{password},#{userName},#{phoneNumber},#{email},#{address},#{roleid},#{addressNumber},#{accountType})")
	int registerUsers(Users user);
	
	@Select("select * from users where userid = #{userid} and password = #{password} ")
	Users loginUser(Users user);

	@Select("select userid from users where userid = #{userid}")
    String idCheck(String userid);
	
	@Select("select email from users where email = #{email}")
	String emailCheck(String email);
	
}
