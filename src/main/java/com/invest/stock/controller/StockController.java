package com.invest.stock.controller;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.invest.stock.dto.StockDto;
import com.invest.stock.service.StockService;
import com.invest.stock.service.StockWarningService;

@Controller
public class StockController {

	@Autowired
	StockService service;
	
	@Autowired
	StockWarningService tradeService;
	
	  @GetMapping("/getStockPriceInfo")
	  public String stockDetailPage() throws Exception {
		  
		  service.stockInsert();
		
			return "redirect:";
	        
	    }

	@GetMapping("/stockSearch")
	public String stockSearch() {
		return "stock/stockSearch";
	}
	
	@PostMapping("/ajax/stockSearch")
	@ResponseBody
	public Map<String, Object> stockSearch(@RequestParam Map<String, Object> paramMap) {
		
		List<Map<String,Object>> resultList = service.stockSearchResult(paramMap);
		paramMap.put("resultList", resultList);
		
		return paramMap;
	}
	
	@PostMapping("/stockDetail")
	public String stockDetail(String itmsNm,StockDto stock, Model m) {
		
		System.out.println("itmsNm"+itmsNm);
		
		StockDto detail = service.stockDetailInfo(stock);
		m.addAttribute("APIKEY",service.getAPIKEY());
		m.addAttribute("itmsNm",itmsNm);
		m.addAttribute("detail",detail);
		
		return "stock/stockDetail";
	}
	
	@GetMapping("/updateStocks")
	public String updateTest() throws Exception {
		service.updateLastestStock();
		return "redirect:";
	}
	
	@PostMapping("/stockBuy")
	public String stockBuyPage(String srtnCd,String itmsNm,StockDto stock, Model m) {
		
		StockDto detail = service.stockDetailInfo(stock);
		
		m.addAttribute("srtnCd",srtnCd);
		m.addAttribute("itmsNm",itmsNm);
		m.addAttribute("detail",detail);
		
		int count = tradeService.warningStock(srtnCd);
		
		if(count == 1) {
			return "stock/warning";
		}else { 
			return "stock/stockBuy";
		}
		
	}
	
	
	@PostMapping("/AgreeStockBuy")
	public String AgreeStockBuy(String srtnCd,String itmsNm,StockDto stock , Model m) {
		
		StockDto detail = service.stockDetailInfo(stock);
		
		m.addAttribute("srtnCd",srtnCd);
		m.addAttribute("itmsNm",itmsNm);
		m.addAttribute("detail",detail);
		
		return "stock/stockBuy";
	}
	

	
	
	
	
	

}
