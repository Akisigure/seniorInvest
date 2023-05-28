package com.invest.favorite.stock;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.invest.stock.dto.StockDto;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class FavoriteStockService {

	private final FavoriteStockDao favoriteStockDao;

	@Autowired
	public FavoriteStockService(FavoriteStockDao favoriteStockDao) {
		this.favoriteStockDao = favoriteStockDao;
	}

	public int addFavoriteStock(FavoriteStockDto favoriteStockDto) {
		return favoriteStockDao.addFavoriteStock(favoriteStockDto);
	}

	public List<StockDto> getFavoriteStocks(String userid, String accountId) {
		List<FavoriteStockDto> favoriteStocks = favoriteStockDao.getFavoriteStocks(userid);
		return favoriteStocks.stream().map(favoriteStock -> {
			StockDto stock = new StockDto();
			stock.setItmsNm(favoriteStock.getItmsNm());
			stock.setFavorited(favoriteStock.isFavorited());
			return stock;
		}).collect(Collectors.toList());
	}

	public int removeFavoriteStock(int no) {
		return favoriteStockDao.removeFavoriteStock(no);
	}

	public void addOrRemoveFavorite(FavoriteStockDto favoriteStockDto) {
		Optional<FavoriteStockDto> favoriteStock = favoriteStockDao.findByUserIdAndAccountIdAnditmsNm(
				favoriteStockDto.getUserid(), favoriteStockDto.getAccountId(), favoriteStockDto.getItmsNm());
		if (!favoriteStock.isPresent()) {
			FavoriteStockDto newFavoriteStock = FavoriteStockDto.builder().userid(favoriteStockDto.getUserid())
					.accountId(favoriteStockDto.getAccountId()).itmsNm(favoriteStockDto.getItmsNm()).favorited(true)																											// 설정
					.build();
			favoriteStockDao.addFavoriteStock(newFavoriteStock);
		} else {
			FavoriteStockDto existingFavoriteStock = favoriteStock.get();
			existingFavoriteStock.setFavorited(!existingFavoriteStock.isFavorited());
			favoriteStockDao.updateFavoriteStock(existingFavoriteStock);
		}
	}

	public Optional<FavoriteStockDto> findByUserIdAndAccountIdAnditmsNm(String userid, String accountId,
			String itmsNm) {
		return favoriteStockDao.findByUserIdAndAccountIdAnditmsNm(userid, accountId, itmsNm);
	}

	public List<FavoriteStockDto> getFavoriteStocks(String userid) {
		return favoriteStockDao.getFavoriteStocks(userid);
	}

}
