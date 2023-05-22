package com.invest.stock.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.invest.stock.dao.StockQuantityDao;
import com.invest.stock.dto.StockQuantityDto;

@Service
public class StockQuantityService {
	
	@Autowired
	StockQuantityDao stockQuantityDao;
	
	public StockQuantityDto getStockByUserid(String userid, String srtnCd,int tradeNo){
		
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("srtnCd", srtnCd);
		map.put("tradeNo", tradeNo);
		
		return stockQuantityDao.getStockByUseridstock(map);
		
		
	}

	public List<StockQuantityDto> getStockByUserid(String userid) {
		return stockQuantityDao.getStockByUserid(userid);
	}
}
