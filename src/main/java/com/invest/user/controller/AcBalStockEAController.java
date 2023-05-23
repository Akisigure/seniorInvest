package com.invest.user.controller;

import org.springframework.stereotype.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
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
	@GetMapping("/mypage_test")
	public String mypage_test() {
		return "mypage/mypage_test";

	}

	@GetMapping("/Stocksell")
	public String stocksell(@AuthenticationPrincipal SecurityUser user, Model m) {
		List<StockQuantityDto> quan = stockQuantityService.getStockByUserid(user.getUsers().getUserid());

		m.addAttribute("StockEA", quan);
		return "StockSellPage/Stocksell";
	}

	@GetMapping("/StocksellDc")
	public String stocksellDc(@AuthenticationPrincipal SecurityUser user, Model m, String srtnCd) {
		StockQuantityDto quan = stockQuantityService.getStockByUserid(user.getUsers().getUserid(), srtnCd);

		m.addAttribute("CPstock", quan);
		return "StockSellPage/StocksellDc";
	}

	@PostMapping("/Stocksellcheck")  //Stocksellcheck
	public String stocksellcheck(@ModelAttribute("order") StockQuantityDto dto,  @AuthenticationPrincipal SecurityUser user, Model m) {
	
	
		return "StockSellPage/Stocksellcheck";
	}

	@GetMapping("/StocksellCP")
	public String stocksellCP(@ModelAttribute("order") StockQuantityDto dto,  @AuthenticationPrincipal SecurityUser user, Model m) {

		return "StockSellPage/StocksellCP";

	}

}