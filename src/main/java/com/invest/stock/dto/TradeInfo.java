package com.invest.stock.dto;

import java.util.Date;

import lombok.Data;
@Data
public class TradeInfo {
	private int tradeInfoNo; //거래번호
	private String userid; //사용자 id
	private String srtnCd; // 주식 코드
	private int tradeQuantity; //거래 양
	private Date orderDate; //주문 날짜
	private int orderPrice; //지정가
	private String accountid; // 계좌 id
	private char tradeType;//매도 매수
	private int mkp; //시장가
	private String itmsNm;
}
