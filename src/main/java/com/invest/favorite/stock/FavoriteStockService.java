package com.invest.favorite.stock;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class FavoriteStockService {

    @Autowired
    FavoriteStockDao favoriteStockDao;

    public int addFavoriteStock(FavoriteStockDto favoriteStockDto) {
        return favoriteStockDao.addFavoriteStock(favoriteStockDto);
    }

    public List<FavoriteStockDto> getFavoriteStocks(String userid, String accountId) {
        List<FavoriteStockDto> favoriteStocks = favoriteStockDao.getFavoriteStocks(userid, accountId);
        return favoriteStocks.stream()
            .map(stock -> {
                stock.setFavorited(true); // 이미 즐겨찾기에 저장된 경우 favorited 값을 true로 설정
                return stock;
            })
            .collect(Collectors.toList());
    }


    public int removeFavoriteStock(int no) {
        return favoriteStockDao.removeFavoriteStock(no);
    }

    public void addOrRemoveFavorite(String userid, String accountId, String itmsNm) {
        Optional<FavoriteStockDto> favoriteStock = favoriteStockDao.findByUserIdAndAccountIdAnditmsNm(userid, accountId, itmsNm);
        if (!favoriteStock.isPresent()) {
            // Favorite does not exist yet, create a new one
            FavoriteStockDto newFavoriteStock = FavoriteStockDto.builder()
                    .userid(userid)
                    .accountId(accountId)
                    .itmsNm(itmsNm)
                    .isFavorited(false)
                    .build();
            favoriteStockDao.addFavoriteStock(newFavoriteStock);
        } else {
            // Favorite exists already, delete it
            favoriteStockDao.removeFavoriteStock(favoriteStock.get().getNo());
        }
    }
}
