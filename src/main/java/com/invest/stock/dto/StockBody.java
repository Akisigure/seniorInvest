package com.invest.stock.dto;

import lombok.Data;

@Data
public class StockBody {
	
	private StockItems items;
	private int totalCount;
	private int numOfRows;
	private int pageNo;
}
