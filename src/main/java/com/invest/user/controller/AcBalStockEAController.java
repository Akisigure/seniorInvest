package com.invest.user.controller;

import org.springframework.stereotype.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.support.SessionStatus;

import com.invest.config.SecurityUser;
import com.invest.stock.dto.StockQuantityDto;
import com.invest.stock.service.StockQuantityService;
import com.invest.user.dto.UserAccountInfo;
import com.invest.user.service.AccountBalanceService;

@Controller
public class AcBalStockEAController {

	@Autowired
	AccountBalanceService accountBalanceService;
	@Autowired
	StockQuantityService stockQuantityService;

	@GetMapping("/Mypage")
	public String MyPage(@AuthenticationPrincipal SecurityUser user, Model m) {
		// System.out.println(user.getUsers().getAccountid());

		UserAccountInfo info = accountBalanceService.getUserBalance(user.getUsers().getAccountid());

		m.addAttribute("Balance", info);

		List<StockQuantityDto> quan = stockQuantityService.getStockByUserid(user.getUsers().getUserid());

		m.addAttribute("StockEA", quan);
		return "mypage/Mypage";

	}

	@GetMapping("/Stocksell")
	public String stocksell(@AuthenticationPrincipal SecurityUser user, Model m) {
		List<StockQuantityDto> quan = stockQuantityService.getStockByUserid(user.getUsers().getUserid());

		m.addAttribute("StockEA", quan);
		return "StockSellPage/Stocksell";
	}

	@GetMapping("/StocksellDc")
	public String stocksellDc(@AuthenticationPrincipal SecurityUser user, Model m) {
		List<StockQuantityDto> quan = stockQuantityService.getStockByUserid(user.getUsers().getUserid());

		m.addAttribute("CPstock", quan);
		return "StockSellPage/StocksellDc";
	}

	@GetMapping("/Stocksellcheck")
	public String stocksellcheck() {
		return "StockSellPage/Stocksellcheck";
	}

	@GetMapping("/StocksellCP")
	public String stocksellCP() {

		return "StockSellPage/StocksellCP";

	}

}