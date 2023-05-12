package com.invest.stock.command;

import java.util.List;

import lombok.Data;

@Data
public class StockInfo {
	
	int total;
	List<Stock> Stocks;
}
