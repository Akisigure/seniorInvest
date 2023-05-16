package com.invest.stock.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.invest.stock.dto.StockDto;

@Mapper
public interface StockDao {
	
	@Insert("insert into stock(srtnCd,itmsNm,basDt,vs,fltRt,mkp,trqu,mrktTotAmt) values (#{srtnCd},#{itmsNm},#{basDt},#{vs},#{fltRt},#{mkp},#{trqu},#{mrktTotAmt})")
	int insertStock(StockDto stock);

	@Insert("insert into lastest_stock(srtnCd,basDt,fltRt,mkp) values (#{srtnCd},#{basDt},#{fltRt},#{mkp})")
	int insertLastestStock(StockDto stock);
	
	@Update("update lastest_stock set basDt = #{basDt}, fltRt = #{fltRt}, mkp = #{mkp} where srtnCd = #{srtnCd}")
	int updateLastestStock(StockDto stock);
	
	//vs, trqu mrktTotAmt
	@Update("update stock set basDt = #{basDt}, fltRt = #{fltRt}, mkp = #{mkp} where srtnCd = #{srtnCd}")
	int updateStock(StockDto stock);
	
}
 