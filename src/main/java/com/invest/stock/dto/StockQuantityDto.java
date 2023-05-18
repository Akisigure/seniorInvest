package com.invest.stock.dto;

import lombok.Data;

@Data
public class StockQuantityDto {

	private int tradeNo;
	private String userid;
	private String srtnCd;
	private String itmsNm;
	private int stockEA;
	private long tradePrice;
}
