package com.invest.user.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.invest.user.dto.Users;

import jakarta.annotation.PostConstruct;

@Repository
@Mapper
public interface UserDao {
	
	@Select("select * from users where userid = #{userid}")   
	Users findById(String userid);
	
	@Insert("insert into users (userid,accountid,password,userName,phoneNumber,email,address,roleid,addressNumber,accountType,addressDetail) values(#{userid},#{accountid},#{password},#{userName},#{phoneNumber},#{email},#{address},#{roleid},#{addressNumber},#{accountType},#{addressDetail})")
	int registerUsers(Users user);
	
	@Select("select * from users where userid = #{userid} and password = #{password} ")
	Users loginUser(Users user);

	@Select("select userid from users where userid = #{userid}")
    String idCheck(String userid);
	
	@Select("select email from users where email = #{email}")
	String emailCheck(String email);
	
	  @PostConstruct
	    @Update("CREATE TABLE IF NOT EXISTS users (" +
	            "userid VARCHAR(255) NOT NULL," +
	            "accountid VARCHAR(255) NOT NULL," +
	            "accountType VARCHAR(255) NOT NULL," +
	            "password VARCHAR(255) NOT NULL," +
	            "userName VARCHAR(255)," +
	            "phoneNumber VARCHAR(255) NOT NULL," +
	            "email VARCHAR(255) NOT NULL," +
	            "address VARCHAR(255)," +
	            "addressNumber VARCHAR(255)," +
	            "joinedDate TIMESTAMP," +
	            "roleid VARCHAR(255)," +
	            "addressDetail VARCHAR(255)," +
	            "enabled CHAR(1)," +
	            "restrictStock CHAR(1)," +
	            "alert CHAR(1)," +
	            "PRIMARY KEY (userid)" +
	            ")")
	    void createTableIfNotExist();
	}
	

