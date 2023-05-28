package com.invest.favorite.stock;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FavoriteStockDto {
    private int no;
    private String userid;
    private String accountId;
    private String itmsNm;
    private int vs;
	private double fltRt;
	private int mkp;
    private boolean favorited;

    public boolean isFavorited() {
        return favorited;
    }

    public void setFavorited(boolean favorited) {
        this.favorited = favorited;
    }
}