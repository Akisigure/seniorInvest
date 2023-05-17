package com.invest.stock.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.invest.stock.dto.StockQuantityDto;

@Mapper
public interface StockQuantityDao {

	@Select("select s.itmsNm, s.mkp, sq.srtnCd, userid, stockEA from stock s,stockQuantity sq where s.srtnCd = sq.srtnCd and userid= #{userid}")
	List<StockQuantityDto> getStockByUserid(String userid);
	
	
	 
}
