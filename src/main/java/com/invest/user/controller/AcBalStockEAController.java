package com.invest.user.controller;

import org.springframework.stereotype.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import com.invest.config.SecurityUser;
import com.invest.stock.dto.OrderStockDto;
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
		String userid = user.getUsers().getUserid();

		UserAccountInfo info = accountBalanceService.getUserBalance(user.getUsers().getAccountid());
		List<OrderStockDto> cList = tradeService.cancelTradeList(userid);
		
		m.addAttribute("userid",userid);
		m.addAttribute("Balance", info);
		m.addAttribute("cList", cList);

		List<StockQuantityDto> quan = stockQuantityService.getOrderPrice(userid);

		m.addAttribute("StockEA", quan);
		return "mypage/Mypage";

	}
	

	@GetMapping("/Stocksell")
	public String stocksell(@AuthenticationPrincipal SecurityUser user, Model m) {
		List<StockQuantityDto> quan = stockQuantityService.getStockByUserid(user.getUsers().getUserid());

		m.addAttribute("quantity", quan);
		return "StockSellPage/Stocksell";
	}

	@GetMapping("/StocksellDc")
	public String stocksellDc(@AuthenticationPrincipal SecurityUser user, Model m, String srtnCd, int tradeNo) {
		System.out.println(user.getUsers().getUserid() + srtnCd + tradeNo);
		StockQuantityDto quan = stockQuantityService.getStockByUserid(user.getUsers().getUserid(), srtnCd, tradeNo);
		System.out.println("quan::" + quan);
		m.addAttribute("tradeNo", tradeNo);
		m.addAttribute("CPstock", quan);
		return "StockSellPage/StocksellDc";
	}
	

	@PostMapping("/Stocksellcheck") 
	public String stocksellcheck(@ModelAttribute("order") StockQuantityDto dto,  @AuthenticationPrincipal SecurityUser user, Model m,String srtnCd,int tradeNo,int quantity) {
		StockQuantityDto quan = stockQuantityService.getStockByUserid(user.getUsers().getUserid(), srtnCd,tradeNo);
		m.addAttribute("quan",quan);
		m.addAttribute("srtnCd",srtnCd);
		m.addAttribute("tradeNo",tradeNo);
		m.addAttribute("quantity",quantity);
		
		return "StockSellPage/Stocksellcheck";
	}

	// 정말 판매하시겠습니까? 예를 누를 시 주식 매도
	@PostMapping("/StocksellCP")
	public String stocksellCP(@ModelAttribute("order") StockQuantityDto dto, @AuthenticationPrincipal SecurityUser user,
			Model m, String srtnCd, int tradeNo, int quantity) {
		String userid = user.getUsers().getUserid();
		tradeService.stockSellTrade(userid, dto);
		return "StockSellPage/StocksellCP";

	}

	// 지정가 거래 취소
	@GetMapping("/cancelTrade")
	public String cancelTrade(@AuthenticationPrincipal SecurityUser user, OrderStockDto dto, int no) {
		String userid = user.getUsers().getUserid();
		dto.setUserid(userid);
		System.out.println("cancelTrade 호출");
		tradeService.cancelTrade(dto);
		return "redirect:/Mypage";
	}

}