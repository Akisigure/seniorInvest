package com.invest.stock.dto;

import java.util.Date;

import lombok.Data;

@Data
public class StockTradeDto {

	private String srtnCd;
	private String accountid;
	private String userid;
	private Date orderDate;
	private int tradeQuantity;
	private char tradeType;

}
