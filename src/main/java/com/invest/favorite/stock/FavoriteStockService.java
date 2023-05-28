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

	public List<StockDto> getFavoriteStocks(String userid) {
		List<FavoriteStockDto> favoriteStocks = favoriteStockDao.getFavoriteStocks(userid);
		return favoriteStocks.stream().map(this::convertToStockDto).collect(Collectors.toList());
	}

	private StockDto convertToStockDto(FavoriteStockDto favoriteStock) {
		StockDto stock = new StockDto();
		stock.setItmsNm(favoriteStock.getItmsNm());
		stock.setFavorited(favoriteStock.isFavorited());
		stock.setVs(favoriteStock.getVs());
		stock.setFltRt(favoriteStock.getFltRt());
		stock.setMkp(favoriteStock.getMkp());
		return stock;
	}

	public void addOrRemoveFavorite(FavoriteStockDto favoriteStockDto) {
		Optional<FavoriteStockDto> favoriteStock = favoriteStockDao.findByUserIdAndAccountIdAndItmsNm(
				favoriteStockDto.getUserid(), favoriteStockDto.getAccountId(), favoriteStockDto.getItmsNm(),
				favoriteStockDto.getVs(), favoriteStockDto.getFltRt(), favoriteStockDto.getMkp());
		if (favoriteStock.isPresent()) {
			FavoriteStockDto existingFavoriteStock = favoriteStock.get();
			existingFavoriteStock.setFavorited(!existingFavoriteStock.isFavorited());
			favoriteStockDao.updateFavoriteStock(existingFavoriteStock);
		} else {
			favoriteStockDto.setFavorited(true);
			favoriteStockDao.addFavoriteStock(favoriteStockDto);
		}
	}

	public Optional<FavoriteStockDto> findByUserIdAndAccountIdAndItmsNm(String userid, String accountId, String itmsNm,
			int vs, double fltRt, int mkp) {
		return favoriteStockDao.findByUserIdAndAccountIdAndItmsNm(userid, accountId, itmsNm, vs, fltRt, mkp);
	}
}
