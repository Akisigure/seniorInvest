package com.invest.stock;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StockInfo {
    private Long id;
    private int srtnCd;
    private String itmsNm;
    private int clpr;
    private int vs;
    private double fltRt;
    private int mkp;
    private int hipr;
    private int lopr;
    private int trqu;
    private int trPrc;
    private int lstgStCnt;
    private int mrktTotAmt;
}
