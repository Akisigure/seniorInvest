package com.invest.stock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.invest.config.SecurityUser;
import com.invest.stock.dto.OrderStockDto;
import com.invest.stock.dto.StockQuantityDto;
import com.invest.stock.service.StockTradeService;

@Controller
public class OrderStockController {
 
	@Autowired
	StockTradeService service;
	
	@PostMapping("/orderComplete")
	public String buyTrade(OrderStockDto order,StockQuantityDto quantity,String itmsNm, @AuthenticationPrincipal SecurityUser user) {
		  String userid = user.getUsers().getUserid();
		  System.out.println(userid);
		  service.addOrder(order,userid);
		  service.stockBuyTrade(userid, quantity,itmsNm);
		  
		return "stock/orderComplete";
	}
	
	
}
