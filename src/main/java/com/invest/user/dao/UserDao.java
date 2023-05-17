package com.invest.user.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;

import com.invest.user.dto.Users;


@Mapper
public interface UserDao {
	
	
	@Insert("insert into users (userid,accountid,password,userName,phoneNumber,email,address,roleid,addressNumber,addressDetail) values(#{userid},#{accountid},#{password},#{userName},#{phoneNumber},#{email},#{address},#{roleid},#{addressNumber},#{addressDetail})")
	int registerUsers(Users user);
	
	@Insert("insert into userAccountInfo(accountid) values(#{accountid})")
	int insertUserBalance(String accountid);
	
	@Select("select * from users where userid = #{userid}")   
	Users findById(String userid);
	
	
	@Select("select * from users where userid = #{userid} and password = #{password} ")
	Users loginUser(Users user);

	@Select("select userid from users where userid = #{userid}")
    String idCheck(String userid);
	
	@Select("select email from users where email = #{email}")
	String emailCheck(String email);
	
	
	
}