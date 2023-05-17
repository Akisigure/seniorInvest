package com.invest.stock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;
import com.invest.stock.service.StockService;

@Controller
public class StockController {

	@Autowired
	StockService service;

	@Autowired
	RestTemplate restTemplate;

	
	  @GetMapping("/getStockPriceInfo")
	  public String stockDetailPage() throws Exception {
		  
		  service.stockInsert();
		
			return "redirect:";
	        
	    }
	 
	 

	@GetMapping("/stockDetail")
	public String stockSearch(Model m) {

		return "stock/stockDetail";
	}
	
	@GetMapping("/updateStocks")
	public String updateTest() throws Exception {
		service.updateLastestStock();
		return "redirect:";
	}

}
