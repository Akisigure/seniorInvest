package cim.invest.imsi;

import lombok.Data;

@Data
public class FavoriteStock {
    private int no;
    private String userId;
    private String accountId;
    private String itmsNm;
    private int vs;
    private double fltRt;
    private int mkp;
    private boolean favorited;
}
