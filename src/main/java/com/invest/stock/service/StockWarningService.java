package com.invest.stock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.invest.stock.dao.StockDao;

@Service
public class StockWarningService {

	@Autowired
	StockDao dao;
	
	public int warningStock(String srtnCd) {
		int count = dao.warningStock(srtnCd);
		return count;
		
	}
	
	
}