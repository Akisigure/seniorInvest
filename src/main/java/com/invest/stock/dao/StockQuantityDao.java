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

	//((68000 - 64000 ) / 64000 * 100)
	@Select("select (ls.mkp - (tradePrice /stockEA ))/ (tradePrice /stockEA ) * 100 as rofreturn, stockEA,  s.srtncd, ls.mkp, s.itmsnm, tradeNo from lastest_stock ls,stockQuantity sq,stock s where ls.srtnCd = sq.srtnCd and sq.srtnCd = s.srtnCd and userid= #{userid}")
	List<StockQuantityDto> getStockByUserid(String userid);
	//선택한 주식 1개만
	@Select("select s.itmsNm, mkp, sq.srtnCd, userid, stockEA from stock s,stockQuantity sq where s.srtnCd = sq.srtnCd and userid= #{userid} and sq.srtnCd= #{srtnCd} and sq.tradeNo = #{tradeNo}")
	StockQuantityDto getStockByUseridstock(Map<String, Object> map);
	
	//전체 보유 내역
	//@Select("select ((mkp / orderPrice)-1)*100 as rofreturn, quantity as  stockEA,  os.srtncd, mkp, itmsnm, no as tradeNo from lastest_stock ls inner join orderstock os on ls.srtncd = os.srtncd where userid=#{userid}")
	//List<StockQuantityDto> getOrderPrice(String userid); 
	 
	 
}