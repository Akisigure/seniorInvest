package com.invest.stock.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.invest.stock.dto.OrderStockDto;
import com.invest.stock.dto.StockQuantityDto;

@Mapper
public interface StockQuantityDao {

	//전체 보유 내역
	@Select("select s.itmsNm, s.mkp, sq.srtnCd, userid, stockEA, tradeNo from stock s,stockQuantity sq where s.srtnCd = sq.srtnCd and userid= #{userid}")
	List<StockQuantityDto> getStockByUserid(String userid);
	//선택한 주식 1개만
	@Select("select s.itmsNm, s.mkp, sq.srtnCd, sq.userid, sq.stockEA from stock s, stockQuantity sq where s.srtnCd = sq.srtnCd and sq.userid= #{userid} and sq.srtnCd= #{srtnCd} and sq.tradeNo = #{tradeNo}")
	StockQuantityDto getStockByUseridstock(Map<String, Object> map);
	
	@Select("select ((mkp / orderPrice)-1)*100 as rofreturn, quantity as  stockEA,  os.srtncd, mkp, itmsnm, no as tradeNo from lastest_stock ls inner join orderstock os on ls.srtncd = os.srtncd where userid=#{userid}")
	List<StockQuantityDto> getOrderPrice(String userid); 
	 
	 
}