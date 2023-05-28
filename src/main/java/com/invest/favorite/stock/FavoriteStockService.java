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
		return favoriteStocks.stream().map(favoriteStock -> {
			StockDto stock = new StockDto();
			stock.setItmsNm(favoriteStock.getItmsNm());
			stock.setFavorited(favoriteStock.isFavorited());
			// Add the following lines to set the correct fields
			stock.setVs(favoriteStock.getVs());
			stock.setFltRt(favoriteStock.getFltRt());
			stock.setMkp(favoriteStock.getMkp());
			stock.setVs(favoriteStock.getVs());
			stock.setMkp(favoriteStock.getMkp());
			stock.setVs(favoriteStock.getVs());
			return stock;
		}).collect(Collectors.toList());
	}

	public int removeFavoriteStock(int no) {
		return favoriteStockDao.removeFavoriteStock(no);
	}

	public void addOrRemoveFavorite(FavoriteStockDto favoriteStockDto) {
		Optional<FavoriteStockDto> favoriteStock = favoriteStockDao.findByUserIdAndAccountIdAnditmsNm(
				favoriteStockDto.getUserid(), favoriteStockDto.getAccountId(), favoriteStockDto.getItmsNm(),favoriteStockDto.getVs(),favoriteStockDto.getFltRt(),favoriteStockDto.getMkp());
		if (!favoriteStock.isPresent()) {
			FavoriteStockDto newFavoriteStock = FavoriteStockDto.builder()
					.userid(favoriteStockDto.getUserid())
					.accountId(favoriteStockDto.getAccountId())
					.itmsNm(favoriteStockDto.getItmsNm()).favorited(true)
					.vs(favoriteStockDto.getVs())
					.fltRt(favoriteStockDto.getFltRt())
					.mkp(favoriteStockDto.getMkp())
					.build();
			favoriteStockDao.addFavoriteStock(newFavoriteStock);
		} else {
			FavoriteStockDto existingFavoriteStock = favoriteStock.get();
			existingFavoriteStock.setFavorited(!existingFavoriteStock.isFavorited());
			favoriteStockDao.updateFavoriteStock(existingFavoriteStock);
		}
	}

	public Optional<FavoriteStockDto> findByUserIdAndAccountIdAnditmsNm(String userid, String accountId,
			String itmsNm, int vs, double fltrt, int mkp) {
		return favoriteStockDao.findByUserIdAndAccountIdAnditmsNm(userid, accountId, itmsNm, vs, fltrt, mkp);
	}

}
