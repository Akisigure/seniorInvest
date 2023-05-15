package com.invest.stock.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.invest.stock.dto.StockDto;

@Mapper
public interface StockDao {
	
	@Insert("insert into stock(srtnCd,itmsNm,basDt,vs,fltRt,mkp,trqu,mrktTotAmt) values (#{srtnCd},#{itmsNm},#{basDt},#{vs},#{fltRt},#{mkp},#{trqu},#{mrktTotAmt})")
	int insertStock(StockDto stock);

    @Update("CREATE TABLE IF NOT EXISTS stock (" +
            "srtnCd VARCHAR(255) NOT NULL, " +
            "itmsNm VARCHAR(255), " +
            "basDt DATE, " +
            "vs INT, " +
            "fltRt DOUBLE, " +
            "mkp INT, " +
            "trqu INT, " +
            "mrktTotAmt LONG, " +
            "PRIMARY KEY (srtnCd)" +
            ")")
    void createTable();
}
