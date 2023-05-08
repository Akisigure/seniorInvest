package com.invest.user.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.invest.user.dto.Users;


@Mapper
public interface UserDao {
	
	@Select("select * from users where userid = #{userid}")
	Users findById(String id);
	
	@Insert("insert into users (userid,accountid,password,userName,phoneNumber,email,address) values(#{userid},#{accountid},#{password},#{userName},#{phoneNumber},#{email},#{address})")
	int registerUsers(Users user);
	
	@Select("select * from users where userid = #{userid} and password = #{password} ")
	Users loginUser(Users user);
	
	@Select("select count(*) from users where userid = #{userid}")
	String idCheck(String userid);
	
	@Insert("insert into user_role values(#{userid},#{role_id}")
	int insertPermit(Users user);
	
}
