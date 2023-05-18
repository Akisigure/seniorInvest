package com.invest.stock.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.invest.stock.dto.StockQuantityDto;

@Mapper
public interface StockQuantityDao {

	//전체 보유 내역
	@Select("select s.itmsNm, s.mkp, sq.srtnCd, userid, stockEA from stock s,stockQuantity sq where s.srtnCd = sq.srtnCd and userid= #{userid}")
	List<StockQuantityDto> getStockByUserid(String userid);
	//선택한 주식 1개만
	@Select("select s.itmsNm, s.mkp, sq.srtnCd, userid, stockEA from stock s,stockQuantity sq where s.srtnCd = sq.srtnCd and userid= #{userid} and sq.srtnCd= #{srtnCd}")
	StockQuantityDto getStockByUseridstock(Map<String, String> map);
	
	 
	 
}
