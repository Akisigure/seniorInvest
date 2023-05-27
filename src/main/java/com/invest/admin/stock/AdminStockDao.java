package com.invest.admin.stock;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
@Mapper
public interface AdminStockDao {
	
	/* 여러 컬럼을 join에 사용
	 * select * from TEST1 A left join TEST B on A.ref_id = B.id AND A.name =
	 * B.name;
	 */
	//매수인 경우
	@Select("select DISTINCT t.tradeInfoNo, t.userid, t.srtnCd, t.tradeQuantity, t.orderDate, t.orderPrice, t.accountid, t.tradeType, s.mkp, s.itmsNm "
			+ "from TradeInfo t left join stock s on t.srtnCd = s.srtnCd "
			+ "where t.tradeType = 'B' "
			+ "order by t.orderDate asc limit #{start}, #{count}")
	List<TradeInfo> getTradeList(Map<String, Object> m);
	
	//매도인 경우
	@Select("select DISTINCT t.tradeInfoNo, t.userid, t.srtnCd, t.tradeQuantity, t.orderDate, t.orderPrice, t.accountid, t.tradeType, s.mkp, s.itmsNm "
			+ "from TradeInfo t left join stock s on t.srtnCd = s.srtnCd "
			+ "where t.tradeType = 'S' order by t.orderDate asc limit #{start}, #{count}")
	List<TradeInfo> getTradeOrderList(Map<String, Object> m);
	
	@Select("select count(*) from TradeInfo where tradeType = 'B'") 
	int countTradeSearch(); // 매수 거래 수 
	
	@Select("select count(*) from TradeInfo where tradeType = 'S'") 
	int countTradeOrderSearch(); // 매도 거래 수
}
