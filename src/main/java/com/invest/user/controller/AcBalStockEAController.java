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

	@GetMapping("/Mypage")
	public String MyPage(@AuthenticationPrincipal SecurityUser user, Model m) {
		// System.out.println(user.getUsers().getAccountid());

		UserAccountInfo info = accountBalanceService.getUserBalance(user.getUsers().getAccountid());

		m.addAttribute("Balance", info);

		List<StockQuantityDto> quan = stockQuantityService.getOrderPrice(user.getUsers().getUserid());

		m.addAttribute("StockEA", quan);
		return "mypage/Mypage";

	}



	@GetMapping("/StocksellDc")
	public String stocksellDc(@AuthenticationPrincipal SecurityUser user, Model m, String srtnCd,int tradeNo) {
		System.out.println(user.getUsers().getUserid()+ srtnCd+tradeNo);
		StockQuantityDto quan = stockQuantityService.getStockByUserid(user.getUsers().getUserid(), srtnCd,tradeNo);
		System.out.println("quan::"+quan);
		m.addAttribute("tradeNo",tradeNo);
		m.addAttribute("CPstock", quan);
		return "StockSellPage/StocksellDc";
	}

	@PostMapping("/Stocksellcheck")  //Stocksellcheck
	public String stocksellcheck(@ModelAttribute("order") StockQuantityDto dto,  @AuthenticationPrincipal SecurityUser user, Model m,String srtnCd,int tradeNo,int quantity) {
		StockQuantityDto quan = stockQuantityService.getStockByUserid(user.getUsers().getUserid(), srtnCd,tradeNo);
		m.addAttribute("quan",quan);
		m.addAttribute("srtnCd",srtnCd);
		m.addAttribute("tradeNo",tradeNo);
		m.addAttribute("quantity",quantity);
		
		return "StockSellPage/Stocksellcheck";
	}
 
	@PostMapping("/StocksellCP")
	public String stocksellCP(@ModelAttribute("order") StockQuantityDto dto,  @AuthenticationPrincipal SecurityUser user, Model m,String srtnCd,int tradeNo,int quantity) {
		String userid = user.getUsers().getUserid();
		tradeService.stockSellTrade(userid, dto, tradeNo, quantity,srtnCd);
		return "StockSellPage/StocksellCP";

	}
	@GetMapping("/mypage_test")
	public String mypage_test () {
		return "mypage/mypage_test";
	}

}