package com.invest.user.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.invest.user.dto.UserAccountInfo;
import com.invest.user.dto.Users;

@Mapper
public interface AccountBalanceDao {
	
    @Select("SELECT * FROM useraccountinfo where accountid = #{accountid}")
    UserAccountInfo getUserBalance(String accountid);
    
    @Update("UPDATE useraccountinfo SET balance = #{balance} WHERE userId = #{userId}")
    void updateBalance(UserAccountInfo userAccountInfo);
    
}    