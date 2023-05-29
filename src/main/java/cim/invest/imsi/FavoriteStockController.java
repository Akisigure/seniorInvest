package cim.invest.imsi;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FavoriteStockController {
    private final FavoriteStockDAO favoriteStockDAO;

    @Autowired
    public FavoriteStockController(FavoriteStockDAO favoriteStockDAO) {
        this.favoriteStockDAO = favoriteStockDAO;
    }

    @GetMapping("/fs")
    public String showFavoriteStocks(Model model) {
        List<FavoriteStock> favoriteStocks = favoriteStockDAO.getAllFavoriteStocks();
        model.addAttribute("favoriteStocks", favoriteStocks);
        return "favoriteStocks";
    }
}
