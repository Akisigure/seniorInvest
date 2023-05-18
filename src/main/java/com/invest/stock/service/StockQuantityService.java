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
	
	public StockQuantityDto getStockByUserid(String userid, String srtnCd){
		
		Map<String, String> map = new HashMap<>();
		map.put("userid", userid);
		map.put("srtnCd", srtnCd);
		
		return stockQuantityDao.getStockByUseridstock(map);
		
		
	}

	public List<StockQuantityDto> getStockByUserid(String userid) {
		return stockQuantityDao.getStockByUserid(userid);
	}
}
