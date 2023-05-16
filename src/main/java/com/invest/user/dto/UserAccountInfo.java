package com.invest.user.dto;

import lombok.Data;

@Data
public class UserAccountInfo {
	
	private String userid;
	private String userName;
	private long Balance;
	private String accountid;
	private int StockEA;
	private int StockCode;
	private String StockName;

	
}
