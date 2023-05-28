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
        }
    }

    @GetMapping
    public String favoriteStock(Model model, HttpServletRequest request, Principal principal) {
        HttpSession session = request.getSession();
        String userid = (String) session.getAttribute("userid");

        if (userid != null || principal != null) {
            userid = userid != null ? userid : principal.getName();
            List<StockDto> favoriteStocks = favoriteStockService.getFavoriteStocks(userid);
            model.addAttribute("favoriteStocks", favoriteStocks);
        } else {
            model.addAttribute("message", "로그인 후에 즐겨찾기에 추가할 수 있습니다.");
        }

        return "stock/stockFavorite";
    }

    @PostMapping("/addOrRemoveFavorite")
    public ResponseEntity<FavoriteStockDto> addOrRemoveFavorite(@RequestBody FavoriteStockDto favoriteStockDto) {
        favoriteStockService.addOrRemoveFavorite(favoriteStockDto);
        // Check the status of the favorite stock after operation
        Optional<FavoriteStockDto> favoriteStock = favoriteStockService.findByUserIdAndAccountIdAndItmsNm(
                favoriteStockDto.getUserid(), favoriteStockDto.getAccountId(), favoriteStockDto.getItmsNm(),
                favoriteStockDto.getVs(), favoriteStockDto.getFltRt(), favoriteStockDto.getMkp());
        return ResponseEntity.ok(favoriteStock.orElse(null));
    }

    @GetMapping("/getFavorites")
    public ResponseEntity<List<StockDto>> getFavorites(@RequestParam String userid) {
        List<StockDto> favorites = favoriteStockService.getFavoriteStocks(userid);
        return ResponseEntity.ok(favorites);
    }
}
