package com.invest.orderstock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.invest.orderstock.dto.OrderStockDto;
import com.invest.orderstock.service.OrderStockService;

@Controller
public class OrderStockController {

	@Autowired
	OrderStockService service;
	
	@PostMapping("/addOrder")
	public String addOrder(OrderStockDto order) {
		service.AddOrder(order);
		
		return "stock/orderComplete";
	}
}
