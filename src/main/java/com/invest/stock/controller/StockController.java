package com.invest.stock.controller;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.invest.config.SecurityUser;
import com.invest.stock.dto.StockDto;
import com.invest.stock.service.StockService;
import com.invest.stock.service.StockTradeService;
import com.invest.stock.service.StockWarningService;

@Controller
public class StockController {

	@Autowired
	StockService service;
	
	@Autowired
	StockWarningService warningService;
	
	@Autowired
	StockTradeService tradeService;
	
	//DB저장용 최초 실행 코드 한번만 호출해야 함
	  @GetMapping("/admin/getStockPriceInfo")
	  public String stockDetailPage() throws Exception {
		  
		  service.stockInsert();
		
			return "redirect:";
	        
	    }

	//주식 검색 페이지
	@GetMapping("/stockSearch")
	public String stockSearch() {
		return "stock/stockSearch";
	}
	
	//주식 검색 자동완성
	@PostMapping("/ajax/stockSearch")
	@ResponseBody
	public Map<String, Object> stockSearch(@RequestParam Map<String, Object> paramMap) {
		
		List<Map<String,Object>> resultList = service.stockSearchResult(paramMap);
		paramMap.put("resultList", resultList);
		paramMap.put("isStockExist", resultList.size() > 0);
		
		return paramMap;
	}
	


	@GetMapping("/stockDetail")
	public String stockDetail( String itmsNm,StockDto stock, Model m,String SrtnCd) {
		
		System.out.println("itmsNm : "+itmsNm);
		
		StockDto detail = service.stockDetailInfo(stock);
		
		m.addAttribute("APIKEY",service.getAPIKEY());
		m.addAttribute("itmsNm",itmsNm);
		m.addAttribute("srtnCd",SrtnCd);
		m.addAttribute("detail",detail);
		
		return "stock/stockDetail";
	}
	
	@RequestMapping("/stockBuy")
	public String stockBuyPage(String srtnCd,String itmsNm,StockDto stock, Model m,@AuthenticationPrincipal SecurityUser user) {
		
		String userid = user.getUsers().getUserid();
		StockDto detail = service.stockDetailInfo(stock);
		long balance = tradeService.balanceInfo(userid);
		
		m.addAttribute("srtnCd",srtnCd);
		m.addAttribute("itmsNm",itmsNm);
		m.addAttribute("detail",detail);
		m.addAttribute("balance",balance);
		
		int count = warningService.warningStock(srtnCd);
		
		if(count >= 1) {
			return "stock/warning"; //유의종목일 시 이동
		}else { 
			return "stock/stockBuy";
		}
		
	}
	
	
	@RequestMapping("/AgreeStockBuy")
	public String AgreeStockBuy(String srtnCd,String itmsNm,StockDto stock , Model m,@AuthenticationPrincipal SecurityUser user) {
		
		String userid = user.getUsers().getUserid();
		StockDto detail = service.stockDetailInfo(stock);
		long balance = tradeService.balanceInfo(userid);
		m.addAttribute("srtnCd",srtnCd);
		m.addAttribute("itmsNm",itmsNm);
		m.addAttribute("detail",detail);
		m.addAttribute("balance",balance);
		
		return "stock/stockBuy";
	}
	
	@GetMapping("/stockMainview")
	public String stockMainview(Model model) {
	    List<StockDto> stockMainview = service.stockMainview();
	    model.addAttribute("stockMainview", stockMainview);
	    return "stock/stockMainview";
	}
	
	@GetMapping("/admin/LastestStockPriceUpdate")
	public String lastestStockPriceUpdate() throws Exception {
		service.updateLastestStock();
		return "redirect:/";
	}

	@GetMapping("/admin/stockPriceUpdate")
	public String stockPriceUpdate() throws Exception {
		service.updateStock();
		return "redirect:/";
	}
	
	
	
	
	

}