package com.invest.favorite.stock;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.invest.stock.dto.StockDto;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.security.Principal;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/favoriteStock")
public class FavoriteStockController {
    private final FavoriteStockService favoriteStockService;

    @Autowired
    public FavoriteStockController(FavoriteStockService favoriteStockService) {
        this.favoriteStockService = favoriteStockService;
    }

    @ModelAttribute
    public void addAttributes(Model model, Principal principal) {
        if (principal != null) {
            String username = principal.getName();
            model.addAttribute("username", username);
            model.addAttribute("userid", username);
        }
    }
    

    @PostMapping("/addOrRemoveFavorite")
    public ResponseEntity<FavoriteStockDto> addOrRemoveFavorite(@RequestBody FavoriteStockDto favoriteStockDto) {
        favoriteStockService.addOrRemoveFavorite(favoriteStockDto);
        Optional<FavoriteStockDto> favoriteStock = favoriteStockService.findByUserIdAndAccountIdAndItmsNm(
                favoriteStockDto.getUserid(), favoriteStockDto.getAccountId(), favoriteStockDto.getItmsNm(),
                favoriteStockDto.getVs(), favoriteStockDto.getFltRt(), favoriteStockDto.getMkp());
        return ResponseEntity.ok(favoriteStock.orElse(null));
    }

    @GetMapping("/stockFavorites")
    public String stockFavorites(Model model, Principal principal) {
        String userId = principal != null ? principal.getName() : null;
        List<StockDto> favoriteStocks = favoriteStockService.getFavoriteStocks(userId);
        model.addAttribute("favoriteStocks", favoriteStocks);
        return "stock/stockFavorites";
    }
    
    @GetMapping("/getFavorites")
    public ResponseEntity<List<FavoriteStockDto>> getFavorites(Principal principal) {
        String userId = principal != null ? principal.getName() : null;
        List<FavoriteStockDto> favoriteStocks = favoriteStockService.getFavorites(userId);
        return ResponseEntity.ok(favoriteStocks);
    }

}

