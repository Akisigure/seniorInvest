// FavoriteStockController.java
package com.invest.favorite.stock;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller 
@RequestMapping("/favoriteStock")
public class FavoriteStockController {

    private final FavoriteStockService favoriteStockService;

    @Autowired
    public FavoriteStockController(FavoriteStockService favoriteStockService) {
        this.favoriteStockService = favoriteStockService;
    }

    @GetMapping 
    public String favoriteStock(Model model) {
        String userid = "user1";  // Hardcoded User ID
        String accountId = "acc1";  // Hardcoded Account ID
        List<FavoriteStockDto> favoriteStocks = favoriteStockService.getFavoriteStocks(userid, accountId);
        model.addAttribute("favoriteStocks", favoriteStocks);
        return "stock/stockFavorit";  // Updated: return value to the View name
    }

    @PostMapping("/addfavoriteStock")
    public int addFavoriteStock(@RequestBody FavoriteStockDto favoriteStockDto) {
        return favoriteStockService.addFavoriteStock(favoriteStockDto);
    }

    @GetMapping("/getfavoriteStock")
    public List<FavoriteStockDto> getFavoriteStocks(@RequestParam String userid, @RequestParam String accountId) {
        return favoriteStockService.getFavoriteStocks("user1", "acc1");
    }

    @DeleteMapping("/removefavoriteStock/{no}")
    public int removeFavoriteStock(@PathVariable int no) {
        return favoriteStockService.removeFavoriteStock(no);
    }

    @PostMapping("/favorite/stock/{userid}/{accountId}/{itmsNm}")
    public void addOrRemoveFavorite(@PathVariable String userid, @PathVariable String accountId,
                                    @PathVariable String itmsNm) {
        favoriteStockService.addOrRemoveFavorite(userid, accountId, itmsNm);
    }
}
