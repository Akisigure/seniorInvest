package com.invest.stock.dto;

import lombok.Data;

@Data
public class StockQuantityDto {
	private String userid;
	private String accountid;
	private String srtnCd;
	private String itmsNm;
	private int stockEA;
	private int mkp;
	private int quantity;
	private int tradeNo;
	private long tradePrice;
	private int orderPrice;
	private double rofreturn;
	
	
	
	
}