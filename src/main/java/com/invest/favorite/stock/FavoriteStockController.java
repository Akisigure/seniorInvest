package com.invest.favorite.stock;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/favoriteStock")
public class FavoriteStockController {

	@Autowired
	FavoriteStockService favoriteStockService;

	@PostMapping("/addfavoriteStock")
	public int addFavoriteStock(@RequestBody FavoriteStockDto favoriteStockDto) {
	    return favoriteStockService.addFavoriteStock(favoriteStockDto);
	}


	/*
	 * @GetMapping("/getfavoriteStock") public List<FavoriteStockDto>
	 * getFavoriteStocks(String userid, String accountId) { return
	 * favoriteStockService.getFavoriteStocks("user1", "acc1"); }
	 */

	@GetMapping("/getfavoriteStock")
	public List<FavoriteStockDto> getFavoriteStocks(@RequestParam String userid, @RequestParam String accountId) {
		return favoriteStockService.getFavoriteStocks("user1", "acc1");
	}

	@DeleteMapping("/removefavoriteStock/{no}")
	public int removeFavoriteStock(@PathVariable int no) {
		return favoriteStockService.removeFavoriteStock(no);
	}

	public FavoriteStockController(FavoriteStockService favoriteStockService) {
		this.favoriteStockService = favoriteStockService;
	}

	/*
	 * 실제로 작동할 코드
	 * 
	 * @PostMapping("/favorite/stock/{userid}/{accountId}/{itmsNm}") public void
	 * addOrRemoveFavorite(@PathVariable String userid, @PathVariable String
	 * accountId, @PathVariable String itmsNm) {
	 * favoriteStockService.addOrRemoveFavorite(userid, accountId, itmsNm); }
	 */

	// 임시코드
	@PostMapping("/favorite/stock/{userid}/{accountId}/{itmsNm}")
	public void addOrRemoveFavorite(@PathVariable String userid, @PathVariable String accountId,
	        @PathVariable String itmsNm) {
	    favoriteStockService.addOrRemoveFavorite(userid, accountId, itmsNm);
	}


}
