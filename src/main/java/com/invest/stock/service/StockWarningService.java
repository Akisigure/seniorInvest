package com.invest.stock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.invest.stock.dao.StockDao;

@Service
public class StockWarningService {

	@Autowired
	StockDao dao;
	
	//유의 종목일 시 count 증가
	public int warningStock(String srtnCd) {
		int count = dao.warningStock(srtnCd);
		return count;
		
	}
	
	

}

