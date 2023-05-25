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
	
	//tradeNo로 보유주식 리스트에서 하나 선택하기
	public StockQuantityDto getStockByUserid(String userid, String srtnCd,int tradeNo){
		
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("srtnCd", srtnCd);
		map.put("tradeNo", tradeNo);
		
		return stockQuantityDao.getStockByUseridstock(map);
		
	}

	//보유주식 리스트 뽑아오기
	public List<StockQuantityDto> getStockByUserid(String userid) {
		return stockQuantityDao.getStockByUserid(userid);
	}
	
	public List<StockQuantityDto> getOrderPrice(String userid){
		return stockQuantityDao.getOrderPrice(userid);
	}

}