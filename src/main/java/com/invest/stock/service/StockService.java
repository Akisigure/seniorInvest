package com.invest.stock.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;


@Service
public class StockService {

	
	@Value("${API-KEY}")
	private String API;

	public String getAPI() {
		return API;
	}
	
	
	
}
