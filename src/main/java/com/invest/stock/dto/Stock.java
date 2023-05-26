package com.invest.stock.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Stock {
	private String srtnCd;
	private String itmsNm;
	private Date basDt;
	private int vs; //전일 대비
	private double fltRt; //전일대비 변동률
	private int mkp; //시장가
	private int trqu; //거래량
	private int mrktTotAmt; //시가종액
	}
