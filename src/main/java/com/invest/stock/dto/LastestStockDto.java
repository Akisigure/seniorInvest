package com.invest.stock.dto;

import java.util.Date;

import lombok.Data;

@Data
public class LastestStockDto {
	
	private String srtnCd;
	private Date basDt;
	private double fltRt;
	private int mkp;
}
