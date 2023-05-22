package com.invest.stock.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.invest.stock.dto.OrderStockDto;
import com.invest.stock.dto.StockDto;
import com.invest.stock.dto.StockQuantityDto;

@Mapper
public interface StockTradeDao {
	
	@Insert("insert into orderstock(userid,srtnCd,quantity,orderPrice) values (#{userid},#{srtnCd},#{quantity},#{orderPrice})")
	int addOrder(OrderStockDto order);
	
	@Select("select accountid from users where userid = #{userid}")
	String getAccountId(String userid);
	
	@Select("select * from orderstock where date(orderdate) = date(now()) and orderstatus = 'N'")
	List<OrderStockDto> orderList();
	
	@Select("select balance from useraccountinfo where accountid = #{accountid}")
	int getBalance(String accountid);
	
	@Select("select mkp from stock where srtnCd = #{srtnCd}")
	int getPrice(String srtnCd);
	
	@Insert("insert into stockquantity (userid,srtnCd,stockEA,tradePrice,itmsNm) values (#{userid},#{srtnCd},#{quantity}, #{quantity} * #{orderPrice} ,itmsNm )")
	int tradeResult(OrderStockDto quantity);
	
	@Update("update orderstock set orderStatus = 'Y' where no = #{no}")
	int updateAddOrder(int no);
	
	@Update("update useraccountinfo set balance = #{balance} where accountid = #{accountid}")
	int stockBuyBalance(@Param("balance") long balance, @Param("accountid") String accountid);
	
	@Update("update stockquantity set stockEA = stockEA - #{quantity} where userid = #{userid} and tradeNo = #{tradeNo} and srtnCd = #{srtnCd}")
	int stockSellUpdate(StockQuantityDto stockQuantity,@Param("quantity") int quantity,@Param("userid")String userid,@Param("tradeNo") int tradeNo,@Param("srtnCd")String srtnCd);
	
	@Delete("delete from stockquantity where userid= #{userid} and stockEA = 0")
	int deleteQuantity(@Param("userid")String userid);
	
	@Update("update useraccountinfo set balance = #{balance} + #{sellStock} where accountid = #{accountid}")
	int stockSellBalance(@Param("balance") long balance, @Param("accountid") String accountid,@Param("sellStock")long sellStock);
	
	@Select("select mkp from lastest_stock where srtnCd = #{srtnCd}")
	int getLastestPrice(@Param("srtnCd") String srtnCd);
	

}

