package com.invest.stock.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.invest.stock.dao.StockDao;
import com.invest.stock.dto.TradeInfo;

@Service
public class StockService {
	@Autowired
	StockDao dao;
	
	public List<TradeInfo> getTradeList(int start){
		Map<String, Object> m = new HashMap<>();
		m.put("start", start);
		m.put("count", 10);
		return dao.getTradeList(m);
	}
	public List<TradeInfo> getTradeSellList(int start){
		Map<String, Object> m = new HashMap<>();
		m.put("start", start);
		m.put("count", 10);
		return dao.getTradeOrderList(m);

	}

	public int countTradeSearch() {
		return dao.countTradeSearch();
	}
	public int countTradeSellSearch() {
		return dao.countTradeOrderSearch();
	}
	

	
}
