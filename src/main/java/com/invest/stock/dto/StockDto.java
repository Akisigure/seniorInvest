package com.invest.stock.dto;

import java.util.Date;

import lombok.Data;

@Data
public class StockDto {
	
	private Date basDt;
	private String srtnCd;
	private String itmsNm;
	private int vs;
	private double fltRt;
	private int mkp;
	private int trqu;
	private long mrktTotAmt;
	private boolean favorited;
	
}
