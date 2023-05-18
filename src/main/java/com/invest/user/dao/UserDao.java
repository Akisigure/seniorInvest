package com.invest.user.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.invest.user.dto.Findpwd;
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
	
	@Select("select password from users where email = #{email}")
	boolean findPassword(@Param("email") String email);
	
	@Update("update users set password = #{password} where email= #{email}")
	int updatePassword(Findpwd findpwd);
	
	@Select("select userName from users where userName=#{userName}")
	Users getUserByUsername(String userName);
	
	@Select("select userid, email from users where email=#{email}")
	Users findByEmail(String email);
	
}
