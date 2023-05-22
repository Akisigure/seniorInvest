package com.invest.user.controller;

import org.springframework.stereotype.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import com.invest.config.SecurityUser;
import com.invest.stock.dto.StockQuantityDto;
import com.invest.stock.service.StockQuantityService;
import com.invest.stock.service.StockTradeService;
import com.invest.user.dto.UserAccountInfo;
import com.invest.user.service.AccountBalanceService;

@Controller
public class AcBalStockEAController {

    @Autowired
    AccountBalanceService accountBalanceService;

    @Autowired
    StockQuantityService stockQuantityService;

    @Autowired
    StockTradeService tradeService;

    @GetMapping("/mypage")
    public String myPage(@AuthenticationPrincipal SecurityUser user, Model model) {
        if (user != null && user.getUsers() != null) {
            UserAccountInfo info = accountBalanceService.getUserBalance(user.getUsers().getAccountid());
            model.addAttribute("Balance", info);
            List<StockQuantityDto> quan = stockQuantityService.getStockByUserid(user.getUsers().getUserid());
            model.addAttribute("StockEA", quan);
        }
        return "mypage/Mypage";
    }

    @GetMapping("/Stocksell")
    public String stocksell(@AuthenticationPrincipal SecurityUser user, Model m) {
        if (user != null && user.getUsers() != null) {
            List<StockQuantityDto> quan = stockQuantityService.getStockByUserid(user.getUsers().getUserid());
            m.addAttribute("quantity", quan);
        }
        return "StockSellPage/Stocksell";
    }

    @GetMapping("/StocksellDc")
    public String stocksellDc(@AuthenticationPrincipal SecurityUser user, Model m, String srtnCd, int tradeNo) {
        if (user != null && user.getUsers() != null) {
            StockQuantityDto quan = stockQuantityService.getStockByUserid(user.getUsers().getUserid(), srtnCd, tradeNo);
            m.addAttribute("tradeNo", tradeNo);
            m.addAttribute("CPstock", quan);
        }
        return "StockSellPage/StocksellDc";
    }

    @PostMapping("/Stocksellcheck")
    public String stocksellcheck(@ModelAttribute("order") StockQuantityDto dto, @AuthenticationPrincipal SecurityUser user, Model m, String srtnCd, int tradeNo, int quantity) {
        if (user != null && user.getUsers() != null) {
            StockQuantityDto quan = stockQuantityService.getStockByUserid(user.getUsers().getUserid(), srtnCd, tradeNo);
            m.addAttribute("quan", quan);
            m.addAttribute("srtnCd", srtnCd);
            m.addAttribute("tradeNo", tradeNo);
            m.addAttribute("quantity", quantity);
        }
        return "StockSellPage/Stocksellcheck";
    }

    @PostMapping("/StocksellCP")
    public String stocksellCP(@ModelAttribute("order") StockQuantityDto dto, @AuthenticationPrincipal SecurityUser user, Model m, String srtnCd, int tradeNo, int quantity) {
        if (user != null && user.getUsers() != null) {
            String userid = user.getUsers().getUserid();
            tradeService.stockSellTrade(userid, dto, tradeNo, quantity, srtnCd);
        }
        return "StockSellPage/StocksellCP";
    }

}
