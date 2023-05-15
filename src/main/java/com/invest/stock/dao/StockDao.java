package com.invest.stock.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.invest.stock.dto.StockDto;

@Mapper
public interface StockDao {
	
	@Insert("insert into stock(srtnCd,itmsNm,basDt,vs,fltRt,mkp,trqu,mrktTotAmt) values (#{srtnCd},#{itmsNm},#{basDt},#{vs},#{fltRt},#{mkp},#{trqu},#{mrktTotAmt})")
	int insertStock(StockDto stock);
	
}
 