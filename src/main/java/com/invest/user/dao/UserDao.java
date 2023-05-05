package com.invest.user.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.invest.user.dto.Users;


@Mapper
public interface UserDao {
	
	@Select("select * from users where userid = #{userid}")
	Users findById(String id);
	
	@Insert("insert into users values(#{userid},#{accountid},#{password},#{userName},#{phoneNumber},#{email},#{address},#{JoinedDate})")
	int registerUsers(Users user);
	
}
