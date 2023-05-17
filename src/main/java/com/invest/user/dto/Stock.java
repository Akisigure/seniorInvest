package com.invest.user.dto;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public class Stock {
	private String userid;
	private String srtnCd;
	private long balance; 
	private String accountid;
}
