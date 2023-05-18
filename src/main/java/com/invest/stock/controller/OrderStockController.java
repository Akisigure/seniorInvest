package com.invest.stock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.invest.config.SecurityUser;
import com.invest.stock.dto.OrderStockDto;
import com.invest.stock.dto.StockQuantityDto;
import com.invest.stock.service.OrderStockService;

@Controller
public class OrderStockController {
 
	@Autowired
	OrderStockService service;
	
	@PostMapping("/orderComplete")
	public String addOrder(OrderStockDto order,StockQuantityDto quantity, @AuthenticationPrincipal SecurityUser user) {
		  String userid = user.getUsers().getUserid();
		  System.out.println(userid);
		  service.addOrder(order,userid);
		  service.stockTrade(userid, quantity);
		  
		return "stock/orderComplete";
	}
	
	
}
