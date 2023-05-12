package com.invest.stock.command;

import java.util.Date;

import lombok.Data;

@Data
public class Stock {
	
	private String serviceKey;
	private int numOfRows;
	private int pageNo;
	private String resultType;
	private Date baseDt;
	private Date beginBasDt;
	private Date endBasDt;
	private Date likeBasDt;
	private String isinCd;
	private String likeIsinCd;
	private String itmsNm;
	private String likeItmsNm;
	private String mrktCls;
	private int beginVs;
	private int endVs;
	private int beginFltRt;
	private int endFltRt;
	private int beginTrqu;
	private int endTrqu;
	private long beginTrPrc;
	private long endTrPrc;
	private int beginLstgStCnt;
	private int endLstgStCnt;
	private long beginMrktTotAmt;
	private long endMrktTotAmt;
}
