package com.invest.stock.dto;

import lombok.Data;

@Data
public class StockDto {
	
	private int StockCode;
	private String stockName;
	private long marketCap;
	private long volume;
	private int vs;
	private String resultType;
	
}
