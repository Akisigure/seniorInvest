package com.invest.favorite.stock;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.invest.stock.dto.StockDto;
import com.invest.user.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/favoriteStock")
public class FavoriteStockController {
    private final FavoriteStockService favoriteStockService;
    private final UserService userService;

    @Autowired
    public FavoriteStockController(FavoriteStockService favoriteStockService, UserService userService) {
        this.favoriteStockService = favoriteStockService;
        this.userService = userService;
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
    

    @PostMapping("/addfavoriteStock")
    public ResponseEntity<Integer> addFavoriteStock(@RequestBody FavoriteStockDto favoriteStockDto) {
        int result = favoriteStockService.addFavoriteStock(favoriteStockDto);
        return ResponseEntity.ok(result);
    }

    @GetMapping("/getfavoriteStock")
    public List<StockDto> getFavoriteStocks(@RequestParam String userid) {
        return favoriteStockService.getFavoriteStocks(userid);
    }

    @DeleteMapping("/removefavoriteStock/{no}")
    public int removeFavoriteStock(@PathVariable int no) {
        return favoriteStockService.removeFavoriteStock(no);
    }

    @PostMapping("/addOrRemoveFavorite")
    public ResponseEntity<FavoriteStockDto> addOrRemoveFavorite(@RequestBody FavoriteStockDto favoriteStockDto) {
        favoriteStockService.addOrRemoveFavorite(favoriteStockDto);
        // Check the status of the favorite stock after operation
        Optional<FavoriteStockDto> favoriteStock = favoriteStockService.findByUserIdAndAccountIdAnditmsNm(
                favoriteStockDto.getUserid(), favoriteStockDto.getAccountId(), favoriteStockDto.getItmsNm(),favoriteStockDto.getMkp(),favoriteStockDto.getFltRt(),favoriteStockDto.getMkp());
        return ResponseEntity.ok(favoriteStock.orElse(null));
    }

    @GetMapping("/getFavorites")
    public ResponseEntity<List<StockDto>> getFavorites(@RequestParam String userid) {
        List<StockDto> favorites = favoriteStockService.getFavoriteStocks(userid);
        return ResponseEntity.ok(favorites);
    }

}
