package com.invest.orderstock.dto;

import java.util.Date;

import lombok.Data;

@Data
public class OrderStockDto {
	
	private int no;
	private String userid;
	private String srtnCd;
	private int quantity;
	private int orderPrice;
	private char orderStatus;
	private Date orderDate;
}
