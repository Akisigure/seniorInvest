package com.invest.stock;

import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface StockInfoMapper {

	@Update("CREATE TABLE IF NOT EXISTS stock_info(" +
	        "id BIGINT AUTO_INCREMENT PRIMARY KEY," +
	        "srtnCd INT," +
	        "itmsNm CHAR(255)," +
	        "clpr INT," +
	        "vs INT," +
	        "fltRt DOUBLE," +
	        "mkp INT," +
	        "hipr INT," +
	        "lopr INT," +
	        "trqu INT," +
	        "trPrc INT," +
	        "lstgStCnt INT," +
	        "mrktTotAmt INT)")

    void createTable();

    @Delete("DELETE FROM stock_info")
    void deleteAll();

    @Select("SELECT * FROM stock_info")
    List<StockInfo> findAll();

    @Insert("INSERT INTO stock_info(srtnCd, isinCd, itmsNm, mrktCtg, clpr, vs, fltRt, mkp, hipr, lopr, trqu, trPrc, lstgStCnt, mrktTotAmt) " +
            "VALUES (#{srtnCd}, #{isinCd}, #{itmsNm}, #{mrktCtg}, #{clpr}, #{vs}, #{fltRt}, #{mkp}, #{hipr}, #{lopr}, #{trqu}, #{trPrc}, #{lstgStCnt}, #{mrktTotAmt})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void save(StockInfo stockInfo);

    @Select("SELECT COUNT(*) FROM stock_info")
    int count();
}
