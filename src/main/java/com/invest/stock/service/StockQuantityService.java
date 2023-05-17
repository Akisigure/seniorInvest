package com.invest.stock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.invest.stock.dao.StockQuantityDao;
import com.invest.stock.dto.StockQuantityDto;

@Service
public class StockQuantityService {
	
	@Autowired
	StockQuantityDao stockQuantityDao;
	
	public List<StockQuantityDto> getStockByUserid(String userid){
		return stockQuantityDao.getStockByUserid(userid);
		
		
	}
}
