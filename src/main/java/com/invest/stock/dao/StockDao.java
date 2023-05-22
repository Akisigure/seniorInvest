package com.invest.stock.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
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
	
	@Update("update stock set basDt = #{basDt}, fltRt = #{fltRt}, mkp = #{mkp}, vs = #{vs}, mrktTotAmt = #{mrktTotAmt} where srtnCd = #{srtnCd}")
	int updateStock(StockDto stock);

	//srtnCd like '#{srtnCd}%' or 
	@Select("select srtnCd,itmsNm from stock where itmsNm like concat(#{value} , '%')")
	List<Map<String, Object>> stockSearchResult(Map<String, Object> paramMap);
	
	@Select("select srtnCd,itmsNm,mkp,fltRt,vs from stock where itmsNm= #{itmsNm} ")
	StockDto stockDetailInfo(StockDto stock);
	
	@Select("select count(*) from stock where fltRt not between -5 and 5 and srtnCd = #{srtnCd}")
	int warningStock(String srtnCd);

}