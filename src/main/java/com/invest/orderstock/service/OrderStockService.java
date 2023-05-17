package com.invest.orderstock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.invest.orderstock.dao.OrderStockDao;
import com.invest.orderstock.dto.OrderStockDto;

@Service
public class OrderStockService {

	@Autowired
	OrderStockDao dao;
	
	public void AddOrder(OrderStockDto order) {
		dao.AddOrder(order);
	}
}
