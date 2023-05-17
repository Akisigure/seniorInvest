package com.invest.orderstock.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.invest.orderstock.dto.OrderStockDto;

@Mapper
public interface OrderStockDao {
	
	@Insert("insert into orderstock(userid,srtnCd,quantity,orderPrice) values (#{userid},#{srtnCd},#{quantity},#{orderPrice}")
	OrderStockDto AddOrder(OrderStockDto order);
}
